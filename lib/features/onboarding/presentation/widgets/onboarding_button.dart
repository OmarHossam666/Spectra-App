import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

/// Primary action button for onboarding screens
/// Features a 3D press effect and customizable content
class OnboardingButton extends StatefulWidget {
  const OnboardingButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.backgroundColor,
    this.textColor,
    this.isLoading = false,
    this.isFullWidth = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? textColor;
  final bool isLoading;
  final bool isFullWidth;

  @override
  State<OnboardingButton> createState() => _OnboardingButtonState();
}

class _OnboardingButtonState extends State<OnboardingButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = widget.backgroundColor ?? ColorsManager.communicationBlue;
    final shadowColor = HSLColor.fromColor(bgColor)
        .withLightness(
          (HSLColor.fromColor(bgColor).lightness - 0.15).clamp(0.0, 1.0),
        )
        .toColor();
    final txtColor = widget.textColor ?? Colors.white;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ValuesManager.spaceDefault.w),
      child: SizedBox(
        width: widget.isFullWidth ? double.infinity : null,
        child: GestureDetector(
          onTapDown: (_) => setState(() => _isPressed = true),
          onTapUp: (_) {
            setState(() => _isPressed = false);
            widget.onPressed?.call();
          },
          onTapCancel: () => setState(() => _isPressed = false),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            transform: Matrix4.translationValues(0, _isPressed ? 2 : 0, 0),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(
                ValuesManager.radiusCircular.r,
              ),
              boxShadow: [
                BoxShadow(
                  color: shadowColor,
                  offset: Offset(0, _isPressed ? 0 : 4.h),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: ValuesManager.spaceLarge.w,
                vertical: ValuesManager.spaceDefault.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ValuesManager.radiusCircular.r,
                ),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.2),
                  width: ValuesManager.borderWidthDefault.r,
                ),
              ),
              child: widget.isLoading
                  ? SizedBox(
                      width: ValuesManager.iconSizeDefault.r,
                      height: ValuesManager.iconSizeDefault.r,
                      child: const CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    )
                  : Row(
                      mainAxisSize: widget.isFullWidth
                          ? MainAxisSize.max
                          : MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (widget.icon != null) ...[
                          Icon(
                            widget.icon,
                            color: txtColor,
                            size: ValuesManager.iconSizeLarge.r,
                          ),
                          SizedBox(width: ValuesManager.spaceMedium.w),
                        ],
                        Text(
                          widget.label,
                          style: StylesManager.getButtonPrimary(color: txtColor)
                              .copyWith(
                                fontSize: ValuesManager.fontSizeSubHeadline1.sp,
                                letterSpacing: ValuesManager.letterSpacingWide,
                              ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
