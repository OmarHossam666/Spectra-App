import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/models/login_state_model.dart';

part 'login_state.dart';

/// LoginCubit manages the login flow state
/// Handles profile selection, child pattern authentication, and parent auth
class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  /// Select a profile to log in as
  void selectProfile(UserProfile profile) {
    if (profile.isChild) {
      emit(
        state.copyWith(
          selectedProfile: profile,
          currentStep: LoginStep.childPatternLogin,
          selectedPatternIcons: [],
          patternError: null,
        ),
      );
    } else {
      emit(
        state.copyWith(
          selectedProfile: profile,
          currentStep: LoginStep.parentAuthentication,
          patternError: null,
        ),
      );
    }
  }

  /// Go back to profile selection
  void goBackToProfileSelection() {
    emit(
      state.copyWith(
        currentStep: LoginStep.profileSelection,
        selectedProfile: null,
        selectedPatternIcons: [],
        patternError: null,
      ),
    );
  }

  /// Add a pattern icon to the selected sequence
  void addPatternIcon(PatternIcon icon) {
    // Don't add if already selected
    if (state.selectedPatternIcons.any((i) => i.id == icon.id)) {
      return;
    }

    final updatedIcons = [...state.selectedPatternIcons, icon];
    emit(
      state.copyWith(selectedPatternIcons: updatedIcons, patternError: null),
    );

    // Auto-validate when 3 icons are selected
    if (updatedIcons.length == 3) {
      _validatePattern(updatedIcons);
    }
  }

  /// Remove the last selected pattern icon
  void removeLastPatternIcon() {
    if (state.selectedPatternIcons.isEmpty) return;

    final updatedIcons = [...state.selectedPatternIcons]..removeLast();
    emit(
      state.copyWith(selectedPatternIcons: updatedIcons, patternError: null),
    );
  }

  /// Clear all selected pattern icons
  void clearPattern() {
    emit(state.copyWith(selectedPatternIcons: [], patternError: null));
  }

  /// Validate the pattern against the expected sequence
  void _validatePattern(List<PatternIcon> icons) {
    // In production, this would check against stored user pattern
    // For demo, we'll use a simple hardcoded pattern: apple -> star -> car
    final expectedPattern = [
      PatternIcons.apple.id,
      PatternIcons.star.id,
      PatternIcons.car.id,
    ];

    final selectedIds = icons.map((i) => i.id).toList();

    if (listEquals(selectedIds, expectedPattern)) {
      emit(state.copyWith(isAuthenticated: true, patternError: null));
    } else {
      emit(
        state.copyWith(
          patternError: 'Oops! Try again.',
          selectedPatternIcons: [],
        ),
      );
    }
  }

  /// Authenticate parent with Huawei ID
  void authenticateWithHuaweiId() {
    emit(state.copyWith(isLoading: true));

    // Simulate authentication delay
    Future.delayed(const Duration(seconds: 1), () {
      emit(state.copyWith(isLoading: false, isAuthenticated: true));
    });
  }

  /// Authenticate parent with biometric (fingerprint/face)
  void authenticateWithBiometric() {
    emit(state.copyWith(isLoading: true));

    // Simulate biometric authentication
    Future.delayed(const Duration(milliseconds: 1500), () {
      emit(state.copyWith(isLoading: false, isAuthenticated: true));
    });
  }

  /// Show PIN input screen
  void showPinInput() {
    emit(state.copyWith(showPinInput: true));
  }

  /// Hide PIN input screen
  void hidePinInput() {
    emit(state.copyWith(showPinInput: false));
  }

  /// Validate PIN code
  void validatePin(String pin) {
    emit(state.copyWith(isLoading: true));

    // In production, validate against stored PIN
    // For demo, accept any 4-digit PIN
    Future.delayed(const Duration(milliseconds: 500), () {
      if (pin.length == 4) {
        emit(
          state.copyWith(
            isLoading: false,
            isAuthenticated: true,
            showPinInput: false,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoading: false,
            patternError: 'PIN must be 4 digits',
          ),
        );
      }
    });
  }

  /// Reset the entire login state
  void reset() {
    emit(const LoginState());
  }
}

/// Helper function for list equality check
bool listEquals<T>(List<T> a, List<T> b) {
  if (a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
