import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';

/// Quick help/AAC button for accessibility
/// Always visible on login screen for emergency assistance
class QuickHelpButton extends StatelessWidget {
  const QuickHelpButton({
    super.key,
    required this.onTap,
    this.isCompact = false,
  });

  final VoidCallback onTap;
  final bool isCompact;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    if (isCompact) {
      return _buildCompactButton(isDark);
    }
    return _buildExpandedButton(isDark);
  }

  Widget _buildCompactButton(bool isDark) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ValuesManager.radiusCircular.r),
        child: Container(
          width: ValuesManager.helpButtonCompactSize.r,
          height: ValuesManager.helpButtonCompactSize.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark ? ColorsManager.darkGreySurface : Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: ValuesManager.profileGlowBlurRadius.r,
                offset: Offset(0, ValuesManager.spaceExtraSmall.h),
              ),
            ],
            border: Border.all(
              color: ColorsManager.communicationBlue.withValues(
                alpha: ValuesManager.opacityLight,
              ),
              width: ValuesManager.borderWidthDefault.r,
            ),
          ),
          child: Icon(
            Icons.record_voice_over_rounded,
            color: ColorsManager.communicationBlue,
            size: ValuesManager.helpButtonIconSize.r,
          ),
        ),
      ),
    );
  }

  Widget _buildExpandedButton(bool isDark) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ValuesManager.radiusCircular.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceLarge.w,
            vertical: ValuesManager.spaceMedium.h,
          ),
          decoration: BoxDecoration(
            color: ColorsManager.communicationBlue,
            borderRadius: BorderRadius.circular(ValuesManager.radiusCircular.r),
            boxShadow: [
              BoxShadow(
                color: ColorsManager.communicationBlue.withValues(
                  alpha: ValuesManager.opacityMedium,
                ),
                blurRadius: ValuesManager.radiusMedium.r,
                offset: Offset(0, ValuesManager.spaceExtraSmall.h),
              ),
            ],
            border: Border.all(
              color: Colors.white.withValues(alpha: ValuesManager.opacityLight),
              width: ValuesManager.borderWidthDefault.r,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.campaign_rounded,
                color: Colors.white,
                size: ValuesManager.iconSizeLarge.r,
              ),
              SizedBox(width: ValuesManager.spaceSmall.w),
              Text(
                StringsManager.loginHelpButton,
                style: ResponsiveStylesManager.getButtonPrimary().copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Emergency help banner for top of screen
class EmergencyHelpBanner extends StatelessWidget {
  const EmergencyHelpBanner({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ValuesManager.radiusCircular.r),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceDefault.w,
            vertical: ValuesManager.spaceSmall.h,
          ),
          decoration: BoxDecoration(
            color: isDark
                ? ColorsManager.companionAlert.withValues(
                    alpha: ValuesManager.opacityLight,
                  )
                : ColorsManager.helpBannerLight,
            borderRadius: BorderRadius.circular(ValuesManager.radiusCircular.r),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.record_voice_over_rounded,
                color: isDark
                    ? ColorsManager.companionAlert
                    : ColorsManager.helpBannerText,
                size: ValuesManager.iconSizeMedium.r,
              ),
              SizedBox(width: ValuesManager.spaceSmall.w),
              Text(
                StringsManager.loginHelpBanner,
                style: ResponsiveStylesManager.getButtonSecondary().copyWith(
                  color: isDark
                      ? ColorsManager.companionAlert
                      : ColorsManager.helpBannerText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
