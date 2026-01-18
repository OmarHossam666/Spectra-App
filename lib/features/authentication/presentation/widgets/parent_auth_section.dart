import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';

/// Parent authentication section widget
/// Provides biometric, Huawei ID, and PIN authentication options
class ParentAuthSection extends StatelessWidget {
  const ParentAuthSection({
    super.key,
    required this.onHuaweiIdTap,
    required this.onBiometricTap,
    required this.onPinTap,
    this.isLoading = false,
  });

  final VoidCallback onHuaweiIdTap;
  final VoidCallback onBiometricTap;
  final VoidCallback onPinTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ValuesManager.spaceLarge.r),
      decoration: BoxDecoration(
        color: isDark ? ColorsManager.darkGreySurface : Colors.white,
        borderRadius: ValuesManager.borderRadiusExtraLarge,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: ValuesManager.radiusMedium.r,
            offset: Offset(0, ValuesManager.spaceExtraSmall.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          _buildHeader(isDark),
          SizedBox(height: ValuesManager.spaceLarge.h),
          // Biometric section
          _buildBiometricSection(isDark),
          SizedBox(height: ValuesManager.spaceLarge.h),
          // Huawei ID Button
          _buildHuaweiIdButton(isDark),
          SizedBox(height: ValuesManager.spaceDefault.h),
          // PIN link
          _buildPinLink(isDark),
        ],
      ),
    );
  }

  Widget _buildHeader(bool isDark) {
    return Column(
      children: [
        // Avatar placeholder
        Container(
          width: ValuesManager.parentAvatarSize.r,
          height: ValuesManager.parentAvatarSize.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isDark
                ? ColorsManager.focusState.withValues(
                    alpha: ValuesManager.opacityLight,
                  )
                : ColorsManager.lightGrey,
          ),
          child: Icon(
            Icons.person_rounded,
            color: isDark
                ? ColorsManager.companionNeutral
                : ColorsManager.focusState,
            size: ValuesManager.parentAvatarIconSize.r,
          ),
        ),
        SizedBox(height: ValuesManager.spaceMedium.h),
        Text(
          StringsManager.loginGuardianAccess,
          style: ResponsiveStylesManager.getSubHeadline1(
            color: isDark ? Colors.white : ColorsManager.darkGreyText,
          ),
        ),
        SizedBox(height: ValuesManager.spaceExtraSmall.h),
        Text(
          StringsManager.loginVerifyPrompt,
          style: ResponsiveStylesManager.getBodySmall(
            color: isDark
                ? ColorsManager.companionNeutral
                : ColorsManager.focusState,
          ),
        ),
      ],
    );
  }

  Widget _buildBiometricSection(bool isDark) {
    return GestureDetector(
      onTap: isLoading ? null : onBiometricTap,
      child: Column(
        children: [
          // Fingerprint icon with pulse effect
          Stack(
            alignment: Alignment.center,
            children: [
              // Outer pulse
              if (!isLoading)
                Container(
                  width: ValuesManager.biometricOuterPulseSize.r,
                  height: ValuesManager.biometricOuterPulseSize.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.communicationBlue.withValues(
                      alpha: 0.1,
                    ),
                  ),
                ),
              // Inner pulse
              if (!isLoading)
                Container(
                  width: ValuesManager.biometricInnerPulseSize.r,
                  height: ValuesManager.biometricInnerPulseSize.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsManager.communicationBlue.withValues(
                      alpha: ValuesManager.opacityLight,
                    ),
                  ),
                ),
              // Main icon container
              Container(
                width: ValuesManager.biometricIconContainerSize.r,
                height: ValuesManager.biometricIconContainerSize.r,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? ColorsManager.darkGreySurface : Colors.white,
                  border: Border.all(
                    color: ColorsManager.lightGrey.withValues(alpha: 0.5),
                  ),
                ),
                child: isLoading
                    ? Padding(
                        padding: EdgeInsets.all(ValuesManager.spaceDefault.r),
                        child: CircularProgressIndicator(
                          strokeWidth: ValuesManager.borderWidthThick.r,
                          color: ColorsManager.communicationBlue,
                        ),
                      )
                    : Icon(
                        Icons.fingerprint_rounded,
                        color: ColorsManager.communicationBlue,
                        size: ValuesManager.biometricIconSize.r,
                      ),
              ),
            ],
          ),
          SizedBox(height: ValuesManager.spaceMedium.h),
          Text(
            isLoading
                ? StringsManager.loginBiometricVerifying
                : StringsManager.loginBiometricPrompt,
            style: ResponsiveStylesManager.getBodyMedium(
              color: isDark
                  ? ColorsManager.companionNeutral
                  : ColorsManager.darkGreyText,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHuaweiIdButton(bool isDark) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: isLoading ? null : onHuaweiIdTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? Colors.white : Colors.black,
          foregroundColor: isDark ? Colors.black : Colors.white,
          elevation: 0,
          padding: EdgeInsets.symmetric(vertical: ValuesManager.spaceDefault.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ValuesManager.radiusCircular.r),
          ),
        ),
        icon: Icon(
          Icons.fingerprint_rounded,
          size: ValuesManager.iconSizeMedium.r,
        ),
        label: Text(
          StringsManager.loginHuaweiId,
          style: ResponsiveStylesManager.getButtonPrimary().copyWith(
            color: isDark ? Colors.black : Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildPinLink(bool isDark) {
    return TextButton(
      onPressed: isLoading ? null : onPinTap,
      child: Text(
        StringsManager.loginUsePinCode,
        style: ResponsiveStylesManager.getBodyMedium(
          color: ColorsManager.communicationBlue,
        ).copyWith(fontWeight: FontWeight.w600),
      ),
    );
  }
}
