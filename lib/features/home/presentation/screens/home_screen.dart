import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../cubit/home_cubit.dart';
import '../widgets/sky_header.dart';
import '../widgets/now_next_bar.dart';
import '../widgets/module_grid.dart';
import '../widgets/sos_button.dart';
import '../widgets/home_bottom_nav.dart';

/// Home Screen - Main dashboard for child users
/// Features:
/// - Dynamic sky header with profile and Rafiq
/// - Now/Next schedule bar
/// - Module grid (Talk, Feelings, Learn, Play, Calm Space)
/// - SOS emergency button
/// - Bottom navigation (Home, Chat, Settings)
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeCubit(),
      child: const _HomeScreenContent(),
    );
  }
}

class _HomeScreenContent extends StatelessWidget {
  const _HomeScreenContent();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: isDark
              ? ColorsManager.softBlack
              : ColorsManager.cream,
          body: Stack(
            children: [
              // Main scrollable content
              RefreshIndicator(
                onRefresh: () => context.read<HomeCubit>().refresh(),
                color: ColorsManager.communicationBlue,
                child: CustomScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  slivers: [
                    // Sky header
                    SliverToBoxAdapter(
                      child: SkyHeader(
                        childName: state.childName,
                        timePeriod: state.timePeriod,
                        avatarUrl: state.childAvatarUrl,
                        isOnline: state.isOnline,
                        rafiqMessage: state.rafiqMessage,
                        onRafiqTap: () => _onRafiqTap(context),
                        onProfileTap: () => _onProfileTap(context),
                      ),
                    ),
                    // Now/Next bar (overlapping header)
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: ValuesManager.spaceHuge.h,
                        ),
                        child: Transform.translate(
                          offset: Offset(0, -ValuesManager.spaceLarge.h),
                          child: NowNextBar(
                            currentActivity: state.currentActivity,
                            nextActivity: state.nextActivity,
                            onCurrentTap: () => _onActivityTap(
                              context,
                              state.currentActivity?.id,
                            ),
                            onNextTap: () =>
                                _onActivityTap(context, state.nextActivity?.id),
                          ),
                        ),
                      ),
                    ),
                    // Module grid
                    SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(
                          bottom: ValuesManager.spaceHuge.h * 2,
                        ),
                        child: ModuleGrid(
                          onModuleTap: (moduleId) =>
                              _onModuleTap(context, moduleId),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // SOS button (fixed position)
              Positioned(
                bottom: ValuesManager.spaceLarge.h,
                right: ValuesManager.spaceDefault.w,
                child: SosButton(onTap: () => _onSosTap(context)),
              ),
            ],
          ),
          // Bottom navigation
          bottomNavigationBar: HomeBottomNav(
            currentIndex: state.currentNavIndex,
            onTap: (index) => _onNavTap(context, index),
          ),
        );
      },
    );
  }

  void _onRafiqTap(BuildContext context) {
    // TODO: Open Rafiq interaction/play
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Rafiq says hi! 👋'),
        backgroundColor: ColorsManager.communicationBlue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
      ),
    );
  }

  void _onProfileTap(BuildContext context) {
    // TODO: Navigate to profile screen
    final cubit = context.read<HomeCubit>();
    cubit.changeNavIndex(2); // Switch to settings
  }

  void _onActivityTap(BuildContext context, String? activityId) {
    if (activityId == null) return;
    // TODO: Navigate to activity detail/routine view
  }

  void _onModuleTap(BuildContext context, String moduleId) {
    final cubit = context.read<HomeCubit>();
    cubit.navigateToModule(moduleId, context);
  }

  void _onSosTap(BuildContext context) {
    SosButton.showSosDialog(context, () {
      context.read<HomeCubit>().triggerSOS();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Help is on the way! Stay calm.'),
          backgroundColor: ColorsManager.companionAlert,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusMedium,
          ),
        ),
      );
    });
  }

  void _onNavTap(BuildContext context, int index) {
    final cubit = context.read<HomeCubit>();
    cubit.changeNavIndex(index);

    // Navigate to different screens based on index
    // 0 = Home (current), 1 = Chat, 2 = Settings
  }
}
