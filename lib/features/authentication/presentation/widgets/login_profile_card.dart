import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import '../../domain/models/login_state_model.dart';

/// Profile card widget for login screen profile selection
/// Displays child or parent profile with avatar and action
class LoginProfileCard extends StatelessWidget {
  const LoginProfileCard({
    super.key,
    required this.profile,
    required this.onTap,
    this.isPrimary = false,
    this.showGlowEffect = false,
  });

  final UserProfile profile;
  final VoidCallback onTap;
  final bool isPrimary;
  final bool showGlowEffect;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = isPrimary
        ? ValuesManager.profileAvatarPrimary.r
        : ValuesManager.profileAvatarSecondary.r;
    final backgroundColor = profile.isChild
        ? ColorsManager.communicationBlue
        : ColorsManager.focusState;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar container with optional glow
          Stack(
            alignment: Alignment.center,
            children: [
              // Glow effect for primary profile
              if (showGlowEffect)
                Container(
                  width: size + ValuesManager.profileGlowPadding.r,
                  height: size + ValuesManager.profileGlowPadding.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: backgroundColor.withValues(
                      alpha: ValuesManager.opacityLight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: backgroundColor.withValues(
                          alpha: ValuesManager.opacityMedium + 0.1,
                        ),
                        blurRadius: ValuesManager.profileGlowBlurRadius.r,
                        spreadRadius: ValuesManager.profileGlowSpreadRadius.r,
                      ),
                    ],
                  ),
                ),
              // Avatar circle
              AnimatedContainer(
                duration: ValuesManager.durationMedium,
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark
                      ? ColorsManager.darkGreySurface
                      : ColorsManager.cream,
                  border: Border.all(
                    color: Colors.white,
                    width: ValuesManager.profileAvatarBorderWidth.r,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.08),
                      blurRadius: 10.r,
                      offset: Offset(0, ValuesManager.spaceExtraSmall.h),
                    ),
                  ],
                ),
                child: ClipOval(
                  child: profile.avatarPath != null
                      ? Image.asset(
                          profile.avatarPath!,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => _buildFallbackIcon(),
                        )
                      : _buildFallbackIcon(),
                ),
              ),
              // Active/Online indicator for child profile
              if (profile.isChild && profile.isActive)
                Positioned(
                  right: isPrimary
                      ? ValuesManager.spaceSmall.r
                      : ValuesManager.spaceExtraSmall.r,
                  bottom: isPrimary
                      ? ValuesManager.spaceSmall.r
                      : ValuesManager.spaceExtraSmall.r,
                  child: Container(
                    width: isPrimary
                        ? ValuesManager.profileIndicatorPrimary.r
                        : ValuesManager.profileIndicatorSecondary.r,
                    height: isPrimary
                        ? ValuesManager.profileIndicatorPrimary.r
                        : ValuesManager.profileIndicatorSecondary.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.routineGreen,
                      border: Border.all(
                        color: Colors.white,
                        width: ValuesManager.borderWidthThick.r,
                      ),
                    ),
                    child: Icon(
                      Icons.check,
                      color: Colors.white,
                      size: isPrimary
                          ? ValuesManager.iconSizeSmall.r
                          : ValuesManager.fontSizeInstruction.r,
                    ),
                  ),
                ),
              // Lock badge for parent profile
              if (!profile.isChild)
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: Container(
                    padding: EdgeInsets.all(ValuesManager.spaceSmall.r - 2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ColorsManager.focusState,
                      border: Border.all(
                        color: Colors.white,
                        width: ValuesManager.borderWidthDefault.r,
                      ),
                    ),
                    child: Icon(
                      Icons.lock_rounded,
                      color: Colors.white,
                      size: ValuesManager.fontSizeBodySmall.r,
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: ValuesManager.spaceMedium.h),
          // Name
          Text(
            profile.name,
            style:
                ResponsiveStylesManager.getSubHeadline1(
                  color: isDark ? Colors.white : ColorsManager.darkGreyText,
                ).copyWith(
                  fontSize: isPrimary
                      ? ValuesManager.fontSizeHeadline3.sp
                      : ValuesManager.fontSizeSubHeadline2.sp,
                ),
          ),
          SizedBox(height: ValuesManager.spaceExtraSmall.h),
          // Action hint
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (profile.isChild) ...[
                Icon(
                  Icons.touch_app_rounded,
                  color: ColorsManager.communicationBlue,
                  size: ValuesManager.iconSizeSmall.r,
                ),
                SizedBox(width: ValuesManager.spaceExtraSmall.w),
                Text(
                  StringsManager.loginChildHint,
                  style: ResponsiveStylesManager.getBodySmall(
                    color: ColorsManager.communicationBlue,
                  ),
                ),
              ] else ...[
                Text(
                  StringsManager.loginParentHint,
                  style: ResponsiveStylesManager.getBodySmall(
                    color: isDark
                        ? ColorsManager.companionNeutral
                        : ColorsManager.focusState,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFallbackIcon() {
    return Container(
      color: profile.isChild
          ? ColorsManager.communicationBlue.withValues(alpha: 0.1)
          : ColorsManager.focusState.withValues(alpha: 0.1),
      child: Icon(
        profile.isChild ? Icons.face_6_rounded : Icons.person_rounded,
        size: isPrimary
            ? ValuesManager.profileAvatarPrimary.r * 0.5
            : ValuesManager.profileAvatarSecondary.r * 0.5,
        color: profile.isChild
            ? ColorsManager.communicationBlue
            : ColorsManager.focusState,
      ),
    );
  }
}
