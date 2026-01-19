import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/responsive_styles_manager.dart';
import 'package:spectra/core/helpers/responsive_helper.dart';

/// Chat input field with send button
class ChatInputField extends StatefulWidget {
  const ChatInputField({
    super.key,
    required this.onSend,
    required this.onTextChanged,
    this.inputText = '',
    this.isEnabled = true,
  });

  final Function(String) onSend;
  final Function(String) onTextChanged;
  final String inputText;
  final bool isEnabled;

  @override
  State<ChatInputField> createState() => _ChatInputFieldState();
}

class _ChatInputFieldState extends State<ChatInputField> {
  late TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.inputText);
  }

  @override
  void didUpdateWidget(ChatInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.inputText != _controller.text) {
      _controller.text = widget.inputText;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final hasText = _controller.text.trim().isNotEmpty;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ValuesManager.chatScreenPaddingH.w,
        vertical: ValuesManager.spaceDefault.h,
      ),
      decoration: BoxDecoration(
        color: isDark ? ColorsManager.softBlack : ColorsManager.cream,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: ValuesManager.spaceMedium.r,
            offset: Offset(0, -ValuesManager.spaceExtraSmall.h),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            // Input field
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      enabled: widget.isEnabled,
                      onChanged: (value) {
                        widget.onTextChanged(value);
                        setState(() {});
                      },
                      onSubmitted: (_) => _handleSend(),
                      textInputAction: TextInputAction.send,
                      style: ResponsiveStylesManager.getBodyMedium(
                        color: isDark
                            ? ColorsManager.chatBotTextDark
                            : ColorsManager.chatBotTextLight,
                      ),
                      decoration: InputDecoration(
                        hintText: StringsManager.chatInputHint,
                        hintStyle: ResponsiveStylesManager.getBodyMedium(
                          color: isDark
                              ? ColorsManager.chatTimestampDark
                              : ColorsManager.chatTimestampLight,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: ValuesManager.spaceDefault.w,
                          vertical: ValuesManager.spaceMedium.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            HorizontalSpace(ValuesManager.spaceDefault),

            // Send button
            AnimatedContainer(
              duration: ValuesManager.durationFast,
              width: ValuesManager.chatSendButtonSize.r,
              height: ValuesManager.chatSendButtonSize.r,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: hasText && widget.isEnabled
                    ? ColorsManager.chatSendButton
                    : ColorsManager.chatSendButtonDisabled,
                boxShadow: hasText && widget.isEnabled
                    ? [
                        BoxShadow(
                          color: ColorsManager.communicationBlue.withValues(
                            alpha: 0.3,
                          ),
                          blurRadius: ValuesManager.spaceMedium.r,
                          offset: Offset(0, ValuesManager.spaceExtraSmall.h),
                        ),
                      ]
                    : null,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: hasText && widget.isEnabled ? _handleSend : null,
                  borderRadius: BorderRadius.circular(
                    ValuesManager.chatSendButtonSize.r / 2,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.send_rounded,
                      color: Colors.white,
                      size: ValuesManager.iconSizeMedium.r,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
