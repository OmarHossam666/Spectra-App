import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/user_role.dart';
import '../widgets/role_card.dart';

/// Screen 1.1: Role Selection
/// User chooses between Child and Parent profiles
class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key, required this.onRoleSelected});

  final ValueChanged<UserRole> onRoleSelected;

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
          Text(
            StringsManager.roleSelectionTitle,
            style: StylesManager.getHeadline1(
              color: isDark ? ColorsManager.cream : ColorsManager.darkGreyText,
            ),
          ),
          SizedBox(height: ValuesManager.spaceSmall.h),
          Text(
            StringsManager.roleSelectionSubtitle,
            style: StylesManager.getBodyLarge(color: ColorsManager.focusState),
          ),
          SizedBox(height: ValuesManager.spaceLarge.h),

          // Role Cards
          RoleCard(
            role: UserRole.child,
            onTap: () => onRoleSelected(UserRole.child),
          ),
          SizedBox(height: ValuesManager.spaceDefault.h),
          RoleCard(
            role: UserRole.parent,
            onTap: () => onRoleSelected(UserRole.parent),
          ),
          SizedBox(height: ValuesManager.spaceHuge.h),
        ],
      ),
    );
  }
}
