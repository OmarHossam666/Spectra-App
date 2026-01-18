import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import '../../domain/models/login_state_model.dart';

/// Pattern login grid for child authentication
/// Displays a grid of icons that the child taps in sequence
class PatternLoginGrid extends StatelessWidget {
  const PatternLoginGrid({
    super.key,
    required this.patternIcons,
    required this.selectedIcons,
    required this.onIconTap,
    this.columns = 2,
    this.errorMessage,
  });

  final List<PatternIcon> patternIcons;
  final List<PatternIcon> selectedIcons;
  final ValueChanged<PatternIcon> onIconTap;
  final int columns;
  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Hint text with selected pattern indicator
        _buildPatternHint(context, isDark),
        SizedBox(height: ValuesManager.spaceLarge.h),
        // Icon grid
        Container(
          constraints: BoxConstraints(
            maxWidth: ValuesManager.patternGridMaxWidth.w,
          ),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: columns,
              crossAxisSpacing: ValuesManager.spaceDefault.r,
              mainAxisSpacing: ValuesManager.spaceDefault.r,
            ),
            itemCount: patternIcons.length,
            itemBuilder: (context, index) {
              final icon = patternIcons[index];
              final isSelected = selectedIcons.any((i) => i.id == icon.id);
              final selectionOrder = selectedIcons.indexWhere(
                (i) => i.id == icon.id,
              );

              return _PatternIconButton(
                icon: icon,
                isSelected: isSelected,
                selectionOrder: selectionOrder,
                onTap: () => onIconTap(icon),
                isDark: isDark,
              );
            },
          ),
        ),
        SizedBox(height: ValuesManager.spaceDefault.h),
        // Error message
        if (errorMessage != null)
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ValuesManager.spaceDefault.w,
              vertical: ValuesManager.spaceSmall.h,
            ),
            decoration: BoxDecoration(
              color: ColorsManager.companionAlert.withValues(alpha: 0.1),
              borderRadius: ValuesManager.borderRadiusMedium,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.refresh_rounded,
                  color: ColorsManager.companionAlert,
                  size: ValuesManager.iconSizeMedium.r,
                ),
                SizedBox(width: ValuesManager.spaceSmall.w),
                Text(
                  errorMessage!,
                  style: ResponsiveStylesManager.getBodyMedium(
                    color: ColorsManager.companionAlert,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildPatternHint(BuildContext context, bool isDark) {
    return Column(
      children: [
        // Selected icons indicator
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceDefault.w,
            vertical: ValuesManager.spaceSmall.h,
          ),
          decoration: BoxDecoration(
            color: isDark ? ColorsManager.darkGreySurface : ColorsManager.cream,
            borderRadius: ValuesManager.borderRadiusLarge,
            border: Border.all(
              color: isDark
                  ? ColorsManager.focusState.withValues(alpha: 0.3)
                  : ColorsManager.lightGrey,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                StringsManager.loginPatternTapHint,
                style: ResponsiveStylesManager.getSubHeadline2(
                  color: isDark ? Colors.white70 : ColorsManager.darkGreyText,
                ),
              ),
              SizedBox(width: ValuesManager.spaceSmall.w),
              // Show selected icons or placeholders
              ...List.generate(ValuesManager.patternSequenceLength.toInt(), (
                index,
              ) {
                if (index < selectedIcons.length) {
                  final icon = selectedIcons[index];
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ValuesManager.spaceExtraSmall.w,
                    ),
                    child: Icon(
                      _getIconData(icon.iconName),
                      color: Color(icon.colorValue),
                      size: ValuesManager.patternIconSelectedSize.r,
                    ),
                  );
                } else {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: ValuesManager.spaceExtraSmall.w,
                    ),
                    child: Container(
                      width: ValuesManager.patternIconSelectedSize.r,
                      height: ValuesManager.patternIconSelectedSize.r,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDark
                              ? Colors.white24
                              : ColorsManager.focusState.withValues(
                                  alpha: ValuesManager.opacityMedium,
                                ),
                          width: ValuesManager.patternPlaceholderBorderWidth.r,
                        ),
                      ),
                    ),
                  );
                }
              }),
            ],
          ),
        ),
        SizedBox(height: ValuesManager.spaceSmall.h),
        Text(
          StringsManager.loginPatternHint,
          style: ResponsiveStylesManager.getBodySmall(
            color: isDark
                ? ColorsManager.companionNeutral
                : ColorsManager.focusState,
          ),
        ),
      ],
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'nutrition':
        return Icons.apple_rounded;
      case 'star':
        return Icons.star_rounded;
      case 'directions_car':
        return Icons.directions_car_rounded;
      case 'pets':
        return Icons.pets_rounded;
      case 'favorite':
        return Icons.favorite_rounded;
      case 'dark_mode':
        return Icons.dark_mode_rounded;
      default:
        return Icons.circle;
    }
  }
}

