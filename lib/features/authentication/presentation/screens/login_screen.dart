import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/login_state_model.dart';
import '../cubit/login_cubit.dart';
import '../widgets/quick_help_button.dart';
import 'views/views.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const _LoginScreenContent(),
    );
  }
}

class _LoginScreenContent extends StatelessWidget {
  const _LoginScreenContent();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? ColorsManager.softBlack : ColorsManager.cream,
      body: SafeArea(
        child: Stack(
          children: [
            // Background decoration
            Positioned.fill(
              child: CustomPaint(
                painter: LoginBackgroundPainter(isDark: isDark),
              ),
            ),
            // Main content
            _buildMainContent(context),
            // Emergency help button (always visible)
            Positioned(
              top: ValuesManager.spaceDefault.h,
              right: ValuesManager.spaceDefault.w,
              child: EmergencyHelpBanner(
                onTap: () => showLoginHelpDialog(context),
              ),
            ),
          ],
        ),
      ),
      // Floating help button
      floatingActionButton: QuickHelpButton(
        onTap: () => showLoginHelpDialog(context),
        isCompact: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Widget _buildMainContent(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: ValuesManager.durationMedium,
          transitionBuilder: (child, animation) {
            return FadeTransition(
              opacity: animation,
              child: SlideTransition(
                position:
                    Tween<Offset>(
                      begin: const Offset(0, 0.1),
                      end: Offset.zero,
                    ).animate(
                      CurvedAnimation(parent: animation, curve: Curves.easeOut),
                    ),
                child: child,
              ),
            );
          },
          child: _buildCurrentStep(state),
        );
      },
    );
  }

  Widget _buildCurrentStep(LoginState state) {
    switch (state.currentStep) {
      case LoginStep.profileSelection:
        return const ProfileSelectionView(key: ValueKey('profile'));
      case LoginStep.childPatternLogin:
        return ChildPatternView(
          key: const ValueKey('pattern'),
          profile: state.selectedProfile!,
        );
      case LoginStep.parentAuthentication:
        return const ParentAuthView(key: ValueKey('parent'));
    }
  }
}
