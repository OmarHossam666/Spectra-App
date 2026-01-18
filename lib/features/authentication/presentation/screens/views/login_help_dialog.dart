import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';

/// Shows the help dialog for login assistance
void showLoginHelpDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: ValuesManager.borderRadiusLarge,
      ),
      title: Row(
        children: [
          Icon(
            Icons.help_outline_rounded,
            color: ColorsManager.communicationBlue,
            size: ValuesManager.iconSizeLarge.r,
          ),
          SizedBox(width: ValuesManager.spaceSmall.w),
          const Text(StringsManager.loginHelpTitle),
        ],
      ),
      content: Text(
        StringsManager.loginHelpContent,
        style: ResponsiveStylesManager.getBodyLarge(),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(StringsManager.loginHelpConfirm),
        ),
      ],
    ),
  );
}