class _PatternIconButton extends StatefulWidget {
  const _PatternIconButton({
    required this.icon,
    required this.isSelected,
    required this.selectionOrder,
    required this.onTap,
    required this.isDark,
  });

  final PatternIcon icon;
  final bool isSelected;
  final int selectionOrder;
  final VoidCallback onTap;
  final bool isDark;

  @override
  State<_PatternIconButton> createState() => _PatternIconButtonState();
}

class _PatternIconButtonState extends State<_PatternIconButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'nutrition':
        return Icons.apple_rounded;
      case 'star':
        return Icons.star_rounded;
      case 'directions_car':
        return Icons.directions_car_rounded;
      case 'pets':
        return Icons.pets_rounded;
      case 'favorite':
        return Icons.favorite_rounded;
      case 'dark_mode':
        return Icons.dark_mode_rounded;
      default:
        return Icons.circle;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _controller.forward(),
      onTapUp: (_) {
        _controller.reverse();
        widget.onTap();
      },
      onTapCancel: () => _controller.reverse(),
      child: AnimatedBuilder(
        animation: _scaleAnimation,
        builder: (context, child) {
          return Transform.scale(scale: _scaleAnimation.value, child: child);
        },
        child: AnimatedContainer(
          duration: ValuesManager.durationMedium,
          decoration: BoxDecoration(
            color: widget.isSelected
                ? Color(widget.icon.colorValue).withValues(alpha: 0.15)
                : widget.isDark
                ? ColorsManager.darkGreySurface
                : Colors.white,
            borderRadius: ValuesManager.borderRadiusExtraLarge,
            border: Border.all(
              color: widget.isSelected
                  ? Color(widget.icon.colorValue)
                  : widget.isDark
                  ? ColorsManager.focusState.withValues(
                      alpha: ValuesManager.opacityLight,
                    )
                  : ColorsManager.lightGrey,
              width: widget.isSelected
                  ? ValuesManager.borderWidthThick.r
                  : ValuesManager.borderWidthThin.r,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: ValuesManager.spaceSmall.r,
                offset: Offset(0, ValuesManager.spaceExtraSmall.h),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Main icon
              Icon(
                _getIconData(widget.icon.iconName),
                color: Color(widget.icon.colorValue),
                size: ValuesManager.patternIconSize.r,
              ),
              // Selection order badge
              if (widget.isSelected && widget.selectionOrder >= 0)
                Positioned(
                  top: ValuesManager.spaceSmall.r,
                  right: ValuesManager.spaceSmall.r,
                  child: Container(
                    width: ValuesManager.patternSelectedBadgeSize.r,
                    height: ValuesManager.patternSelectedBadgeSize.r,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(widget.icon.colorValue),
                    ),
                    child: Center(
                      child: Text(
                        '${widget.selectionOrder + 1}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: ValuesManager.fontSizeBodySmall.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
