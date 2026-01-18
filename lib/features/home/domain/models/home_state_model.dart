import 'package:flutter/material.dart';

/// Represents a scheduled activity in the routine
class ScheduleActivity {
  const ScheduleActivity({
    required this.id,
    required this.title,
    required this.iconData,
    required this.backgroundColor,
    required this.iconColor,
    this.subtitle,
    this.progress = 0.0,
    this.duration,
    this.isCompleted = false,
  });

  final String id;
  final String title;
  final IconData iconData;
  final Color backgroundColor;
  final Color iconColor;
  final String? subtitle;
  final double progress;
  final Duration? duration;
  final bool isCompleted;

  ScheduleActivity copyWith({
    String? id,
    String? title,
    IconData? iconData,
    Color? backgroundColor,
    Color? iconColor,
    String? subtitle,
    double? progress,
    Duration? duration,
    bool? isCompleted,
  }) {
    return ScheduleActivity(
      id: id ?? this.id,
      title: title ?? this.title,
      iconData: iconData ?? this.iconData,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      iconColor: iconColor ?? this.iconColor,
      subtitle: subtitle ?? this.subtitle,
      progress: progress ?? this.progress,
      duration: duration ?? this.duration,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

/// Represents a module card on the home screen
class HomeModule {
  const HomeModule({
    required this.id,
    required this.title,
    required this.iconData,
    required this.backgroundColor,
    required this.iconColor,
    this.subtitle,
    this.isHighlighted = false,
    this.route,
  });

  final String id;
  final String title;
  final IconData iconData;
  final Color backgroundColor;
  final Color iconColor;
  final String? subtitle;
  final bool isHighlighted;
  final String? route;
}

/// Represents a bottom navigation item
class NavItem {
  const NavItem({
    required this.id,
    required this.label,
    required this.iconData,
    required this.selectedIconData,
  });

  final String id;
  final String label;
  final IconData iconData;
  final IconData selectedIconData;
}

/// Navigation destinations
enum NavDestination { home, chat, settings }

/// Time period for dynamic theming
enum TimePeriod { morning, afternoon, evening, night }

/// Extension to get time period from DateTime
extension DateTimeExtension on DateTime {
  TimePeriod get timePeriod {
    final hour = this.hour;
    if (hour >= 5 && hour < 12) return TimePeriod.morning;
    if (hour >= 12 && hour < 17) return TimePeriod.afternoon;
    if (hour >= 17 && hour < 21) return TimePeriod.evening;
    return TimePeriod.night;
  }
}
