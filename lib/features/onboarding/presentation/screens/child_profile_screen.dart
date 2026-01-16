import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/avatar_model.dart';
import '../widgets/avatar_picker.dart';
import '../widgets/onboarding_button.dart';
import '../widgets/onboarding_text_field.dart';

/// Screen 1.2: Child Profile Setup
/// Avatar selection and name input
class ChildProfileScreen extends StatefulWidget {
  const ChildProfileScreen({
    super.key,
    required this.onContinue,
    this.initialName,
    this.initialAvatarId,
  });

  final void Function(String name, AvatarModel avatar) onContinue;
  final String? initialName;
  final String? initialAvatarId;

  @override
  State<ChildProfileScreen> createState() => _ChildProfileScreenState();
}

class _ChildProfileScreenState extends State<ChildProfileScreen> {
  late TextEditingController _nameController;
  String? _selectedAvatarId;

  // Sample avatars - in production, load from assets or network
  static const _avatars = [
    AvatarModel(
      id: StringsManager.avatarIdLeo,
      name: StringsManager.avatarLeo,
      imagePath: StringsManager.avatarUrlLeo,
      color: AvatarColor.orange,
    ),
    AvatarModel(
      id: StringsManager.avatarIdTrunks,
      name: StringsManager.avatarTrunks,
      imagePath: StringsManager.avatarUrlTrunks,
      color: AvatarColor.blue,
    ),
    AvatarModel(
      id: StringsManager.avatarIdHops,
      name: StringsManager.avatarHops,
      imagePath: StringsManager.avatarUrlHops,
      color: AvatarColor.green,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.initialName);
    _selectedAvatarId =
        widget.initialAvatarId ?? _avatars[1].id; // Default to Trunks
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  AvatarModel? get _selectedAvatar {
    return _avatars.where((a) => a.id == _selectedAvatarId).firstOrNull;
  }

  bool get _canContinue {
    return _selectedAvatarId != null && _nameController.text.trim().isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: ValuesManager.spaceDefault.h),
          // Header
          Text(
            StringsManager.childProfileTitle,
            style: StylesManager.getHeadline2(
              color: isDark ? ColorsManager.cream : ColorsManager.darkGreyText,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ValuesManager.spaceSmall.h),
          Text(
            StringsManager.childProfileSubtitle,
            style: StylesManager.getBodyLarge(color: ColorsManager.focusState),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ValuesManager.spaceLarge.h),

          // Avatar Picker
          AvatarPicker(
            avatars: _avatars,
            selectedAvatarId: _selectedAvatarId,
            onAvatarSelected: (avatar) {
              setState(() => _selectedAvatarId = avatar.id);
            },
          ),
          SizedBox(height: ValuesManager.spaceLarge.h),

          // Name Input
          OnboardingTextField(
            controller: _nameController,
            hintText: StringsManager.nameInputHint,
            onChanged: (_) => setState(() {}),
          ),
          SizedBox(height: ValuesManager.spaceExtraLarge.h),

          // Continue Button
          OnboardingButton(
            label: StringsManager.continueButton,
            icon: Icons.arrow_forward,
            onPressed: _canContinue
                ? () => widget.onContinue(
                    _nameController.text.trim(),
                    _selectedAvatar!,
                  )
                : null,
            backgroundColor: _canContinue
                ? ColorsManager.communicationBlue
                : ColorsManager.focusState.withValues(alpha: 0.3),
          ),
          SizedBox(height: ValuesManager.spaceHuge.h),
        ],
      ),
    );
  }
}
