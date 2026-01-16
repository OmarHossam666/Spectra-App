import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/sensory_trigger_model.dart';

/// Grid of sensory trigger options for the sensory profile wizard
class SensoryTriggerGrid extends StatelessWidget {
  const SensoryTriggerGrid({
    super.key,
    required this.triggers,
    required this.selectedTriggerIds,
    required this.onTriggerToggled,
  });

  final List<SensoryTriggerModel> triggers;
  final Set<String> selectedTriggerIds;
  final ValueChanged<String> onTriggerToggled;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: ValuesManager.spaceDefault.w,
        mainAxisSpacing: ValuesManager.spaceDefault.h,
        childAspectRatio: 1.0,
      ),
      itemCount: triggers.length,
      itemBuilder: (context, index) {
        final trigger = triggers[index];
        final isSelected = selectedTriggerIds.contains(trigger.id);
        return _SensoryTriggerCard(
          trigger: trigger,
          isSelected: isSelected,
          onTap: () => onTriggerToggled(trigger.id),
        );
      },
    );
  }
}

class _SensoryTriggerCard extends StatelessWidget {
  const _SensoryTriggerCard({
    required this.trigger,
    required this.isSelected,
    required this.onTap,
  });

  final SensoryTriggerModel trigger;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? ColorsManager.darkGreySurface
        : Colors.white;
    final borderColor = isDark
        ? ColorsManager.darkGreySurface
        : ColorsManager.lightGrey;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(ValuesManager.radiusLarge.r),
        child: AnimatedContainer(
          duration: ValuesManager.durationMedium,
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isSelected
                ? ColorsManager.communicationBlue.withValues(alpha: 0.05)
                : backgroundColor,
            borderRadius: BorderRadius.circular(ValuesManager.radiusLarge.r),
            border: Border.all(
              color: isSelected ? ColorsManager.communicationBlue : borderColor,
              width: isSelected
                  ? ValuesManager.borderWidthDefault.r
                  : ValuesManager.borderWidthThin.r,
            ),
            boxShadow: [
              BoxShadow(
                color: isSelected
                    ? ColorsManager.communicationBlue.withValues(alpha: 0.2)
                    : Colors.black.withValues(alpha: 0.05),
                blurRadius: isSelected ? 8.r : 4.r,
                offset: Offset(0, 2.h),
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(ValuesManager.spaceDefault.r),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon Container
                AnimatedContainer(
                  duration: ValuesManager.durationMedium,
                  width: 64.r,
                  height: 64.r,
                  decoration: BoxDecoration(
                    color: trigger.backgroundColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    trigger.icon,
                    size: ValuesManager.iconSizeLarge.r,
                    color: trigger.iconColor,
                  ),
                ),
                SizedBox(height: ValuesManager.spaceMedium.h),
                // Label
                Text(
                  trigger.label,
                  style: StylesManager.getButtonSecondary(
                    color: isDark
                        ? ColorsManager.cream
                        : ColorsManager.darkGreyText,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
