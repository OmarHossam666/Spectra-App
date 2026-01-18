import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import 'package:spectra/core/helpers/responsive_helper.dart';
import '../../cubit/login_cubit.dart';
import '../../widgets/parent_auth_section.dart';

/// Parent Authentication View
/// Displays biometric, Huawei ID, and PIN authentication options
class ParentAuthView extends StatelessWidget {
  const ParentAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final cubit = context.read<LoginCubit>();

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (prev, curr) => prev.isAuthenticated != curr.isAuthenticated,
      listener: (context, state) {
        if (state.isAuthenticated) {
          _onAuthenticationSuccess(context);
        }
      },
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.horizontalPadding,
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: ResponsiveHelper.contentMaxWidth,
            ),
            child: Column(
              children: [
                SizedBox(height: ValuesManager.spaceLarge.h),
                // Back button
                _ParentAuthHeader(isDark: isDark),
                SizedBox(height: ValuesManager.spaceExtraLarge.h),
                // Auth section
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return ParentAuthSection(
                      onHuaweiIdTap: cubit.authenticateWithHuaweiId,
                      onBiometricTap: cubit.authenticateWithBiometric,
                      onPinTap: () => _showPinDialog(context, cubit),
                      isLoading: state.isLoading,
                    );
                  },
                ),
                SizedBox(height: ValuesManager.spaceHuge.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showPinDialog(BuildContext context, LoginCubit cubit) {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
        title: const Text(StringsManager.loginEnterPin),
        content: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          maxLength: ValuesManager.pinMaxLength,
          obscureText: true,
          autofocus: true,
          decoration: InputDecoration(
            hintText: StringsManager.loginPinHint,
            border: OutlineInputBorder(
              borderRadius: ValuesManager.borderRadiusMedium,
            ),
          ),
          onSubmitted: (value) {
            Navigator.pop(dialogContext);
            cubit.validatePin(value);
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(StringsManager.cancel),
          ),
          FilledButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              cubit.validatePin(controller.text);
            },
            child: const Text(StringsManager.confirm),
          ),
        ],
      ),
    );
  }

  void _onAuthenticationSuccess(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.white,
              size: ValuesManager.iconSizeMedium.r,
            ),
            SizedBox(width: ValuesManager.spaceSmall.w),
            const Text(StringsManager.loginSuccessGuardian),
          ],
        ),
        backgroundColor: ColorsManager.routineGreen,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
      ),
    );
    // TODO: Navigate to parent dashboard
  }
}

/// Header with back button and title for parent auth view
class _ParentAuthHeader extends StatelessWidget {
  const _ParentAuthHeader({required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () =>
              context.read<LoginCubit>().goBackToProfileSelection(),
          icon: Icon(
            Icons.arrow_back_rounded,
            color: isDark ? Colors.white : ColorsManager.darkGreyText,
          ),
        ),
        const Spacer(),
        Text(
          StringsManager.loginParentTitle,
          style: ResponsiveStylesManager.getSubHeadline1(
            color: isDark ? Colors.white : ColorsManager.darkGreyText,
          ),
        ),
        const Spacer(),
        SizedBox(
          width: ValuesManager.headerBalanceWidth.w,
        ), // Balance for back button
      ],
    );
  }
}
