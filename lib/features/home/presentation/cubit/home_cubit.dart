import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/home_state_model.dart';
import 'home_state.dart';

export 'home_state.dart';

/// Cubit for managing home screen state
class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState()) {
    _initialize();
  }

  /// Initialize home screen data
  void _initialize() {
    // Set time of day
    final now = DateTime.now();
    final timePeriod = now.timePeriod;

    // Demo data - In production, load from storage/API
    final currentActivity = ScheduleActivity(
      id: StringsManager.homeActivityBreakfastId,
      title: StringsManager.homeActivityBreakfast,
      iconData: Icons.bakery_dining_rounded,
      backgroundColor: ColorsManager.activityBreakfastBg,
      iconColor: Colors.orange,
      subtitle: StringsManager.homeActivityBreakfastSubtitle,
      progress: ValuesManager.homeActivityProgress,
      duration: Duration(minutes: ValuesManager.homeActivityDurationMinutes),
    );

    final nextActivity = ScheduleActivity(
      id: StringsManager.homeActivitySchoolBusId,
      title: StringsManager.homeActivitySchoolBus,
      iconData: Icons.directions_bus_rounded,
      backgroundColor: ColorsManager.paleBlue,
      iconColor: ColorsManager.communicationBlue,
    );

    final rafiqMessage = _getRafiqMessage(timePeriod);

    emit(
      state.copyWith(
        currentActivity: currentActivity,
        nextActivity: nextActivity,
        timePeriod: timePeriod,
        rafiqMessage: rafiqMessage,
        childAvatarUrl: StringsManager.homeChildAvatarUrl,
      ),
    );
  }

  /// Get Rafiq's message based on time of day
  String _getRafiqMessage(TimePeriod timePeriod) {
    switch (timePeriod) {
      case TimePeriod.morning:
        return StringsManager.homeRafiqMorning;
      case TimePeriod.afternoon:
        return StringsManager.homeRafiqAfternoon;
      case TimePeriod.evening:
        return StringsManager.homeRafiqEvening;
      case TimePeriod.night:
        return StringsManager.homeRafiqNight;
    }
  }

  /// Change bottom navigation tab
  void changeNavIndex(int index) {
    emit(state.copyWith(currentNavIndex: index));
  }

  /// Update current activity progress
  void updateActivityProgress(double progress) {
    if (state.currentActivity != null) {
      emit(
        state.copyWith(
          currentActivity: state.currentActivity!.copyWith(progress: progress),
        ),
      );
    }
  }

  /// Mark current activity as complete and move to next
  void completeCurrentActivity() {
    if (state.currentActivity != null && state.nextActivity != null) {
      emit(
        state.copyWith(
          currentActivity: state.nextActivity,
          nextActivity: null, // In production, fetch next from schedule
        ),
      );
    }
  }

  /// Trigger SOS/Help action
  void triggerSOS() {
    // TODO: Implement SOS functionality
    // - Notify parent/guardian
    // - Show calming UI
    // - Log incident
  }

  /// Navigate to module
  void navigateToModule(String moduleId) {
    // TODO: Implement navigation to specific modules
    // This would use go_router in production
  }

  /// Refresh home data
  Future<void> refresh() async {
    emit(state.copyWith(isLoading: true));

    // Simulate API call
    await Future.delayed(
      Duration(milliseconds: ValuesManager.homeRefreshDelayMs),
    );

    _initialize();
    emit(state.copyWith(isLoading: false));
  }
}
