import 'package:equatable/equatable.dart';
import '../../domain/models/home_state_model.dart';

/// Home screen state
class HomeState extends Equatable {
  const HomeState({
    this.currentNavIndex = 0,
    this.currentActivity,
    this.nextActivity,
    this.childName = 'Leo',
    this.childAvatarUrl,
    this.isOnline = true,
    this.timePeriod = TimePeriod.morning,
    this.rafiqMessage,
    this.isLoading = false,
  });

  /// Current bottom navigation index
  final int currentNavIndex;

  /// Current scheduled activity (Now)
  final ScheduleActivity? currentActivity;

  /// Next scheduled activity
  final ScheduleActivity? nextActivity;

  /// Child's display name
  final String childName;

  /// Child's avatar URL
  final String? childAvatarUrl;

  /// Whether child is online/active
  final bool isOnline;

  /// Current time of day for theming
  final TimePeriod timePeriod;

  /// Rafiq's current message
  final String? rafiqMessage;

  /// Loading state
  final bool isLoading;

  @override
  List<Object?> get props => [
    currentNavIndex,
    currentActivity,
    nextActivity,
    childName,
    childAvatarUrl,
    isOnline,
    timePeriod,
    rafiqMessage,
    isLoading,
  ];

  HomeState copyWith({
    int? currentNavIndex,
    ScheduleActivity? currentActivity,
    ScheduleActivity? nextActivity,
    String? childName,
    String? childAvatarUrl,
    bool? isOnline,
    TimePeriod? timePeriod,
    String? rafiqMessage,
    bool? isLoading,
  }) {
    return HomeState(
      currentNavIndex: currentNavIndex ?? this.currentNavIndex,
      currentActivity: currentActivity ?? this.currentActivity,
      nextActivity: nextActivity ?? this.nextActivity,
      childName: childName ?? this.childName,
      childAvatarUrl: childAvatarUrl ?? this.childAvatarUrl,
      isOnline: isOnline ?? this.isOnline,
      timePeriod: timePeriod ?? this.timePeriod,
      rafiqMessage: rafiqMessage ?? this.rafiqMessage,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
