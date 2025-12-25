import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

/// Styled text input field for onboarding screens
class OnboardingTextField extends StatelessWidget {
  const OnboardingTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.label,
    this.onChanged,
    this.textAlign = TextAlign.center,
    this.autofocus = false,
  });

  final TextEditingController controller;
  final String hintText;
  final String? label;
  final ValueChanged<String>? onChanged;
  final TextAlign textAlign;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? ColorsManager.darkGreySurface
        : Colors.white;
    final borderColor = isDark
        ? ColorsManager.darkGreySurface
        : ColorsManager.lightGrey;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ValuesManager.spaceDefault.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Text(
              label!,
              style: StylesManager.getCaption(color: ColorsManager.focusState),
            ),
            SizedBox(height: ValuesManager.spaceSmall.h),
          ],
          TextField(
            controller: controller,
            onChanged: onChanged,
            textAlign: textAlign,
            autofocus: autofocus,
            style: StylesManager.getSubHeadline1(
              color: isDark ? ColorsManager.cream : ColorsManager.darkGreyText,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: StylesManager.getBodyLarge(
                color: ColorsManager.focusState.withValues(alpha: 0.6),
              ),
              filled: true,
              fillColor: backgroundColor,
              contentPadding: EdgeInsets.all(ValuesManager.spaceLarge.r),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  ValuesManager.radiusLarge.r,
                ),
                borderSide: BorderSide(color: borderColor, width: 2.r),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  ValuesManager.radiusLarge.r,
                ),
                borderSide: BorderSide(color: borderColor, width: 2.r),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(
                  ValuesManager.radiusLarge.r,
                ),
                borderSide: BorderSide(
                  color: ColorsManager.communicationBlue,
                  width: 2.r,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
