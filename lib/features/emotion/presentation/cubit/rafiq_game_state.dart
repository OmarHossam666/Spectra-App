import 'package:equatable/equatable.dart';

enum GameStage { 
  initial, 
  detectingHappy, 
  detectingNeutral,
  detectingSurprise,
  detectingAngry,
  detectingSad,
  waitingTransition, 
  finished 
}

class RafiqGameState extends Equatable {
  final GameStage stage;
  final GameStage? nextStage; // To remember where to go after the 3s wait
  final int? textureId;
  final double matchPercentage; 
  final bool isMatchingEmotion; 

  const RafiqGameState({
    this.stage = GameStage.initial,
    this.nextStage,
    this.textureId,
    this.matchPercentage = 0.0,
    this.isMatchingEmotion = false,
  });

  RafiqGameState copyWith({
    GameStage? stage,
    GameStage? nextStage,
    int? textureId,
    double? matchPercentage,
    bool? isMatchingEmotion,
  }) {
    return RafiqGameState(
      stage: stage ?? this.stage,
      nextStage: nextStage ?? this.nextStage,
      textureId: textureId ?? this.textureId,
      matchPercentage: matchPercentage ?? this.matchPercentage,
      isMatchingEmotion: isMatchingEmotion ?? this.isMatchingEmotion,
    );
  }

  @override
  List<Object?> get props => [stage, nextStage, textureId, matchPercentage, isMatchingEmotion];
}