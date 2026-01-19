import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/features/emotion/presentation/cubit/rafiq_game_cubit.dart';
import 'package:spectra/features/emotion/presentation/cubit/rafiq_game_state.dart';

class GameStatusCard extends StatelessWidget {
  const GameStatusCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RafiqGameCubit, RafiqGameState>(
      builder: (context, state) {
        String title;
        IconData icon;

        // Map Stage to UI
        switch (state.stage) {
          case GameStage.detectingHappy:
            title = "Happy Face";
            icon = Icons.sentiment_satisfied_alt;
            break;
          case GameStage.detectingNeutral:
            title = "Neutral Face";
            icon = Icons.sentiment_neutral;
            break;
          case GameStage.detectingSurprise:
            title = "Surprised Face";
            icon = Icons.sentiment_very_dissatisfied;
            break;
          case GameStage.detectingAngry:
            title = "Angry Face";
            icon = Icons.mood_bad;
            break;
          case GameStage.detectingSad:
            title = "Sad Face";
            icon = Icons.sentiment_dissatisfied;
            break;
          case GameStage.waitingTransition:
            title = "Good Job!";
            icon = Icons.thumb_up;
            break;
          case GameStage.finished:
            title = "All Done!";
            icon = Icons.star;
            break;
          default:
            title = "Loading...";
            icon = Icons.hourglass_empty;
        }

        return Column(
          children: [
            ClipRRect(
              borderRadius: ValuesManager.borderRadiusExtraLarge,
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  padding: ValuesManager.paddingDefault,
                  decoration: BoxDecoration(
                    color: ColorsManager.softBlack.withAlpha(217),
                    borderRadius: ValuesManager.borderRadiusExtraLarge,
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Row(
                    children: [
                      // Icon Circle
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const LinearGradient(
                            colors: [ColorsManager.softRose, Colors.pinkAccent],
                          ),
                        ),
                        child: Icon(icon, color: Colors.white, size: 32),
                      ),
                      const SizedBox(width: ValuesManager.spaceDefault),

                      // Text Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "TARGET EMOTION",
                              style: StylesManager.getCaption(
                                color: Colors.white60,
                              ).copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              title,
                              style: StylesManager.getHeadline3(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Progress Circle
                      if (state.stage != GameStage.finished &&
                          state.stage != GameStage.waitingTransition)
                        CircularProgressIndicator(
                          value: state.matchPercentage,
                          color: ColorsManager.softRose,
                          backgroundColor: Colors.white10,
                        ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              state.stage == GameStage.waitingTransition
                  ? "Get ready for the next one..."
                  : (state.stage == GameStage.finished
                        ? "You did it!"
                        : "Match the glowing lines!"),
              style: StylesManager.getBodyMedium(
                color: ColorsManager.cream.withAlpha(204),
              ).copyWith(fontWeight: FontWeight.w500),
            ),
          ],
        );
      },
    );
  }
}
