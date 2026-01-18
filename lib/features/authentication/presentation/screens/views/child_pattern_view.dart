import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import 'package:spectra/core/helpers/responsive_helper.dart';
import 'package:spectra/core/routes/routes_manager.dart';
import '../../../domain/models/login_state_model.dart';
import '../../cubit/login_cubit.dart';
import '../../widgets/pattern_login_grid.dart';
import '../../widgets/rafiq_mascot.dart';

/// Child Pattern Login View
/// Displays pattern-based authentication for child users
class ChildPatternView extends StatelessWidget {
  const ChildPatternView({super.key, required this.profile});

  final UserProfile profile;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cubit = context.read<LoginCubit>();

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (prev, curr) => prev.isAuthenticated != curr.isAuthenticated,
      listener: (context, state) {
        if (state.isAuthenticated) {
          _onAuthenticationSuccess(context);
        }
      },
      child: SingleChildScrollView(
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
                SizedBox(height: ValuesManager.spaceLarge.h),
                // Back button and header
                _ChildPatternHeader(isDark: isDark),
                SizedBox(height: ValuesManager.spaceLarge.h),
                // Rafiq mascot
                RafiqMascot(
                  message: StringsManager.loginRafiqPatternHint,
                  size: ValuesManager.mascotSizeSmall,
                ),
                SizedBox(height: ValuesManager.spaceLarge.h),
                // Title
                _ChildGreeting(profile: profile, isDark: isDark),
                SizedBox(height: ValuesManager.spaceLarge.h),
                // Pattern grid
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return PatternLoginGrid(
                      patternIcons: PatternIcons.defaultGrid,
                      selectedIcons: state.selectedPatternIcons,
                      onIconTap: cubit.addPatternIcon,
                      errorMessage: state.patternError,
                    );
                  },
                ),
                SizedBox(height: ValuesManager.spaceLarge.h),
                // Clear button
                _ClearPatternButton(onPressed: cubit.clearPattern),
                SizedBox(height: ValuesManager.spaceHuge.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onAuthenticationSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: ValuesManager.iconSizeMedium.r,
            ),
            SizedBox(width: ValuesManager.spaceSmall.w),
            Text(StringsManager.getLoginSuccessChild(profile.name)),
          ],
        ),
        backgroundColor: ColorsManager.routineGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
      ),
    );

    context.pushReplacement(RoutesManager.home);
  }
}

/// Header with back button for child pattern view
class _ChildPatternHeader extends StatelessWidget {
  const _ChildPatternHeader({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () =>
              context.read<LoginCubit>().goBackToProfileSelection(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: isDark ? Colors.white : ColorsManager.darkGreyText,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}

/// Child greeting text
class _ChildGreeting extends StatelessWidget {
  const _ChildGreeting({required this.profile, required this.isDark});

  final UserProfile profile;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          StringsManager.getChildGreeting(profile.name),
          style: ResponsiveStylesManager.getHeadline2(
            color: isDark ? Colors.white : ColorsManager.darkGreyText,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: ValuesManager.spaceSmall.h),
        Text(
          StringsManager.loginPatternTitle,
          style: ResponsiveStylesManager.getBodyLarge(
            color: isDark
                ? ColorsManager.companionNeutral
                : ColorsManager.focusState,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Clear pattern button
class _ClearPatternButton extends StatelessWidget {
  const _ClearPatternButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(Icons.refresh_rounded, size: ValuesManager.iconSizeMedium.r),
      label: const Text(StringsManager.loginClearPattern),
    );
  }
}
