import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/sensory_trigger_model.dart';
import '../widgets/animation_speed_slider.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/sensory_trigger_grid.dart';

/// Screen 1.3: Sensory Profile Wizard
/// Select sensory triggers and animation speed preference
class SensoryProfileScreen extends StatefulWidget {
  const SensoryProfileScreen({
    super.key,
    required this.childName,
    required this.onContinue,
    this.initialTriggers = const {},
    this.initialAnimationSpeed = 0.4,
  });

  final String childName;
  final void Function(Set<String> triggers, double animationSpeed) onContinue;
  final Set<String> initialTriggers;
  final double initialAnimationSpeed;

  @override
  State<SensoryProfileScreen> createState() => _SensoryProfileScreenState();
}

class _SensoryProfileScreenState extends State<SensoryProfileScreen> {
  late Set<String> _selectedTriggers;
  late double _animationSpeed;

  // Sensory trigger options
  static final _triggers = [
    SensoryTriggerModel(
      id: StringsManager.triggerIdLoudNoises,
      label: StringsManager.triggerLabelLoudNoises,
      icon: Icons.volume_up,
      backgroundColor: const Color(0xFFFFE0B2), // Orange 100
      iconColor: const Color(0xFFEF6C00), // Orange 800
    ),
    SensoryTriggerModel(
      id: StringsManager.triggerIdBrightLights,
      label: StringsManager.triggerLabelBrightLights,
      icon: Icons.wb_sunny,
      backgroundColor: const Color(0xFFFFF9C4), // Yellow 100
      iconColor: const Color(0xFFF9A825), // Yellow 800
    ),
    SensoryTriggerModel(
      id: StringsManager.triggerIdScratchyClothes,
      label: StringsManager.triggerLabelScratchyClothes,
      icon: Icons.dry_cleaning,
      backgroundColor: const Color(0xFFE1BEE7), // Purple 100
      iconColor: const Color(0xFF7B1FA2), // Purple 700
    ),
    SensoryTriggerModel(
      id: StringsManager.triggerIdCrowds,
      label: StringsManager.triggerLabelCrowds,
      icon: Icons.people,
      backgroundColor: const Color(0xFFF8BBD0), // Pink 100
      iconColor: const Color(0xFFC2185B), // Pink 700
    ),
  ];

  @override
  void initState() {
    super.initState();
    _selectedTriggers = Set.from(widget.initialTriggers);
    _animationSpeed = widget.initialAnimationSpeed;
  }

  void _toggleTrigger(String triggerId) {
    setState(() {
      if (_selectedTriggers.contains(triggerId)) {
        _selectedTriggers.remove(triggerId);
      } else {
        _selectedTriggers.add(triggerId);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: ValuesManager.spaceDefault.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ValuesManager.spaceDefault.h),
          // Header
          RichText(
            text: TextSpan(
              style: StylesManager.getHeadline2(
                color: isDark
                    ? ColorsManager.cream
                    : ColorsManager.darkGreyText,
              ),
              children: [
                const TextSpan(text: StringsManager.sensoryProfileTitlePrefix),
                TextSpan(
                  text: widget.childName,
                  style: StylesManager.getHeadline2(
                    color: ColorsManager.communicationBlue,
                  ),
                ),
                const TextSpan(text: StringsManager.sensoryProfileTitleSuffix),
              ],
            ),
          ),
          SizedBox(height: ValuesManager.spaceSmall.h),
          Text(
            StringsManager.sensoryProfileSubtitle,
            style: StylesManager.getBodyLarge(color: ColorsManager.focusState),
          ),
          SizedBox(height: ValuesManager.spaceLarge.h),

          // Trigger Grid
          SensoryTriggerGrid(
            triggers: _triggers,
            selectedTriggerIds: _selectedTriggers,
            onTriggerToggled: _toggleTrigger,
          ),
          SizedBox(height: ValuesManager.spaceLarge.h),

          // Animation Speed Slider
          AnimationSpeedSlider(
            value: _animationSpeed,
            onChanged: (value) => setState(() => _animationSpeed = value),
          ),
          SizedBox(height: ValuesManager.spaceExtraLarge.h),

          // Continue Button
          OnboardingButton(
            label: StringsManager.continueButton,
            icon: Icons.arrow_forward,
            onPressed: () =>
                widget.onContinue(_selectedTriggers, _animationSpeed),
          ),
          SizedBox(height: ValuesManager.spaceHuge.h),
        ],
      ),
    );
  }
}
