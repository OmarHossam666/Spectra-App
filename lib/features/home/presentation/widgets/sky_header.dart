import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import '../../domain/models/home_state_model.dart';

/// Dynamic sky header that adapts to time of day
/// Contains profile avatar, greeting, and Rafiq widget
class SkyHeader extends StatelessWidget {
  const SkyHeader({
    super.key,
    required this.childName,
    required this.timePeriod,
    this.avatarUrl,
    this.isOnline = true,
    this.rafiqMessage,
    this.onRafiqTap,
    this.onProfileTap,
  });

  final String childName;
  final TimePeriod timePeriod;
  final String? avatarUrl;
  final bool isOnline;
  final String? rafiqMessage;
  final VoidCallback? onRafiqTap;
  final VoidCallback? onProfileTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final gradientColors = _getGradientColors(isDark);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(ValuesManager.radiusExtraLarge.r * 1.5),
          bottomRight: Radius.circular(ValuesManager.radiusExtraLarge.r * 1.5),
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.communicationBlue.withValues(
              alpha: ValuesManager.opacityLight,
            ),
            blurRadius: ValuesManager.homeShadowBlurRadius.r,
            offset: Offset(0, ValuesManager.homeShadowOffsetY.h),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            ValuesManager.spaceLarge.w,
            ValuesManager.spaceDefault.h,
            ValuesManager.spaceLarge.w,
            ValuesManager.spaceExtraLarge.h + ValuesManager.spaceSmall.h + 2.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Top row: Profile and Rafiq
              _buildTopRow(isDark),
              SizedBox(height: ValuesManager.spaceDefault.h),
              // Rafiq character with message
              _RafiqWidget(message: rafiqMessage, onTap: onRafiqTap),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopRow(bool isDark) {
    return Row(
      children: [
        // Profile section
        GestureDetector(
          onTap: onProfileTap,
          child: Row(
            children: [
              _ProfileAvatar(avatarUrl: avatarUrl, isOnline: isOnline),
              SizedBox(width: ValuesManager.spaceMedium.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _getGreeting(),
                    style: ResponsiveStylesManager.getHeadline2(
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    _getSubtitle(),
                    style: ResponsiveStylesManager.getBodyMedium(
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Spacer(),
        // Time indicator button
        _TimeIndicatorButton(timePeriod: timePeriod),
      ],
    );
  }

  String _getGreeting() {
    return StringsManager.getGreeting(childName);
  }

  String _getSubtitle() {
    switch (timePeriod) {
      case TimePeriod.morning:
        return StringsManager.homeMorningSubtitle;
      case TimePeriod.afternoon:
        return StringsManager.homeAfternoonSubtitle;
      case TimePeriod.evening:
        return StringsManager.homeEveningSubtitle;
      case TimePeriod.night:
        return StringsManager.homeNightSubtitle;
    }
  }

  List<Color> _getGradientColors(bool isDark) {
    if (isDark) {
      return [ColorsManager.skyDarkStart, ColorsManager.skyDarkEnd];
    }

    switch (timePeriod) {
      case TimePeriod.morning:
        return [ColorsManager.skyMorningStart, ColorsManager.skyMorningEnd];
      case TimePeriod.afternoon:
        return [ColorsManager.skyAfternoonStart, ColorsManager.skyAfternoonEnd];
      case TimePeriod.evening:
        return [ColorsManager.skyEveningStart, ColorsManager.skyEveningEnd];
      case TimePeriod.night:
        return [ColorsManager.skyNightStart, ColorsManager.skyNightEnd];
    }
  }
}

/// Profile avatar with online indicator
class _ProfileAvatar extends StatelessWidget {
  const _ProfileAvatar({this.avatarUrl, this.isOnline = true});

  final String? avatarUrl;
  final bool isOnline;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: ValuesManager.homeProfileAvatarSize.r,
          height: ValuesManager.homeProfileAvatarSize.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Colors.white.withValues(
                alpha: ValuesManager.opacityMedium,
              ),
              width: ValuesManager.borderWidthThick.r,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: ValuesManager.spaceSmall.r,
              ),
            ],
          ),
          child: ClipOval(
            child: avatarUrl != null
                ? Image.network(
                    avatarUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _buildFallback(),
                  )
                : _buildFallback(),
          ),
        ),
        if (isOnline)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: ValuesManager.homeOnlineIndicatorSize.r,
              height: ValuesManager.homeOnlineIndicatorSize.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.routineGreen,
                border: Border.all(
                  color: Colors.white,
                  width: ValuesManager.borderWidthDefault.r,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildFallback() {
    return Container(
      color: ColorsManager.communicationBlue.withValues(
        alpha: ValuesManager.opacityMedium,
      ),
      child: Icon(
        Icons.face_6_rounded,
        size: ValuesManager.homeProfileFallbackIconSize.r,
        color: Colors.white,
      ),
    );
  }
}

/// Time indicator button showing current time of day
class _TimeIndicatorButton extends StatelessWidget {
  const _TimeIndicatorButton({required this.timePeriod});

  final TimePeriod timePeriod;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ValuesManager.homeTimeIndicatorSize.r,
      height: ValuesManager.homeTimeIndicatorSize.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white.withValues(alpha: ValuesManager.opacityLight),
      ),
      child: Icon(
        _getIcon(),
        color: Colors.white,
        size: ValuesManager.iconSizeLarge.r,
      ),
    );
  }

  IconData _getIcon() {
    switch (timePeriod) {
      case TimePeriod.morning:
        return Icons.wb_sunny_rounded;
      case TimePeriod.afternoon:
        return Icons.wb_sunny_rounded;
      case TimePeriod.evening:
        return Icons.wb_twilight_rounded;
      case TimePeriod.night:
        return Icons.dark_mode_rounded;
    }
  }
}

/// Rafiq mascot widget with message bubble
class _RafiqWidget extends StatelessWidget {
  const _RafiqWidget({this.message, this.onTap});

  final String? message;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Rafiq character
          Container(
            width: ValuesManager.homeRafiqSize.r,
            height: ValuesManager.homeRafiqSize.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white.withValues(alpha: ValuesManager.opacityLight),
            ),
            child: Center(
              child: Image.asset(
                StringsManager.assetRafiqMascot,
                width: ValuesManager.homeRafiqImageSize.r,
                height: ValuesManager.homeRafiqImageSize.r,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Icon(
                  Icons.smart_toy_rounded,
                  size: ValuesManager.homeRafiqFallbackIconSize.r,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          if (message != null) ...[
            SizedBox(height: ValuesManager.spaceSmall.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ValuesManager.spaceDefault.w,
                vertical: ValuesManager.spaceSmall.h,
              ),
              decoration: BoxDecoration(
                color: Colors.white.withValues(
                  alpha: ValuesManager.opacityMedium,
                ),
                borderRadius: ValuesManager.borderRadiusLarge,
              ),
              child: Text(
                message!,
                style: ResponsiveStylesManager.getBodyBold(
                  color: ColorsManager.cream,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
