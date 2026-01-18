import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';

/// A single module card for the home grid
/// Represents a main app feature (Talk, Feelings, Learn, Play, etc.)
class ModuleCard extends StatelessWidget {
  const ModuleCard({
    super.key,
    required this.title,
    required this.iconData,
    required this.backgroundColor,
    required this.iconColor,
    this.subtitle,
    this.onTap,
    this.isHighlighted = false,
    this.isWide = false,
    this.height,
  });

  final String title;
  final IconData iconData;
  final Color backgroundColor;
  final Color iconColor;
  final String? subtitle;
  final VoidCallback? onTap;
  final bool isHighlighted;
  final bool isWide;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cardHeight = height ?? ValuesManager.homeModuleCardHeight.h;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: ValuesManager.durationFast,
        height: cardHeight,
        decoration: BoxDecoration(
          color: isDark
              ? backgroundColor.withValues(alpha: ValuesManager.opacityLight)
              : backgroundColor,
          borderRadius: BorderRadius.circular(ValuesManager.radiusExtraLarge.r),
          border: isHighlighted
              ? Border.all(
                  color: iconColor.withValues(
                    alpha: ValuesManager.opacityMedium,
                  ),
                  width: ValuesManager.borderWidthDefault.r,
                )
              : Border.all(
                  color: isDark
                      ? ColorsManager.focusState.withValues(
                          alpha: ValuesManager.opacityLight,
                        )
                      : ColorsManager.lightGrey.withValues(
                          alpha: ValuesManager.opacitySemiTransparent,
                        ),
                  width: ValuesManager.borderWidthThin.r,
                ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: ValuesManager.homeCardShadowBlurRadius.r,
              offset: Offset(0, ValuesManager.homeCardShadowOffsetY.h),
            ),
          ],
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(
              ValuesManager.radiusExtraLarge.r,
            ),
            child: isWide ? _buildWideContent(isDark) : _buildContent(isDark),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(bool isDark) {
    return Padding(
      padding: EdgeInsets.all(ValuesManager.spaceDefault.r),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon container
          Container(
            width: ValuesManager.homeModuleIconContainerSize.r,
            height: ValuesManager.homeModuleIconContainerSize.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? iconColor.withValues(alpha: ValuesManager.opacityLight)
                  : Colors.white.withValues(alpha: 0.6),
            ),
            child: Icon(
              iconData,
              color: isDark ? iconColor.withValues(alpha: 0.9) : iconColor,
              size: ValuesManager.homeModuleIconSize.r,
            ),
          ),
          SizedBox(height: ValuesManager.spaceMedium.h),
          // Title
          Text(
            title,
            style: ResponsiveStylesManager.getSubHeadline2(
              color: isDark ? Colors.white : ColorsManager.darkGreyText,
            ).copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          if (subtitle != null) ...[
            SizedBox(height: ValuesManager.spaceExtraSmall.h),
            Text(
              subtitle!,
              style: ResponsiveStylesManager.getBodySmall(
                color: isDark
                    ? ColorsManager.companionNeutral
                    : ColorsManager.focusState,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildWideContent(bool isDark) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ValuesManager.spaceLarge.w,
        vertical: ValuesManager.spaceDefault.h,
      ),
      child: Row(
        children: [
          // Text content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: ResponsiveStylesManager.getSubHeadline1(
                    color: isDark ? Colors.white : ColorsManager.darkGreyText,
                  ).copyWith(fontWeight: FontWeight.bold),
                ),
                if (subtitle != null) ...[
                  SizedBox(height: ValuesManager.spaceExtraSmall.h),
                  Text(
                    subtitle!,
                    style: ResponsiveStylesManager.getBodyMedium(
                      color: isDark
                          ? ColorsManager.companionNeutral
                          : ColorsManager.focusState,
                    ),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(width: ValuesManager.spaceDefault.w),
          // Icon container
          Container(
            width: ValuesManager.homeModuleWideIconContainerSize.r,
            height: ValuesManager.homeModuleWideIconContainerSize.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isDark
                  ? iconColor.withValues(alpha: ValuesManager.opacityLight)
                  : Colors.white.withValues(alpha: 0.6),
            ),
            child: Icon(
              iconData,
              color: isDark ? iconColor.withValues(alpha: 0.9) : iconColor,
              size: ValuesManager.iconSizeLarge.r,
            ),
          ),
        ],
      ),
    );
  }
}
