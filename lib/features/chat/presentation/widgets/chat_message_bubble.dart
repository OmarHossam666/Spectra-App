import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import '../../domain/models/chat_message_model.dart';

/// A chat message bubble widget supporting both user and bot messages
class ChatMessageBubble extends StatelessWidget {
  const ChatMessageBubble({
    super.key,
    required this.message,
    this.showTimestamp = false,
  });

  final ChatMessage message;
  final bool showTimestamp;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final screenWidth = MediaQuery.of(context).size.width;
    final maxWidth = screenWidth * ValuesManager.chatBubbleMaxWidthPercent;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: ValuesManager.chatMessageSpacing.h / 2,
      ),
      child: Column(
        crossAxisAlignment: message.isFromUser
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start,
        children: [
          // Bot avatar for bot messages
          if (!message.isFromUser) ...[
            Padding(
              padding: EdgeInsets.only(
                left: ValuesManager.spaceExtraSmall.w,
                bottom: ValuesManager.spaceExtraSmall.h,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildBotAvatar(message.emotion),
                  SizedBox(width: ValuesManager.spaceSmall.w),
                  Text(
                    StringsManager.mascotName,
                    style: ResponsiveStylesManager.getCaption(
                      color: isDark
                          ? ColorsManager.chatTimestampDark
                          : ColorsManager.chatTimestampLight,
                    ),
                  ),
                  if (message.emotion != null) ...[
                    SizedBox(width: ValuesManager.spaceExtraSmall.w),
                    Icon(
                      message.emotion!.icon,
                      size: ValuesManager.iconSizeSmall.r,
                      color: _getEmotionColor(message.emotion!),
                    ),
                  ],
                ],
              ),
            ),
          ],

          // Message bubble
          Align(
            alignment: message.isFromUser
                ? Alignment.centerRight
                : Alignment.centerLeft,
            child: Container(
              constraints: BoxConstraints(maxWidth: maxWidth),
              padding: EdgeInsets.symmetric(
                horizontal: ValuesManager.chatBubblePaddingH.w,
                vertical: ValuesManager.chatBubblePaddingV.h,
              ),
              decoration: BoxDecoration(
                color: message.isFromUser
                    ? ColorsManager.chatUserBubble
                    : (isDark
                          ? ColorsManager.chatBotBubbleDark
                          : ColorsManager.chatBotBubbleLight),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(ValuesManager.chatBubbleRadius.r),
                  topRight: Radius.circular(ValuesManager.chatBubbleRadius.r),
                  bottomLeft: message.isFromUser
                      ? Radius.circular(ValuesManager.chatBubbleRadius.r)
                      : Radius.circular(ValuesManager.chatBubbleTailRadius.r),
                  bottomRight: message.isFromUser
                      ? Radius.circular(ValuesManager.chatBubbleTailRadius.r)
                      : Radius.circular(ValuesManager.chatBubbleRadius.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: ValuesManager.spaceSmall.r,
                    offset: Offset(0, ValuesManager.spaceExtraSmall.h / 2),
                  ),
                ],
              ),
              child: message.isTyping
                  ? _buildTypingIndicator(isDark)
                  : Text(
                      message.content,
                      style: ResponsiveStylesManager.getBodyMedium(
                        color: message.isFromUser
                            ? ColorsManager.chatUserText
                            : (isDark
                                  ? ColorsManager.chatBotTextDark
                                  : ColorsManager.chatBotTextLight),
                      ),
                    ),
            ),
          ),

          // Timestamp
          if (showTimestamp)
            Padding(
              padding: EdgeInsets.only(
                top: ValuesManager.spaceExtraSmall.h,
                left: message.isFromUser ? 0 : ValuesManager.spaceSmall.w,
                right: message.isFromUser ? ValuesManager.spaceSmall.w : 0,
              ),
              child: Text(
                _formatTimestamp(message.timestamp),
                style: ResponsiveStylesManager.getCaption(
                  color: isDark
                      ? ColorsManager.chatTimestampDark
                      : ColorsManager.chatTimestampLight,
                ).copyWith(fontSize: 10.sp),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBotAvatar(ChatEmotion? emotion) {
    return Container(
      width: ValuesManager.chatAvatarSize.r,
      height: ValuesManager.chatAvatarSize.r,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [ColorsManager.lavender, ColorsManager.communicationBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(
          Icons.smart_toy_rounded,
          size: ValuesManager.iconSizeLarge.r,
        ),
      ),
    );
  }

  Widget _buildTypingIndicator(bool isDark) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        3,
        (index) => _TypingDot(
          delay: Duration(milliseconds: index * 200),
          isDark: isDark,
        ),
      ),
    );
  }

  Color _getEmotionColor(ChatEmotion emotion) {
    switch (emotion) {
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

  String _formatTimestamp(DateTime timestamp) {
    final hour = timestamp.hour;
    final minute = timestamp.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}

/// Animated typing indicator dot
class _TypingDot extends StatefulWidget {
  const _TypingDot({required this.delay, required this.isDark});

  final Duration delay;
  final bool isDark;

  @override
  State<_TypingDot> createState() => _TypingDotState();
}

class _TypingDotState extends State<_TypingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
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
              alpha: 0.4 + (_animation.value * 0.6),
            ),
          ),
        );
      },
    );
  }
}
