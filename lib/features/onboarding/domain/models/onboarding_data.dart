import 'avatar_model.dart';
import 'user_role.dart';

/// Complete onboarding data collected from user
class OnboardingData {
  final UserRole? selectedRole;
  final AvatarModel? selectedAvatar;
  final String? childName;
  final List<String> selectedTriggers;
  final double animationSpeed;

  const OnboardingData({
    this.selectedRole,
    this.selectedAvatar,
    this.childName,
    this.selectedTriggers = const [],
    this.animationSpeed = 0.5,
  });

  OnboardingData copyWith({
    UserRole? selectedRole,
    AvatarModel? selectedAvatar,
    String? childName,
    List<String>? selectedTriggers,
    double? animationSpeed,
  }) {
    return OnboardingData(
      selectedRole: selectedRole ?? this.selectedRole,
      selectedAvatar: selectedAvatar ?? this.selectedAvatar,
      childName: childName ?? this.childName,
      selectedTriggers: selectedTriggers ?? this.selectedTriggers,
      animationSpeed: animationSpeed ?? this.animationSpeed,
    );
  }
}
