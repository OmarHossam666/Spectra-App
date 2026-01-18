part of 'login_cubit.dart';

/// Represents the complete login state
class LoginState extends Equatable {
  final LoginStep currentStep;
  final UserProfile? selectedProfile;
  final List<PatternIcon> selectedPatternIcons;
  final String? patternError;
  final bool isLoading;
  final bool isAuthenticated;
  final bool showPinInput;

  const LoginState({
    this.currentStep = LoginStep.profileSelection,
    this.selectedProfile,
    this.selectedPatternIcons = const [],
    this.patternError,
    this.isLoading = false,
    this.isAuthenticated = false,
    this.showPinInput = false,
  });

  LoginState copyWith({
    LoginStep? currentStep,
    UserProfile? selectedProfile,
    List<PatternIcon>? selectedPatternIcons,
    String? patternError,
    bool? isLoading,
    bool? isAuthenticated,
    bool? showPinInput,
  }) {
    return LoginState(
      currentStep: currentStep ?? this.currentStep,
      selectedProfile: selectedProfile ?? this.selectedProfile,
      selectedPatternIcons: selectedPatternIcons ?? this.selectedPatternIcons,
      patternError: patternError,
      isLoading: isLoading ?? this.isLoading,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      showPinInput: showPinInput ?? this.showPinInput,
    );
  }

  @override
  List<Object?> get props => [
    currentStep,
    selectedProfile,
    selectedPatternIcons,
    patternError,
    isLoading,
    isAuthenticated,
    showPinInput,
  ];
}
