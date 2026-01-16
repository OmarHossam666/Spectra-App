import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

/// Top navigation bar for onboarding screens
/// Includes back button, progress indicator, and optional trailing widget
class OnboardingAppBar extends StatelessWidget {
  const OnboardingAppBar({
    super.key,
    required this.currentStep,
    required this.totalSteps,
    this.onBack,
    this.showBackButton = true,
  });

  final int currentStep;
  final int totalSteps;
  final VoidCallback? onBack;
  final bool showBackButton;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ValuesManager.spaceDefault.w,
        vertical: ValuesManager.spaceSmall.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Back Button
          if (showBackButton)
            _BackButton(onTap: onBack, isDark: isDark)
          else
            SizedBox(width: ValuesManager.minTouchTargetSize.r),

          // Progress Indicators
          _ProgressIndicators(currentStep: currentStep, totalSteps: totalSteps),

          // Spacer for balance
          SizedBox(width: ValuesManager.minTouchTargetSize.r),
        ],
      ),
    );
  }
}

class _BackButton extends StatelessWidget {
  const _BackButton({required this.onTap, required this.isDark});

  final VoidCallback? onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(ValuesManager.radiusExtraLarge.r),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ValuesManager.radiusCircular.r),
        child: Container(
          width: ValuesManager.minTouchTargetSize.r,
          height: ValuesManager.minTouchTargetSize.r,
          alignment: Alignment.center,
          child: Icon(
            Icons.arrow_back,
            color: isDark ? ColorsManager.cream : ColorsManager.darkGreyText,
            size: ValuesManager.iconSizeLarge.r,
          ),
        ),
      ),
    );
  }
}

class _ProgressIndicators extends StatelessWidget {
  const _ProgressIndicators({
    required this.currentStep,
    required this.totalSteps,
  });

  final int currentStep;
  final int totalSteps;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(totalSteps, (index) {
        final isActive = index == currentStep;
        return AnimatedContainer(
          duration: ValuesManager.durationMedium,
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceExtraSmall.w,
          ),
          width: 10.r,
          height: 10.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isActive
                ? ColorsManager.communicationBlue
                : (isDark
                      ? ColorsManager.darkGreySurface
                      : ColorsManager.lightGrey),
          ),
        );
      }),
    );
  }
}
