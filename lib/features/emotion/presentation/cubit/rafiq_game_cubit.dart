import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huawei_ml_body/huawei_ml_body.dart';
import 'package:permission_handler/permission_handler.dart';
import 'rafiq_game_state.dart';

class RafiqGameCubit extends Cubit<RafiqGameState> {
  MLBodyLensEngine? _lensEngine;
  Timer? _gameLoop;
  List<MLFace> _detectedFaces = [];
  
  // Logic Constants
  static const int _targetHoldTimeMs = 3000; // 3 Seconds to pass
  static const double _probThreshold = 0.6; // 60% confidence required
  
  int _currentHoldMs = 0;

  RafiqGameCubit() : super(const RafiqGameState());

  /// Initialize Camera & ML Engine
  Future<void> initialize() async {
    // 1. Request Permissions
    if (!await Permission.camera.request().isGranted) return;

    try {
      // 2. Setup Controller
      final controller = MLBodyLensController(
        transaction: BodyTransaction.face,
        lensType: MLBodyLensController.backLens,
      );

      // 3. Setup Engine
      _lensEngine = MLBodyLensEngine(controller: controller);
      _lensEngine!.setTransactor(_onTransaction);
      
      // 4. Start Stream
      int id = await _lensEngine!.init();
      _lensEngine!.run();

      // 5. Start Game: Begin with "Happy"
      emit(state.copyWith(stage: GameStage.detectingHappy, textureId: id));
      _startGameLoop();
    } catch (e) {
      print("Init Error: $e");
    }
  }

  /// Huawei Callback
  void _onTransaction({dynamic result}) {
    if (result is List<MLFace>) {
      _detectedFaces = result;
    }
  }

  /// The Game Loop (Runs every 100ms)
  void _startGameLoop() {
    _gameLoop = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      // Skip logic if we are finished or waiting between levels
      if (state.stage == GameStage.finished || 
          state.stage == GameStage.waitingTransition || 
          state.stage == GameStage.initial) return;

      bool isMatching = false;

      if (_detectedFaces.isNotEmpty) {
        final face = _detectedFaces.first;
        
        // CORRECTION HERE: Check if emotions is not null
        if (face.emotions != null) {
          // Pass the correctly typed object
          isMatching = _checkEmotionMatch(face.emotions!);
        }
      }

      // Update Hold Time Logic
      if (isMatching) {
        _currentHoldMs += 100;
      } else {
        if (_currentHoldMs > 0) _currentHoldMs -= 50; // Decay
      }

      double percentage = (_currentHoldMs / _targetHoldTimeMs).clamp(0.0, 1.0);

      // Check for Level Completion
      if (_currentHoldMs >= _targetHoldTimeMs) {
        _handleStageComplete();
      } else {
        // Update UI Progress
        emit(state.copyWith(matchPercentage: percentage, isMatchingEmotion: isMatching));
      }
    });
  }

  /// Helper: Checks the specific probability for the current stage
  /// FIXED: Parameter type is now MLFaceEmotion (Singular)
  bool _checkEmotionMatch(MLFaceEmotion emotions) {
    switch (state.stage) {
      case GameStage.detectingHappy: 
        return emotions.smilingProbability > _probThreshold;
      case GameStage.detectingNeutral: 
        return emotions.neutralProbability > _probThreshold;
      case GameStage.detectingAngry: 
        return emotions.angryProbability > _probThreshold;
      case GameStage.detectingSurprise: 
        return emotions.surpriseProbability > _probThreshold;
      case GameStage.detectingSad: 
        return emotions.sadProbability > _probThreshold;
      default: 
        return false;
    }
  }

  /// Handles moving to the next level
  void _handleStageComplete() {
    // 1. Determine Next Stage
    GameStage next;
    switch (state.stage) {
      case GameStage.detectingHappy: next = GameStage.detectingNeutral; break;
      case GameStage.detectingNeutral: next = GameStage.detectingSurprise; break;
      case GameStage.detectingSurprise: next = GameStage.detectingAngry; break;
      case GameStage.detectingAngry: next = GameStage.detectingSad; break;
      case GameStage.detectingSad: next = GameStage.finished; break;
      default: next = GameStage.finished;
    }

    if (next == GameStage.finished) {
      // Game Over - Victory
      emit(state.copyWith(
        stage: GameStage.finished, 
        matchPercentage: 1.0, 
        isMatchingEmotion: true
      ));
      _gameLoop?.cancel();
    } else {
      // Transition Phase (Wait 3 Seconds)
      emit(state.copyWith(
        stage: GameStage.waitingTransition,
        nextStage: next,
        matchPercentage: 1.0,
        isMatchingEmotion: true,
      ));

      Future.delayed(const Duration(seconds: 3), () {
        if (isClosed) return; // Safety check
        _currentHoldMs = 0; // Reset progress bar
        emit(state.copyWith(
          stage: next,
          matchPercentage: 0.0,
          isMatchingEmotion: false
        ));
      });
    }
  }

  Future<void> switchCamera() async => await _lensEngine?.switchCamera();
  
  @override
  Future<void> close() {
    _gameLoop?.cancel();
    _lensEngine?.release();
    return super.close();
  }
}