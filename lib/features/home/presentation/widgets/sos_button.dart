import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';

/// SOS Floating Action Button for emergency/help
/// Always visible and accessible for safety
class SosButton extends StatelessWidget {
  const SosButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: ValuesManager.homeSosButtonSize.r,
        height: ValuesManager.homeSosButtonSize.r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ColorsManager.companionAlert,
          boxShadow: [
            BoxShadow(
              color: ColorsManager.companionAlert.withValues(alpha: 0.4),
              blurRadius: ValuesManager.homeSosShadowBlurRadius.r,
              offset: Offset(0, ValuesManager.homeCardShadowOffsetY.h),
            ),
          ],
        ),
        child: Icon(
          Icons.medical_services_rounded,
          color: Colors.white,
          size: ValuesManager.iconSizeLarge.r,
        ),
      ),
    );
  }

  /// Show confirmation dialog before triggering SOS
  static Future<void> showSosDialog(
    BuildContext context,
    VoidCallback onConfirm,
  ) async {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
        backgroundColor: isDark ? ColorsManager.darkGreySurface : Colors.white,
        title: Row(
          children: [
            Icon(
              Icons.medical_services_rounded,
              color: ColorsManager.companionAlert,
              size: ValuesManager.iconSizeLarge.r,
            ),
            SizedBox(width: ValuesManager.spaceSmall.w),
            Text(
              StringsManager.homeSosTitle,
              style: ResponsiveStylesManager.getSubHeadline1(
                color: isDark ? Colors.white : ColorsManager.darkGreyText,
              ),
            ),
          ],
        ),
        content: Text(
          StringsManager.homeSosContent,
          style: ResponsiveStylesManager.getBodyLarge(
            color: isDark
                ? ColorsManager.companionNeutral
                : ColorsManager.focusState,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: Text(
              StringsManager.cancel,
              style: ResponsiveStylesManager.getButtonSecondary(),
            ),
          ),
          FilledButton(
            onPressed: () {
              context.pop();
              onConfirm();
            },
            style: FilledButton.styleFrom(
              backgroundColor: ColorsManager.companionAlert,
            ),
            child: Text(
              StringsManager.homeSosConfirm,
              style: ResponsiveStylesManager.getButtonPrimary().copyWith(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
