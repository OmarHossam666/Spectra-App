import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../widgets/onboarding_button.dart';

/// Screen 1.4: Rafiq (Mascot) Introduction
/// Final onboarding screen with friendly mascot greeting
class MascotIntroScreen extends StatelessWidget {
  const MascotIntroScreen({
    super.key,
    required this.childName,
    required this.onComplete,
  });

  final String childName;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: ValuesManager.spaceDefault.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: ValuesManager.spaceHuge.h),
            // Mascot with glow effect
            _MascotAvatar(),
            SizedBox(height: ValuesManager.spaceLarge.h),

            // Greeting Text
            Text(
              StringsManager.getGreeting(childName),
              style: StylesManager.getHeadline2(
                color: isDark
                    ? ColorsManager.cream
                    : ColorsManager.darkGreyText,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              StringsManager.mascotIntroduction,
              style: StylesManager.getHeadline2(
                color: isDark
                    ? ColorsManager.cream
                    : ColorsManager.darkGreyText,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ValuesManager.spaceMedium.h),
            Text(
              StringsManager.mascotHelpText,
              style: StylesManager.getBodyLarge(
                color: ColorsManager.focusState,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: ValuesManager.spaceExtraLarge.h),

            // High Five Button
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ValuesManager.spaceLarge.w,
              ),
              child: OnboardingButton(
                label: StringsManager.highFiveButton,
                icon: Icons.pan_tool,
                onPressed: onComplete,
              ),
            ),
            SizedBox(height: ValuesManager.spaceHuge.h),
          ],
        ),
      ),
    );
  }
}

class _MascotAvatar extends StatefulWidget {
  @override
  State<_MascotAvatar> createState() => _MascotAvatarState();
}

class _MascotAvatarState extends State<_MascotAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _bounceAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    _bounceAnimation = Tween<double>(
      begin: 0,
      end: -12,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Glow Effect
        Container(
          width: 200.r,
          height: 200.r,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: ColorsManager.communicationBlue.withValues(alpha: 0.2),
                blurRadius: 60.r,
                spreadRadius: 20.r,
              ),
            ],
          ),
        ),
        // Mascot Image
        AnimatedBuilder(
          animation: _bounceAnimation,
          builder: (context, child) {
            return Transform.translate(
              offset: Offset(0, _bounceAnimation.value),
              child: child,
            );
          },
          child: Container(
            width: 180.r,
            height: 180.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(36.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.2),
                  blurRadius: 20.r,
                  offset: Offset(0, 10.h),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(36.r),
              child: Image.network(
                StringsManager.mascotUrlRafiq,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _MascotPlaceholder(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MascotPlaceholder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.r,
      height: 180.r,
      decoration: BoxDecoration(
        color: ColorsManager.communicationBlue,
        borderRadius: BorderRadius.circular(36.r),
      ),
      child: Icon(Icons.smart_toy, size: 80.r, color: Colors.white),
    );
  }
}
