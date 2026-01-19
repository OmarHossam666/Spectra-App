import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import '../../domain/models/chat_message_model.dart';

/// Horizontal scrolling quick reply chips
class QuickReplyBar extends StatelessWidget {
  const QuickReplyBar({
    super.key,
    required this.quickReplies,
    required this.onReplyTap,
    this.isEnabled = true,
  });

  final List<QuickReply> quickReplies;
  final Function(QuickReply) onReplyTap;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    if (quickReplies.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      height:
          ValuesManager.chatQuickReplyHeight.h +
          ValuesManager.spaceDefault.h * 2,
      padding: EdgeInsets.symmetric(vertical: ValuesManager.spaceDefault.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(
          horizontal: ValuesManager.chatScreenPaddingH.w,
        ),
        itemCount: quickReplies.length,
        separatorBuilder: (_, __) =>
            SizedBox(width: ValuesManager.chatQuickReplySpacing.w),
        itemBuilder: (context, index) {
          return _QuickReplyChip(
            reply: quickReplies[index],
            onTap: isEnabled ? () => onReplyTap(quickReplies[index]) : null,
          );
        },
      ),
    );
  }
}

/// Individual quick reply chip
class _QuickReplyChip extends StatelessWidget {
  const _QuickReplyChip({required this.reply, this.onTap});

  final QuickReply reply;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(
          ValuesManager.chatQuickReplyRadius.r,
        ),
        child: AnimatedContainer(
          duration: ValuesManager.durationFast,
          height: ValuesManager.chatQuickReplyHeight.h,
          padding: EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceDefault.w,
          ),
          decoration: BoxDecoration(
            color: isDark
                ? ColorsManager.chatQuickReplyBgDark
                : ColorsManager.chatQuickReplyBgLight,
            borderRadius: BorderRadius.circular(
              ValuesManager.chatQuickReplyRadius.r,
            ),
            border: Border.all(
              color: isDark
                  ? ColorsManager.chatQuickReplyTextDark.withValues(alpha: 0.3)
                  : ColorsManager.chatQuickReplyTextLight.withValues(
                      alpha: 0.3,
                    ),
              width: ValuesManager.borderWidthThin.r,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (reply.iconData != null) ...[
                Icon(
                  reply.iconData,
                  size: ValuesManager.iconSizeSmall.r,
                  color: isDark
                      ? ColorsManager.chatQuickReplyTextDark
                      : ColorsManager.chatQuickReplyTextLight,
                ),
                SizedBox(width: ValuesManager.spaceSmall.w),
              ],
              Text(
                reply.text,
                style: ResponsiveStylesManager.getBodySmall(
                  color: isDark
                      ? ColorsManager.chatQuickReplyTextDark
                      : ColorsManager.chatQuickReplyTextLight,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
