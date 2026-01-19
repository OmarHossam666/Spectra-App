import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import 'package:spectra/core/helpers/responsive_helper.dart';
import '../../domain/models/chat_message_model.dart';

/// Header widget for the chat screen showing companion info and mood
class ChatHeader extends StatelessWidget {
  const ChatHeader({super.key, required this.companionMood, this.onClearChat});

  final ChatEmotion companionMood;
  final VoidCallback? onClearChat;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(
        top: ValuesManager.spaceSmall.h,
        bottom: ValuesManager.spaceSmall.h,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: isDark
              ? [
                  ColorsManager.darkGreySurface.withValues(alpha: 0.3),
                  Colors.transparent,
                ]
              : [
                  ColorsManager.chatHeaderGradientStart,
                  ColorsManager.chatHeaderGradientEnd,
                ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.chatScreenPaddingH.w,
          ),
          child: Row(
            children: [
              // Back button
              IconButton(
                onPressed: () => context.pop(),
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: isDark
                      ? ColorsManager.companionNeutral
                      : ColorsManager.darkGreyText,
                  size: ValuesManager.iconSizeMedium.r,
                ),
              ),
              HorizontalSpace(ValuesManager.spaceSmall),

              // Companion avatar with mood indicator
              _CompanionAvatar(mood: companionMood, isDark: isDark),
              HorizontalSpace(ValuesManager.spaceDefault),

              // Companion info
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringsManager.chatTitle,
                      style: ResponsiveStylesManager.getSubHeadline2(
                        color: isDark
                            ? Colors.white
                            : ColorsManager.darkGreyText,
                      ),
                    ),
                    VerticalSpace(ValuesManager.spaceExtraSmall),
                    Row(
                      children: [
                        Container(
                          width: ValuesManager.spaceSmall.r,
                          height: ValuesManager.spaceSmall.r,
                          decoration: BoxDecoration(
                            color: _getMoodColor(companionMood),
                            shape: BoxShape.circle,
                          ),
                        ),
                        HorizontalSpace(ValuesManager.spaceExtraSmall),
                        Text(
                          _getMoodText(companionMood),
                          style: ResponsiveStylesManager.getCaption(
                            color: isDark
                                ? ColorsManager.chatTimestampDark
                                : ColorsManager.chatTimestampLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Clear chat button
              if (onClearChat != null)
                IconButton(
                  onPressed: onClearChat,
                  tooltip: StringsManager.chatClear,
                  icon: Icon(
                    Icons.refresh_rounded,
                    color: isDark
                        ? ColorsManager.companionNeutral
                        : ColorsManager.focusState,
                    size: ValuesManager.iconSizeMedium.r,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getMoodColor(ChatEmotion mood) {
    switch (mood) {
      case ChatEmotion.happy:
        return ColorsManager.companionHappy;
      case ChatEmotion.calm:
        return ColorsManager.companionCalm;
      case ChatEmotion.curious:
        return ColorsManager.communicationBlue;
      case ChatEmotion.encouraging:
        return ColorsManager.routineGreen;
      case ChatEmotion.supportive:
        return ColorsManager.softRose;
    }
  }

  String _getMoodText(ChatEmotion mood) {
    switch (mood) {
      case ChatEmotion.happy:
        return 'Feeling happy';
      case ChatEmotion.calm:
        return 'Feeling calm';
      case ChatEmotion.curious:
        return 'Curious';
      case ChatEmotion.encouraging:
        return 'Encouraging';
      case ChatEmotion.supportive:
        return 'Supportive';
    }
  }
}

/// Animated companion avatar with mood-based styling
class _CompanionAvatar extends StatelessWidget {
  const _CompanionAvatar({required this.mood, required this.isDark});

  final ChatEmotion mood;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ValuesManager.chatAvatarSize.r,
      height: ValuesManager.chatAvatarSize.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: ColorsManager.chatAvatarBorder,
          width: ValuesManager.borderWidthDefault.r,
        ),
        gradient: LinearGradient(
          colors: [ColorsManager.lavender, ColorsManager.communicationBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.communicationBlue.withValues(alpha: 0.3),
            blurRadius: ValuesManager.spaceMedium.r,
            offset: Offset(0, ValuesManager.spaceExtraSmall.h),
          ),
        ],
      ),
      child: Center(
        child: Icon(
          Icons.smart_toy_rounded,
          size: ValuesManager.iconSizeLarge.r,
        ),
      ),
    );
  }
}
