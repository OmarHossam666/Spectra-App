import 'package:flutter/material.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/features/emotion/presentation/widgets/camera_layer.dart';
import 'package:spectra/features/emotion/presentation/widgets/rafiq_mouth_guide.dart';
import 'game_status_card.dart';
import 'sentiment_header_bar.dart';

class SentimentView extends StatelessWidget {
  const SentimentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.softBlack,
      body: Stack(
        children: [
          // 1. Camera Layer (Extracted)
          const CameraLayer(),

          // 2. Gradient Overlay (Kept inline as it's simple styling)
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    ColorsManager.softBlack.withAlpha(230),
                    Colors.transparent,
                    Colors.black12,
                  ],
                  stops: const [0.0, 0.4, 1.0],
                ),
              ),
            ),
          ),

          // 3. AR Guide
          const Center(child: RafiqDynamicGuide()),

          // 4. Header (Extracted)
          const Positioned(
            top: 0, 
            left: 0, 
            right: 0, 
            child: SentimentHeaderBar()
          ),

          // 5. Game Card
          Positioned(
            bottom: 40,
            left: ValuesManager.spaceDefault,
            right: ValuesManager.spaceDefault,
            child: const GameStatusCard(),
          ),
        ],
      ),
    );
  }
}