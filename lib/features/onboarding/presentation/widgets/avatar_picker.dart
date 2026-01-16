import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/avatar_model.dart';

/// Avatar selection widget for child profile setup
class AvatarPicker extends StatelessWidget {
  const AvatarPicker({
    super.key,
    required this.avatars,
    required this.selectedAvatarId,
    required this.onAvatarSelected,
  });

  final List<AvatarModel> avatars;
  final String? selectedAvatarId;
  final ValueChanged<AvatarModel> onAvatarSelected;

  Color _getAvatarColor(AvatarColor color) {
    switch (color) {
      case AvatarColor.orange:
        return const Color(0xFFFFE0B2); // Orange 100
      case AvatarColor.blue:
        return const Color(0xFFBBDEFB); // Blue 100
      case AvatarColor.green:
        return const Color(0xFFC8E6C9); // Green 100
      case AvatarColor.purple:
        return ColorsManager.lavender.withValues(alpha: 0.3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(vertical: ValuesManager.spaceDefault.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: avatars.map((avatar) {
          final isSelected = avatar.id == selectedAvatarId;
          return _AvatarItem(
            avatar: avatar,
            isSelected: isSelected,
            backgroundColor: _getAvatarColor(avatar.color),
            onTap: () => onAvatarSelected(avatar),
          );
        }).toList(),
      ),
    );
  }
}

class _AvatarItem extends StatelessWidget {
  const _AvatarItem({
    required this.avatar,
    required this.isSelected,
    required this.backgroundColor,
    required this.onTap,
  });

  final AvatarModel avatar;
  final bool isSelected;
  final Color backgroundColor;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = isSelected ? 112.0.r : 96.0.r;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: ValuesManager.spaceSmall.w),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar Circle
            AnimatedContainer(
              duration: ValuesManager.durationMedium,
              curve: Curves.easeInOut,
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: backgroundColor,
                border: Border.all(
                  color: isSelected
                      ? ColorsManager.communicationBlue
                      : Colors.transparent,
                  width: 4.r,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: ColorsManager.communicationBlue.withValues(
                            alpha: 0.3,
                          ),
                          blurRadius: 12.r,
                          spreadRadius: 2.r,
                        ),
                      ]
                    : [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 4.r,
                        ),
                      ],
              ),
              child: ClipOval(
                child: avatar.imagePath.isNotEmpty
                    ? Image.network(
                        avatar.imagePath,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            _PlaceholderAvatar(name: avatar.name),
                      )
                    : _PlaceholderAvatar(name: avatar.name),
              ),
            ),
            SizedBox(height: ValuesManager.spaceMedium.h),
            // Name Label
            AnimatedDefaultTextStyle(
              duration: ValuesManager.durationMedium,
              style:
                  StylesManager.getButtonSecondary(
                    color: isSelected
                        ? ColorsManager.communicationBlue
                        : ColorsManager.focusState,
                  ).copyWith(
                    fontSize: isSelected
                        ? ValuesManager.fontSizeBodyLarge.sp
                        : ValuesManager.fontSizeBodySmall.sp,
                    fontWeight: FontWeight.bold,
                  ),
              child: Text(avatar.name),
            ),
            // Checkmark
            AnimatedOpacity(
              duration: ValuesManager.durationMedium,
              opacity: isSelected ? 1.0 : 0.0,
              child: Padding(
                padding: EdgeInsets.only(top: ValuesManager.spaceSmall.h),
                child: Icon(
                  Icons.check_circle,
                  color: ColorsManager.communicationBlue,
                  size: ValuesManager.iconSizeDefault.r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceholderAvatar extends StatelessWidget {
  const _PlaceholderAvatar({required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        name.isNotEmpty
            ? name[0].toUpperCase()
            : StringsManager.unknownCharacter,
        style: StylesManager.getHeadline1(color: ColorsManager.focusState),
      ),
    );
  }
}
