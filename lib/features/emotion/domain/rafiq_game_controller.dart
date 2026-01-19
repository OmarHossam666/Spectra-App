import 'dart:async';
import 'package:flutter/material.dart';
import 'package:huawei_ml_body/huawei_ml_body.dart';

class RafiqGameController extends ChangeNotifier {
  // --- Huawei Components ---
  MLBodyLensEngine? _lensEngine;
  int? _textureId; // Required for MLBodyLens widget
  
  // --- Game State ---
  List<MLFace> _faces = [];
  double _currentMatchPercentage = 0.0;
  bool _isStepSuccess = false;
  int _holdDurationMilliseconds = 0;
  
  // --- Configuration ---
  final int _targetHoldTime = 3000;
  final double _smileThreshold = 0.7;

  // --- Getters ---
  int? get textureId => _textureId;
  double get progress => _currentMatchPercentage;
  bool get isSuccess => _isStepSuccess;
  bool get isCameraReady => _textureId != null;

  /// Initialize based on "Body Recognitions With Camera Stream" doc
  Future<void> initialize() async {
    // 1. Create the Controller for FACE transaction
    final controller = MLBodyLensController(
      transaction: BodyTransaction.face, // Tells engine to detect faces
      lensType: MLBodyLensController.backLens,
    );

    // 2. Create the Engine
    _lensEngine = MLBodyLensEngine(controller: controller);

    // 3. Set the Transactor (Listener)
    _lensEngine!.setTransactor(_onTransaction);

    // 4. Initialize Texture (Async)
    // "Initialize the texture... Then the texture will be ready to stream"
    try {
      int id = await _lensEngine!.init();
      _textureId = id;
      
      // 5. Start the stream
      _lensEngine!.run();
      
      // 6. Configure Analyzer settings (Optional: enable emotions)
      // Sometimes required to ensure emotion fields are populated
      // We assume default engine setup enables this, or we configure separate analyzer if allowed.
      // For now, we rely on standard engine start.
      
      notifyListeners();
      _startGameLoop();
    } catch (e) {
      debugPrint("Huawei ML Body Init Error: $e");
    }
  }

  /// Callback from Huawei Engine
  void _onTransaction({dynamic result}) {
    // Result is dynamic, cast to List<MLFace>
    if (result is List<MLFace>) {
      _faces = result;
      // We don't notifyListeners here to keep UI smooth. 
      // The Game Loop handles the logic updates.
    }
  }

  /// The Referee Timer
  void _startGameLoop() {
    Timer.periodic(const Duration(milliseconds: 100), (timer) {
      if (_isStepSuccess) {
        timer.cancel();
        return;
      }

      if (_faces.isEmpty) {
        _decayProgress();
        return;
      }

      final face = _faces.first;
      
      // Accessing Emotions
      // Note: Ensure your MLFace object has this property populated.
      // If it's null, we default to 0.0
      double smileProb = face.emotions?.smilingProbability ?? 0.0;

      if (smileProb > _smileThreshold) {
        _incrementProgress();
      } else {
        _decayProgress();
      }
    });
  }

  void _incrementProgress() {
    if (_holdDurationMilliseconds < _targetHoldTime) {
      _holdDurationMilliseconds += 100;
      _updateProgress();
    } else if (!_isStepSuccess) {
      _isStepSuccess = true;
      notifyListeners();
    }
  }

  void _decayProgress() {
    if (_holdDurationMilliseconds > 0) {
      _holdDurationMilliseconds -= 50;
      _updateProgress();
    }
  }

  void _updateProgress() {
    _currentMatchPercentage = (_holdDurationMilliseconds / _targetHoldTime).clamp(0.0, 1.0);
    notifyListeners();
  }

  Future<void> switchCamera() async {
    if (_lensEngine != null) {
      await _lensEngine!.switchCamera();
    }
  }

  @override
  void dispose() {
    _lensEngine?.release();
    super.dispose();
  }
}