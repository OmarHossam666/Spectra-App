import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/features/onboarding/presentation/screens/child_profile_screen.dart';
import 'package:spectra/features/onboarding/presentation/screens/mascot_intro_screen.dart';
import 'package:spectra/features/onboarding/presentation/screens/role_selection_screen.dart';
import 'package:spectra/features/onboarding/presentation/screens/sensory_profile_screen.dart';
import '../../domain/models/avatar_model.dart';
import '../../domain/models/onboarding_data.dart';
import '../../domain/models/user_role.dart';
import '../widgets/onboarding_app_bar.dart';

/// Main Onboarding Page
/// Manages the flow between all onboarding screens using PageView
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  static const int _totalSteps = 4;

  // Collected onboarding data
  OnboardingData _onboardingData = const OnboardingData();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: ValuesManager.durationMedium,
      curve: Curves.easeInOut,
    );
    setState(() => _currentStep = page);
  }

  void _nextPage() {
    if (_currentStep < _totalSteps - 1) {
      _goToPage(_currentStep + 1);
    }
  }

  void _previousPage() {
    if (_currentStep > 0) {
      _goToPage(_currentStep - 1);
    }
  }

  void _handleRoleSelected(UserRole role) {
    setState(() {
      _onboardingData = _onboardingData.copyWith(selectedRole: role);
    });
    if (role == UserRole.child) {
      _nextPage();
    } else {
      // Navigate to parent flow (not implemented in this design)
      _showParentFlowNotImplemented();
    }
  }

  void _handleChildProfileComplete(String name, AvatarModel avatar) {
    setState(() {
      _onboardingData = _onboardingData.copyWith(
        childName: name,
        selectedAvatar: avatar,
      );
    });
    _nextPage();
  }

  void _handleSensoryProfileComplete(
    Set<String> triggers,
    double animationSpeed,
  ) {
    setState(() {
      _onboardingData = _onboardingData.copyWith(
        selectedTriggers: triggers.toList(),
        animationSpeed: animationSpeed,
      );
    });
    _nextPage();
  }

  void _handleOnboardingComplete() {
    // Save onboarding data and navigate to main app
    _showCompletionMessage();
  }

  void _showParentFlowNotImplemented() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text(StringsManager.parentFlowComingSoon),
        backgroundColor: ColorsManager.companionCalm,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ValuesManager.radiusMedium.r),
        ),
      ),
    );
  }

  void _showCompletionMessage() {
    // In production, navigate to main app
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ValuesManager.radiusLarge.r),
        ),
        title: const Text(StringsManager.completionTitle),
        content: Text(
          StringsManager.getCompletionMessage(
            _onboardingData.childName ?? StringsManager.defaultFriendName,
            _onboardingData.selectedAvatar?.name,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Reset for demo purposes
              setState(() {
                _onboardingData = const OnboardingData();
                _currentStep = 0;
              });
              _pageController.jumpToPage(0);
            },
            child: const Text(StringsManager.startOverButton),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDark ? ColorsManager.softBlack : ColorsManager.cream,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar with progress indicator
            OnboardingAppBar(
              currentStep: _currentStep,
              totalSteps: _totalSteps,
              onBack: _currentStep > 0 ? _previousPage : null,
              showBackButton: _currentStep > 0,
            ),

            // Page Content
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (page) => setState(() => _currentStep = page),
                children: [
                  // Screen 1: Role Selection
                  RoleSelectionScreen(onRoleSelected: _handleRoleSelected),

                  // Screen 2: Child Profile
                  ChildProfileScreen(
                    onContinue: _handleChildProfileComplete,
                    initialName: _onboardingData.childName,
                    initialAvatarId: _onboardingData.selectedAvatar?.id,
                  ),

                  // Screen 3: Sensory Profile
                  SensoryProfileScreen(
                    childName:
                        _onboardingData.childName ??
                        StringsManager.defaultChildName,
                    onContinue: _handleSensoryProfileComplete,
                    initialTriggers: _onboardingData.selectedTriggers.toSet(),
                    initialAnimationSpeed: _onboardingData.animationSpeed,
                  ),

                  // Screen 4: Mascot Introduction
                  MascotIntroScreen(
                    childName:
                        _onboardingData.childName ??
                        StringsManager.defaultFriendName,
                    onComplete: _handleOnboardingComplete,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
