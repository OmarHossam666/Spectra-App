import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';

/// Rafiq mascot widget for guided login flow
/// Displays the mascot with optional dialogue bubble
class RafiqMascot extends StatelessWidget {
  const RafiqMascot({
    super.key,
    this.message,
    this.size = ValuesManager.mascotSizeDefault,
    this.showDialogue = true,
  });

  final String? message;
  final double size;
  final bool showDialogue;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Mascot container
        Container(
          width: size.r,
          height: size.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                ColorsManager.communicationBlue.withValues(alpha: 0.15),
                ColorsManager.lavender.withValues(alpha: 0.15),
              ],
            ),
          ),
          child: Center(
            child: Image.asset(
              StringsManager.assetRafiqMascot,
              width: size.r * ValuesManager.mascotImageRatio,
              height: size.r * ValuesManager.mascotImageRatio,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => _buildFallbackMascot(isDark),
            ),
          ),
        ),
        // Dialogue bubble
        if (showDialogue && message != null)
          Positioned(
            top: -8.r,
            right: -16.r,
            child: _DialogueBubble(message: message!),
          ),
      ],
    );
  }

  Widget _buildFallbackMascot(bool isDark) {
    return Icon(
      Icons.smart_toy_rounded,
      size: size.r * ValuesManager.mascotFallbackRatio,
      color: ColorsManager.communicationBlue,
    );
  }
}

class _DialogueBubble extends StatelessWidget {
  const _DialogueBubble({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      constraints: BoxConstraints(
        maxWidth: ValuesManager.dialogueBubbleMaxWidth.w,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: ValuesManager.spaceMedium.w,
        vertical: ValuesManager.spaceSmall.h,
      ),
      decoration: BoxDecoration(
        color: isDark ? ColorsManager.darkGreySurface : Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ValuesManager.radiusLarge.r),
          topRight: Radius.circular(ValuesManager.radiusLarge.r),
          bottomRight: Radius.circular(ValuesManager.radiusLarge.r),
          bottomLeft: Radius.zero,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: ValuesManager.radiusSmall.r,
            offset: Offset(0, ValuesManager.spaceExtraSmall.h),
          ),
        ],
      ),
      child: Text(
        message,
        style: ResponsiveStylesManager.getBodySmall(
          color: ColorsManager.communicationBlue,
        ).copyWith(fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
      ),
    );
  }
}
