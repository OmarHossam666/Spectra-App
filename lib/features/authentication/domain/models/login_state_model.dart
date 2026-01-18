/// Represents the current state/step of the login flow
enum LoginStep {
  /// Initial profile selection - Child or Parent
  profileSelection,

  /// Child pattern login (visual pattern authentication)
  childPatternLogin,

  /// Parent authentication (biometric/Huawei ID/PIN)
  parentAuthentication,
}

/// Represents a user profile for login
class UserProfile {
  final String id;
  final String name;
  final String? avatarPath;
  final bool isChild;
  final bool isActive;

  const UserProfile({
    required this.id,
    required this.name,
    this.avatarPath,
    required this.isChild,
    this.isActive = false,
  });

  UserProfile copyWith({
    String? id,
    String? name,
    String? avatarPath,
    bool? isChild,
    bool? isActive,
  }) {
    return UserProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      avatarPath: avatarPath ?? this.avatarPath,
      isChild: isChild ?? this.isChild,
      isActive: isActive ?? this.isActive,
    );
  }
}

/// Represents a pattern icon for child authentication
class PatternIcon {
  final String id;
  final String iconName;
  final int colorValue;

  const PatternIcon({
    required this.id,
    required this.iconName,
    required this.colorValue,
  });
}

/// Pre-defined pattern icons for child login
class PatternIcons {
  PatternIcons._();

  static const PatternIcon apple = PatternIcon(
    id: 'apple',
    iconName: 'nutrition',
    colorValue: 0xFFEF5350, // Red
  );

  static const PatternIcon star = PatternIcon(
    id: 'star',
    iconName: 'star',
    colorValue: 0xFFFFCA28, // Yellow
  );

  static const PatternIcon car = PatternIcon(
    id: 'car',
    iconName: 'directions_car',
    colorValue: 0xFF42A5F5, // Blue
  );

  static const PatternIcon cat = PatternIcon(
    id: 'cat',
    iconName: 'pets',
    colorValue: 0xFFFFA726, // Orange
  );

  static const PatternIcon heart = PatternIcon(
    id: 'heart',
    iconName: 'favorite',
    colorValue: 0xFFEC407A, // Pink
  );

  static const PatternIcon moon = PatternIcon(
    id: 'moon',
    iconName: 'dark_mode',
    colorValue: 0xFF7E57C2, // Purple
  );

  /// All available pattern icons
  static const List<PatternIcon> all = [apple, star, car, cat, heart, moon];

  /// Default 4-icon grid for login
  static const List<PatternIcon> defaultGrid = [apple, star, car, cat];
}
