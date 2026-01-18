import 'package:flutter/material.dart';
import 'package:spectra/core/constants/colors_manager.dart';

/// Custom painter for login screen background decoration
/// Creates soft gradient blobs for visual interest
class LoginBackgroundPainter extends CustomPainter {
  final bool isDark;

  const LoginBackgroundPainter({required this.isDark});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    // Top-right blob
    paint.color = isDark
        ? ColorsManager.communicationBlue.withValues(alpha: 0.05)
        : ColorsManager.communicationBlue.withValues(alpha: 0.08);
    canvas.drawCircle(Offset(size.width + 50, -50), size.width * 0.5, paint);

    // Bottom-left blob
    paint.color = isDark
        ? ColorsManager.lavender.withValues(alpha: 0.03)
        : ColorsManager.companionHappy.withValues(alpha: 0.06);
    canvas.drawCircle(Offset(-30, size.height + 30), size.width * 0.4, paint);
  }

  @override
  bool shouldRepaint(covariant LoginBackgroundPainter oldDelegate) {
    return oldDelegate.isDark != isDark;
  }
}
