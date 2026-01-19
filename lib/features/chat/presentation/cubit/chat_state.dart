import 'package:equatable/equatable.dart';
import '../../domain/models/chat_message_model.dart';

/// Chat screen state
class ChatState extends Equatable {
  const ChatState({
    this.messages = const [],
    this.isTyping = false,
    this.isLoading = false,
    this.inputText = '',
    this.quickReplies = const [],
    this.companionMood = ChatEmotion.calm,
  });

  /// List of chat messages
  final List<ChatMessage> messages;

  /// Whether Rafiq is typing
  final bool isTyping;

  /// Loading state
  final bool isLoading;

  /// Current input text
  final String inputText;

  /// Current quick reply suggestions
  final List<QuickReply> quickReplies;

  /// Rafiq's current mood
  final ChatEmotion companionMood;

  @override
  List<Object?> get props => [
    messages,
    isTyping,
    isLoading,
    inputText,
    quickReplies,
    companionMood,
  ];

  ChatState copyWith({
    List<ChatMessage>? messages,
    bool? isTyping,
    bool? isLoading,
    String? inputText,
    List<QuickReply>? quickReplies,
    ChatEmotion? companionMood,
  }) {
    return ChatState(
      messages: messages ?? this.messages,
      isTyping: isTyping ?? this.isTyping,
      isLoading: isLoading ?? this.isLoading,
      inputText: inputText ?? this.inputText,
      quickReplies: quickReplies ?? this.quickReplies,
      companionMood: companionMood ?? this.companionMood,
    );
  }
}
