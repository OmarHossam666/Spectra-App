import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import 'package:spectra/core/helpers/responsive_helper.dart';
import '../../../domain/models/login_state_model.dart';
import '../../cubit/login_cubit.dart';
import '../../widgets/login_profile_card.dart';
import '../../widgets/rafiq_mascot.dart';

/// Profile Selection View - Initial step of login flow
/// Displays child and parent profile options with Rafiq mascot greeting
class ProfileSelectionView extends StatelessWidget {
  const ProfileSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isTablet = ResponsiveHelper.isTablet;

    // Demo profiles - In production, load from storage/API
    final childProfile = const UserProfile(
      id: 'child_1',
      name: 'Leo',
      isChild: true,
      isActive: true,
    );
    final parentProfile = const UserProfile(
      id: 'parent_1',
      name: StringsManager.loginGuardianLabel,
      isChild: false,
    );

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.horizontalPadding,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: ResponsiveHelper.contentMaxWidth,
          ),
          child: Column(
            children: [
              SizedBox(height: ValuesManager.spaceHuge.h),
              // Rafiq mascot with greeting
              RafiqMascot(
                message: StringsManager.loginRafiqGreeting,
                size: isTablet
                    ? ValuesManager.mascotSizeTablet
                    : ValuesManager.mascotSizeDefault,
              ),
              SizedBox(height: ValuesManager.spaceLarge.h),
              // Welcome title
              Text(
                StringsManager.loginWelcomeTitle,
                style: ResponsiveStylesManager.getHeadline1(
                  color: isDark ? Colors.white : ColorsManager.darkGreyText,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ValuesManager.spaceSmall.h),
              Text(
                StringsManager.loginSubtitle,
                style: ResponsiveStylesManager.getBodyLarge(
                  color: isDark
                      ? ColorsManager.companionNeutral
                      : ColorsManager.focusState,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: ValuesManager.spaceExtraLarge.h),
              // Profile cards
              _ProfileCardsLayout(
                childProfile: childProfile,
                parentProfile: parentProfile,
                isTablet: isTablet,
              ),
              SizedBox(height: ValuesManager.spaceHuge.h),
            ],
          ),
        ),
      ),
    );
  }
}

/// Layout for profile cards - handles tablet/phone layouts
class _ProfileCardsLayout extends StatelessWidget {
  const _ProfileCardsLayout({
    required this.childProfile,
    required this.parentProfile,
    required this.isTablet,
  });

  final UserProfile childProfile;
  final UserProfile parentProfile;
  final bool isTablet;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    if (isTablet) {
      return _buildTabletLayout(cubit);
    }
    return _buildPhoneLayout(context, cubit);
  }

  Widget _buildTabletLayout(LoginCubit cubit) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        LoginProfileCard(
          profile: childProfile,
          onTap: () => cubit.selectProfile(childProfile),
          isPrimary: true,
          showGlowEffect: true,
        ),
        SizedBox(width: ValuesManager.spaceExtraLarge.w),
        LoginProfileCard(
          profile: parentProfile,
          onTap: () => cubit.selectProfile(parentProfile),
        ),
      ],
    );
  }

  Widget _buildPhoneLayout(BuildContext context, LoginCubit cubit) {
    return Column(
      children: [
        // Child profile (larger, centered)
        LoginProfileCard(
          profile: childProfile,
          onTap: () => cubit.selectProfile(childProfile),
          isPrimary: true,
          showGlowEffect: true,
        ),
        SizedBox(height: ValuesManager.spaceLarge.h),
        // Divider
        const _OrDivider(),
        SizedBox(height: ValuesManager.spaceLarge.h),
        // Parent profile (smaller)
        LoginProfileCard(
          profile: parentProfile,
          onTap: () => cubit.selectProfile(parentProfile),
        ),
      ],
    );
  }
}

/// "Or" divider between profile options
class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(
            color: ColorsManager.focusState.withValues(
              alpha: ValuesManager.opacityLight,
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceDefault.w,
          ),
          child: Text(
            StringsManager.orDivider,
            style: ResponsiveStylesManager.getBodySmall(
              color: ColorsManager.focusState,
            ),
          ),
        ),
        Expanded(
          child: Divider(
            color: ColorsManager.focusState.withValues(
              alpha: ValuesManager.opacityLight,
            ),
          ),
        ),
      ],
    );
  }
}
