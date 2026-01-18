import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import '../../domain/models/home_state_model.dart';

/// Now/Next schedule bar showing current and upcoming activities
/// Floating pill design with progress indicator
class NowNextBar extends StatelessWidget {
  const NowNextBar({
    super.key,
    this.currentActivity,
    this.nextActivity,
    this.onCurrentTap,
    this.onNextTap,
  });

  final ScheduleActivity? currentActivity;
  final ScheduleActivity? nextActivity;
  final VoidCallback? onCurrentTap;
  final VoidCallback? onNextTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: ValuesManager.spaceDefault.w),
      decoration: BoxDecoration(
        color: isDark ? ColorsManager.darkGreySurface : Colors.white,
        borderRadius: ValuesManager.borderRadiusExtraLarge,
        boxShadow: [
          BoxShadow(
            color: ColorsManager.communicationBlue.withValues(alpha: 0.15),
            blurRadius: ValuesManager.homeBarShadowBlurRadius.r,
            offset: Offset(0, ValuesManager.homeBarShadowOffsetY.h),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Progress bar at top
          if (currentActivity != null)
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ValuesManager.radiusExtraLarge.r),
                topRight: Radius.circular(ValuesManager.radiusExtraLarge.r),
              ),
              child: LinearProgressIndicator(
                value: currentActivity!.progress,
                backgroundColor: isDark
                    ? ColorsManager.focusState.withValues(
                        alpha: ValuesManager.opacityLight,
                      )
                    : ColorsManager.lightGrey,
                valueColor: AlwaysStoppedAnimation<Color>(
                  ColorsManager.communicationBlue,
                ),
                minHeight: ValuesManager.homeProgressBarHeight.h,
              ),
            ),
          Padding(
            padding: EdgeInsets.all(ValuesManager.spaceSmall.r),
            child: Row(
              children: [
                // NOW section
                Expanded(
                  child: _ActivitySection(
                    activity: currentActivity,
                    label: StringsManager.homeNow,
                    isActive: true,
                    onTap: onCurrentTap,
                    isDark: isDark,
                  ),
                ),
                // Arrow divider
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: ValuesManager.spaceSmall.w,
                  ),
                  child: Icon(
                    Icons.arrow_forward_rounded,
                    color: isDark
                        ? ColorsManager.companionNeutral
                        : ColorsManager.focusState.withValues(alpha: 0.3),
                    size: ValuesManager.iconSizeDefault.r,
                  ),
                ),
                // NEXT section
                Expanded(
                  child: _ActivitySection(
                    activity: nextActivity,
                    label: StringsManager.homeNext,
                    isActive: false,
                    onTap: onNextTap,
                    isDark: isDark,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual activity section (Now or Next)
class _ActivitySection extends StatelessWidget {
  const _ActivitySection({
    this.activity,
    required this.label,
    required this.isActive,
    this.onTap,
    required this.isDark,
  });

  final ScheduleActivity? activity;
  final String label;
  final bool isActive;
  final VoidCallback? onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    if (activity == null) {
      return _buildEmpty();
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(ValuesManager.spaceMedium.r),
        decoration: BoxDecoration(
          color: isActive
              ? ColorsManager.communicationBlue.withValues(alpha: 0.1)
              : Colors.transparent,
          borderRadius: ValuesManager.borderRadiusLarge,
          border: isActive
              ? Border.all(
                  color: ColorsManager.communicationBlue.withValues(alpha: 0.2),
                  width: ValuesManager.borderWidthDefault.r,
                )
              : null,
        ),
        child: Row(
          children: [
            // Icon container
            Container(
              width: ValuesManager.homeActivityIconSize.r,
              height: ValuesManager.homeActivityIconSize.r,
              decoration: BoxDecoration(
                color: isActive
                    ? activity!.iconColor
                    : isDark
                    ? ColorsManager.darkGreySurface
                    : ColorsManager.lightGrey,
                borderRadius: ValuesManager.borderRadiusMedium,
              ),
              child: Icon(
                activity!.iconData,
                color: isActive
                    ? Colors.white
                    : isDark
                    ? ColorsManager.companionNeutral
                    : ColorsManager.focusState,
                size: ValuesManager.iconSizeDefault.r,
              ),
            ),
            SizedBox(width: ValuesManager.spaceSmall.w),
            // Text content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    label,
                    style:
                        ResponsiveStylesManager.getBodySmall(
                          color: isActive
                              ? ColorsManager.communicationBlue
                              : isDark
                              ? ColorsManager.companionNeutral
                              : ColorsManager.focusState,
                        ).copyWith(
                          fontWeight: FontWeight.bold,
                          letterSpacing: ValuesManager.letterSpacingWide,
                        ),
                  ),
                  FittedBox(
                    child: Text(
                      activity!.title,
                      style:
                          ResponsiveStylesManager.getSubHeadline2(
                            color: isDark
                                ? Colors.white
                                : ColorsManager.darkGreyText,
                          ).copyWith(
                            fontWeight: isActive
                                ? FontWeight.bold
                                : FontWeight.w500,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmpty() {
    return Container(
      padding: EdgeInsets.all(ValuesManager.spaceMedium.r),
      child: Row(
        children: [
          Container(
            width: ValuesManager.homeActivityIconSize.r,
            height: ValuesManager.homeActivityIconSize.r,
            decoration: BoxDecoration(
              color: isDark
                  ? ColorsManager.darkGreySurface
                  : ColorsManager.lightGrey,
              borderRadius: ValuesManager.borderRadiusMedium,
            ),
            child: Icon(
              Icons.check_circle_rounded,
              color: ColorsManager.routineGreen,
              size: ValuesManager.iconSizeDefault.r,
            ),
          ),
          SizedBox(width: ValuesManager.spaceSmall.w),
          Expanded(
            child: Text(
              StringsManager.homeAllDone,
              style: ResponsiveStylesManager.getBodyMedium(
                color: isDark
                    ? ColorsManager.companionNeutral
                    : ColorsManager.focusState,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
