import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/features/emotion/presentation/cubit/rafiq_game_cubit.dart';
import 'package:spectra/features/emotion/presentation/cubit/rafiq_game_state.dart';

class RafiqDynamicGuide extends StatelessWidget {
  const RafiqDynamicGuide({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RafiqGameCubit, RafiqGameState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: const Size(300, 300),
              painter: _FacePainter(
                color: state.isMatchingEmotion
                    ? ColorsManager.softRose
                    : Colors.white24,
                glow: state.isMatchingEmotion,
                stage: state.stage,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _FacePainter extends CustomPainter {
  final Color color;
  final bool glow;
  final GameStage stage;

  _FacePainter({required this.color, required this.glow, required this.stage});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 8.0
      ..strokeCap = StrokeCap.round;

    if (glow) paint.maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    final path = Path();

    // 1. Draw Mouth
    switch (stage) {
      case GameStage.detectingHappy:
        path.moveTo(size.width * 0.3, size.height * 0.6);
        path.quadraticBezierTo(
          size.width * 0.5,
          size.height * 0.85,
          size.width * 0.7,
          size.height * 0.6,
        );
        break;
      case GameStage.detectingSad:
      case GameStage.detectingAngry:
        path.moveTo(size.width * 0.3, size.height * 0.8);
        path.quadraticBezierTo(
          size.width * 0.5,
          size.height * 0.6,
          size.width * 0.7,
          size.height * 0.8,
        );
        break;
      case GameStage.detectingNeutral:
        path.moveTo(size.width * 0.35, size.height * 0.7);
        path.lineTo(size.width * 0.65, size.height * 0.7);
        break;
      case GameStage.detectingSurprise:
        canvas.drawOval(
          Rect.fromCenter(
            center: Offset(size.width * 0.5, size.height * 0.75),
            width: 60,
            height: 80,
          ),
          paint,
        );
        break;
      default: // Fallback/Transition
        path.moveTo(size.width * 0.3, size.height * 0.6);
        path.quadraticBezierTo(
          size.width * 0.5,
          size.height * 0.85,
          size.width * 0.7,
          size.height * 0.6,
        );
    }

    if (stage != GameStage.detectingSurprise) canvas.drawPath(path, paint);

    // 2. Draw Eyes
    final eyePaint = Paint()
      ..color = color.withAlpha(128)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    if (stage == GameStage.detectingAngry) {
      // Slanted Eyes
      canvas.drawLine(
        Offset(size.width * 0.25, size.height * 0.38),
        Offset(size.width * 0.35, size.height * 0.42),
        eyePaint,
      );
      canvas.drawLine(
        Offset(size.width * 0.75, size.height * 0.38),
        Offset(size.width * 0.65, size.height * 0.42),
        eyePaint,
      );
    } else {
      // Normal Eyes
      canvas.drawOval(
        Rect.fromLTWH(size.width * 0.25, size.height * 0.4, 30, 20),
        eyePaint,
      );
      canvas.drawOval(
        Rect.fromLTWH(size.width * 0.65, size.height * 0.4, 30, 20),
        eyePaint,
      );
    }
  }
  @override
  bool shouldRepaint(covariant _FacePainter oldDelegate) =>
      oldDelegate.stage != stage || oldDelegate.glow != glow;
}
