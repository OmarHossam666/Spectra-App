import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';

/// Typing indicator widget showing animated dots
class TypingIndicator extends StatelessWidget {
  const TypingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ValuesManager.chatScreenPaddingH.w,
        vertical: ValuesManager.chatMessageSpacing.h,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Bot avatar
          Container(
            width: ValuesManager.chatAvatarSmall.r,
            height: ValuesManager.chatAvatarSmall.r,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  ColorsManager.lavender,
                  ColorsManager.communicationBlue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Icon(
                Icons.smart_toy_rounded,
                size: ValuesManager.iconSizeMedium.r,
              ),
            ),
          ),
          SizedBox(width: ValuesManager.spaceSmall.w),

          // Typing bubble
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: ValuesManager.chatBubblePaddingH.w,
              vertical: ValuesManager.chatBubblePaddingV.h,
            ),
            decoration: BoxDecoration(
              color: isDark
                  ? ColorsManager.chatBotBubbleDark
                  : ColorsManager.chatBotBubbleLight,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(ValuesManager.chatBubbleRadius.r),
                topRight: Radius.circular(ValuesManager.chatBubbleRadius.r),
                bottomLeft: Radius.circular(
                  ValuesManager.chatBubbleTailRadius.r,
                ),
                bottomRight: Radius.circular(ValuesManager.chatBubbleRadius.r),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const _AnimatedTypingDots(),
                SizedBox(width: ValuesManager.spaceSmall.w),
                Text(
                  StringsManager.chatTyping,
                  style: ResponsiveStylesManager.getCaption(
                    color: isDark
                        ? ColorsManager.chatTimestampDark
                        : ColorsManager.chatTimestampLight,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Animated typing dots with staggered animation
class _AnimatedTypingDots extends StatefulWidget {
  const _AnimatedTypingDots();

  @override
  State<_AnimatedTypingDots> createState() => _AnimatedTypingDotsState();
}

class _AnimatedTypingDotsState extends State<_AnimatedTypingDots>
    with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(
      3,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ),
    );

    _animations = _controllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(parent: controller, curve: Curves.easeInOut));
    }).toList();

    _startAnimation();
  }

  void _startAnimation() async {
    for (var i = 0; i < _controllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      if (mounted) {
        _controllers[i].repeat(reverse: true);
      }
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) => AnimatedBuilder(
          animation: _animations[index],
          builder: (context, child) {
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: ValuesManager.chatTypingDotSpacing.w / 2,
              ),
              width: ValuesManager.chatTypingDotSize.r,
              height: ValuesManager.chatTypingDotSize.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorsManager.chatTypingDot.withValues(
                  alpha: 0.3 + (_animations[index].value * 0.7),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
