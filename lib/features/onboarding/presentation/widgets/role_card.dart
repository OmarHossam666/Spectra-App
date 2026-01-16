import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/user_role.dart';

/// Role selection card for choosing between Child and Parent profiles
class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.role,
    required this.onTap,
    this.isSelected = false,
  });

  final UserRole role;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final isChild = role == UserRole.child;
    final backgroundColor = isChild
        ? ColorsManager.communicationBlue
        : ColorsManager.routineGreen;

    return Align(
      alignment: isChild ? Alignment.centerLeft : Alignment.centerRight,
      child: FractionallySizedBox(
        widthFactor: 0.95,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(ValuesManager.radiusLarge.r),
            child: AnimatedContainer(
              duration: ValuesManager.durationMedium,
              curve: Curves.easeInOut,
              height: 180.h,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(
                  ValuesManager.radiusLarge.r,
                ),
                boxShadow: [
                  BoxShadow(
                    color: backgroundColor.withValues(alpha: 0.3),
                    blurRadius: isSelected ? 16.r : 4.r,
                    offset: Offset(0, 4.h),
                  ),
                ],
                border: isSelected
                    ? Border.all(
                        color: ColorsManager.darkGreyText,
                        width: ValuesManager.borderWidthThick.r,
                      )
                    : null,
              ),
              child: Stack(
                children: [
                  // Background Icon
                  Positioned(
                    right: -ValuesManager.spaceDefault.w,
                    top: -ValuesManager.spaceDefault.h,
                    child: Icon(
                      isChild
                          ? Icons.sentiment_satisfied
                          : Icons.supervisor_account,
                      size: 140.r,
                      color: Colors.white.withValues(alpha: 0.2),
                    ),
                  ),
                  // Gradient Overlay
                  Positioned.fill(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          ValuesManager.radiusLarge.r,
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withValues(alpha: 0.1),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Content
                  Padding(
                    padding: EdgeInsets.all(ValuesManager.spaceLarge.r),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Icon Badge
                        Container(
                          padding: EdgeInsets.all(ValuesManager.spaceSmall.r),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(
                              ValuesManager.radiusCircular.r,
                            ),
                          ),
                          child: Icon(
                            isChild ? Icons.child_care : Icons.face_3,
                            size: ValuesManager.iconSizeExtraLarge.r,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: ValuesManager.spaceSmall.h),
                        // Title
                        Text(
                          isChild
                              ? StringsManager.roleChildTitle
                              : StringsManager.roleParentTitle,
                          style: StylesManager.getHeadline3(
                            color: ColorsManager.darkGreyText,
                          ),
                        ),
                        // Subtitle
                        Text(
                          isChild
                              ? StringsManager.roleChildSubtitle
                              : StringsManager.roleParentSubtitle,
                          style: StylesManager.getBodyMedium(
                            color: ColorsManager.darkGreyText.withValues(
                              alpha: 0.7,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
