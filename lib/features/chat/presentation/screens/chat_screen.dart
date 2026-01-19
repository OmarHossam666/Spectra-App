import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import '../cubit/chat_cubit.dart';
import '../widgets/chat_header.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/chat_input_field.dart';
import '../widgets/quick_reply_bar.dart';
import '../widgets/typing_indicator.dart';

/// Main AI Chat Bot screen
/// Provides a friendly chat interface with Rafiq, the Spectra companion
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(
            milliseconds: ValuesManager.chatAnimationDurationMs,
          ),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BlocProvider(
      create: (_) => ChatCubit(),
      child: Scaffold(
        backgroundColor: isDark ? ColorsManager.softBlack : ColorsManager.cream,
        body: BlocConsumer<ChatCubit, ChatState>(
          listener: (context, state) {
            // Scroll to bottom when new message is added
            _scrollToBottom();
          },
          builder: (context, state) {
            final cubit = context.read<ChatCubit>();

            return Column(
              children: [
                // Header
                ChatHeader(
                  companionMood: state.companionMood,
                  onClearChat: () {
                    _showClearChatDialog(context, cubit);
                  },
                ),

                // Messages list
                Expanded(child: _buildMessagesList(state, isDark)),

                // Quick replies
                if (!state.isTyping && state.quickReplies.isNotEmpty)
                  QuickReplyBar(
                    quickReplies: state.quickReplies,
                    onReplyTap: (reply) => cubit.sendQuickReply(reply),
                    isEnabled: !state.isTyping,
                  ),

                // Input field
                ChatInputField(
                  inputText: state.inputText,
                  onTextChanged: cubit.updateInputText,
                  onSend: cubit.sendMessage,
                  isEnabled: !state.isTyping,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildMessagesList(ChatState state, bool isDark) {
    return ListView.builder(
      controller: _scrollController,
      padding: EdgeInsets.symmetric(
        horizontal: ValuesManager.chatScreenPaddingH.w,
        vertical: ValuesManager.chatListBottomPadding.h,
      ),
      itemCount: state.messages.length + (state.isTyping ? 1 : 0),
      itemBuilder: (context, index) {
        // Show typing indicator at the end if typing
        if (state.isTyping && index == state.messages.length) {
          return const TypingIndicator();
        }

        final message = state.messages[index];
        final showTimestamp = _shouldShowTimestamp(state.messages, index);

        return ChatMessageBubble(
          message: message,
          showTimestamp: showTimestamp,
        );
      },
    );
  }

  bool _shouldShowTimestamp(List<dynamic> messages, int index) {
    // Show timestamp for last message in a group
    if (index == messages.length - 1) return true;

    final currentMessage = messages[index];
    final nextMessage = messages[index + 1];

    // Show timestamp if sender changes
    if (currentMessage.isFromUser != nextMessage.isFromUser) return true;

    // Show timestamp if more than 5 minutes apart
    final timeDiff = nextMessage.timestamp.difference(currentMessage.timestamp);
    return timeDiff.inMinutes > 5;
  }

  void _showClearChatDialog(BuildContext context, ChatCubit cubit) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          StringsManager.chatClear,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text('Are you sure you want to clear the chat history?'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: ColorsManager.chatSendButton),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              cubit.clearChat();
              context.pop();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(StringsManager.chatCleared),
                  behavior: SnackBarBehavior.floating,
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorsManager.chatSendButton,
              foregroundColor: Colors.white,
            ),
            child: const Text('Clear'),
          ),
        ],
      ),
    );
  }
}
