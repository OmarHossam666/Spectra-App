import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import 'package:spectra/core/routes/routes_manager.dart';
import 'module_card.dart';

/// Grid of main modules on the home screen
/// Displays Talk, Feelings, Learn, Play, and Calm Space
class ModuleGrid extends StatelessWidget {
  const ModuleGrid({super.key, this.onModuleTap});

  final void Function(String moduleId)? onModuleTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceDefault.w,
          ),
          child: Text(
            StringsManager.homeExplore,
            style: ResponsiveStylesManager.getSubHeadline1(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : ColorsManager.darkGreyText,
            ).copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: ValuesManager.spaceMedium.h),
        // Grid
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceDefault.w,
          ),
          child: Column(
            children: [
              // First row: 2 cards
              Row(
                children: [
                  Expanded(
                    child: ModuleCard(
                      title: StringsManager.homeTalk,
                      iconData: Icons.chat_bubble_rounded,
                      backgroundColor: ColorsManager.lavender.withValues(
                        alpha: ValuesManager.opacityMedium,
                      ),
                      iconColor: ColorsManager.moduleTalkIcon,
                      onTap: () => onModuleTap?.call('talk'),
                    ),
                  ),
                  SizedBox(width: ValuesManager.spaceDefault.w),
                  Expanded(
                    child:  ModuleCard(
                        title: StringsManager.homeFeelings,
                        iconData: Icons.sentiment_satisfied_rounded,
                        backgroundColor: ColorsManager.softRose.withValues(
                          alpha: ValuesManager.opacityMedium,
                        ),
                        iconColor: ColorsManager.moduleFeelingsIcon,
                        onTap: () => context.push(
                        RoutesManager.sentimentMirror,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ValuesManager.spaceDefault.h),
              // Second row: 2 cards
              Row(
                children: [
                  Expanded(
                    child: ModuleCard(
                      title: StringsManager.homeLearn,
                      iconData: Icons.menu_book_rounded,
                      backgroundColor: ColorsManager.routineGreen.withValues(
                        alpha: ValuesManager.opacityMedium,
                      ),
                      iconColor: ColorsManager.moduleLearnIcon,
                      onTap: () => onModuleTap?.call('learn'),
                    ),
                  ),
                  SizedBox(width: ValuesManager.spaceDefault.w),
                  Expanded(
                    child: ModuleCard(
                      title: StringsManager.homePlay,
                      iconData: Icons.sports_esports_rounded,
                      backgroundColor: ColorsManager.communicationBlue
                          .withValues(alpha: ValuesManager.opacityMedium),
                      iconColor: ColorsManager.communicationBlue,
                      isHighlighted: true,
                      onTap: () => onModuleTap?.call('play'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: ValuesManager.spaceDefault.h),
              // Full width calm space card
              ModuleCard(
                title: StringsManager.homeCalmSpace,
                subtitle: StringsManager.homeCalmSpaceSubtitle,
                iconData: Icons.headphones_rounded,
                backgroundColor: ColorsManager.mint.withValues(
                  alpha: ValuesManager.opacityMedium,
                ),
                iconColor: ColorsManager.moduleCalmIcon,
                isWide: true,
                height: ValuesManager.homeModuleCardWideHeight.h,
                onTap: () => onModuleTap?.call('calm'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
