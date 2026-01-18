import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import '../../domain/models/home_state_model.dart';

/// Bottom navigation bar with Home, Chat, and Settings
/// Follows neuro-inclusive design with large touch targets and clear icons
class HomeBottomNav extends StatelessWidget {
  const HomeBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final ValueChanged<int> onTap;

  static const List<NavItem> _items = [
    NavItem(
      id: 'home',
      label: StringsManager.navHome,
      iconData: Icons.home_outlined,
      selectedIconData: Icons.home_rounded,
    ),
    NavItem(
      id: 'chat',
      label: StringsManager.navChat,
      iconData: Icons.chat_bubble_outline_rounded,
      selectedIconData: Icons.chat_bubble_rounded,
    ),
    NavItem(
      id: 'settings',
      label: StringsManager.navSettings,
      iconData: Icons.settings_outlined,
      selectedIconData: Icons.settings_rounded,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      decoration: BoxDecoration(
        color: isDark
            ? ColorsManager.darkGreySurface.withValues(alpha: 0.95)
            : Colors.white.withValues(alpha: 0.95),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(ValuesManager.radiusExtraLarge.r),
          topRight: Radius.circular(ValuesManager.radiusExtraLarge.r),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: ValuesManager.homeNavShadowBlurRadius.r,
            offset: Offset(0, ValuesManager.homeNavShadowOffsetY.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceLarge.w,
            vertical: ValuesManager.spaceSmall.h,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              _items.length,
              (index) => _NavItem(
                item: _items[index],
                isSelected: currentIndex == index,
                onTap: () => onTap(index),
                isDark: isDark,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Individual navigation item
class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.item,
    required this.isSelected,
    required this.onTap,
    required this.isDark,
  });

  final NavItem item;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: ValuesManager.durationFast,
        padding: EdgeInsets.symmetric(
          horizontal: ValuesManager.spaceDefault.w,
          vertical: ValuesManager.spaceSmall.h,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? item.selectedIconData : item.iconData,
              color: isSelected
                  ? ColorsManager.communicationBlue
                  : isDark
                  ? ColorsManager.companionNeutral
                  : ColorsManager.focusState,
              size: ValuesManager.iconSizeLarge.r,
            ),
            SizedBox(height: ValuesManager.spaceExtraSmall.h),
            Text(
              item.label,
              style:
                  ResponsiveStylesManager.getCaption(
                    color: isSelected
                        ? ColorsManager.communicationBlue
                        : isDark
                        ? ColorsManager.companionNeutral
                        : ColorsManager.focusState,
                  ).copyWith(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
