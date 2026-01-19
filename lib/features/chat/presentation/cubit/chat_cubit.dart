import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';
import '../../domain/models/chat_message_model.dart';
import 'chat_state.dart';

export 'chat_state.dart';

/// Cubit for managing chat screen state
class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(const ChatState()) {
    _initialize();
  }

  /// Initialize chat with welcome message
  void _initialize() {
    final welcomeMessage = ChatMessage(
      id: _generateId(),
      content: StringsManager.chatWelcomeMessage,
      isFromUser: false,
      timestamp: DateTime.now(),
      emotion: ChatEmotion.happy,
      quickReplies: [
        StringsManager.chatQuickReplyHello,
        StringsManager.chatQuickReplyHowAreYou,
        StringsManager.chatQuickReplyHelp,
      ],
    );

    emit(
      state.copyWith(
        messages: [welcomeMessage],
        quickReplies: _getInitialQuickReplies(),
      ),
    );
  }

  /// Get initial quick replies
  List<QuickReply> _getInitialQuickReplies() {
    return const [
      QuickReply(
        id: 'hello',
        text: StringsManager.chatQuickReplyHello,
        iconData: Icons.waving_hand_rounded,
      ),
      QuickReply(
        id: 'how_are_you',
        text: StringsManager.chatQuickReplyHowAreYou,
        iconData: Icons.sentiment_satisfied_rounded,
      ),
      QuickReply(
        id: 'help',
        text: StringsManager.chatQuickReplyHelp,
        iconData: Icons.help_outline_rounded,
      ),
    ];
  }

  /// Update input text
  void updateInputText(String text) {
    emit(state.copyWith(inputText: text));
  }

  /// Send a message
  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    // Add user message
    final userMessage = ChatMessage(
      id: _generateId(),
      content: content.trim(),
      isFromUser: true,
      timestamp: DateTime.now(),
    );

    emit(
      state.copyWith(
        messages: [...state.messages, userMessage],
        inputText: '',
        isTyping: true,
        quickReplies: [],
      ),
    );

    // Simulate AI thinking delay
    await Future.delayed(
      Duration(milliseconds: ValuesManager.chatTypingDelayMs),
    );

    // Generate AI response
    final response = _generateResponse(content.trim().toLowerCase());

    emit(
      state.copyWith(
        messages: [...state.messages, response],
        isTyping: false,
        quickReplies: _getQuickRepliesForContext(content),
        companionMood: response.emotion ?? ChatEmotion.calm,
      ),
    );
  }

  /// Send quick reply
  Future<void> sendQuickReply(QuickReply reply) async {
    await sendMessage(reply.text);
  }

  /// Generate AI response based on user input
  ChatMessage _generateResponse(String userInput) {
    String responseContent;
    ChatEmotion emotion;
    List<String>? quickReplies;

    // Simple keyword-based responses for demo
    if (_containsAny(userInput, ['hello', 'hi', 'hey', 'hola'])) {
      responseContent = StringsManager.chatResponseHello;
      emotion = ChatEmotion.happy;
      quickReplies = [
        StringsManager.chatQuickReplyGood,
        StringsManager.chatQuickReplyNotGood,
      ];
    } else if (_containsAny(userInput, ['how are you', 'how r u', 'wassup'])) {
      responseContent = StringsManager.chatResponseHowAreYou;
      emotion = ChatEmotion.happy;
    } else if (_containsAny(userInput, ['sad', 'upset', 'not good', 'bad'])) {
      responseContent = StringsManager.chatResponseSad;
      emotion = ChatEmotion.supportive;
      quickReplies = [
        StringsManager.chatQuickReplyThanks,
        StringsManager.chatQuickReplyTellMore,
      ];
    } else if (_containsAny(userInput, ['happy', 'good', 'great', 'awesome'])) {
      responseContent = StringsManager.chatResponseHappy;
      emotion = ChatEmotion.happy;
    } else if (_containsAny(userInput, ['help', 'need help', 'assist'])) {
      responseContent = StringsManager.chatResponseHelp;
      emotion = ChatEmotion.supportive;
      quickReplies = [
        StringsManager.chatQuickReplyFeelings,
        StringsManager.chatQuickReplyLearn,
        StringsManager.chatQuickReplyPlay,
      ];
    } else if (_containsAny(userInput, ['scared', 'afraid', 'fear', 'worry'])) {
      responseContent = StringsManager.chatResponseScared;
      emotion = ChatEmotion.calm;
    } else if (_containsAny(userInput, ['angry', 'mad', 'frustrated'])) {
      responseContent = StringsManager.chatResponseAngry;
      emotion = ChatEmotion.calm;
    } else if (_containsAny(userInput, ['thank', 'thanks'])) {
      responseContent = StringsManager.chatResponseThanks;
      emotion = ChatEmotion.happy;
    } else if (_containsAny(userInput, ['bye', 'goodbye', 'see you'])) {
      responseContent = StringsManager.chatResponseBye;
      emotion = ChatEmotion.happy;
    } else if (_containsAny(userInput, ['play', 'game', 'fun'])) {
      responseContent = StringsManager.chatResponsePlay;
      emotion = ChatEmotion.encouraging;
    } else if (_containsAny(userInput, ['learn', 'study', 'teach'])) {
      responseContent = StringsManager.chatResponseLearn;
      emotion = ChatEmotion.curious;
    } else if (_containsAny(userInput, ['feeling', 'feel', 'emotion'])) {
      responseContent = StringsManager.chatResponseFeelings;
      emotion = ChatEmotion.supportive;
      quickReplies = [
        StringsManager.chatQuickReplyHappy,
        StringsManager.chatQuickReplySad,
        StringsManager.chatQuickReplyCalm,
      ];
    } else {
      responseContent = StringsManager.chatResponseDefault;
      emotion = ChatEmotion.curious;
    }

    return ChatMessage(
      id: _generateId(),
      content: responseContent,
      isFromUser: false,
      timestamp: DateTime.now(),
      emotion: emotion,
      quickReplies: quickReplies,
    );
  }

  /// Get quick replies based on conversation context
  List<QuickReply> _getQuickRepliesForContext(String lastMessage) {
    if (_containsAny(lastMessage.toLowerCase(), ['hello', 'hi', 'hey'])) {
      return const [
        QuickReply(
          id: 'good',
          text: StringsManager.chatQuickReplyGood,
          iconData: Icons.thumb_up_rounded,
        ),
        QuickReply(
          id: 'not_good',
          text: StringsManager.chatQuickReplyNotGood,
          iconData: Icons.thumb_down_rounded,
        ),
      ];
    }

    if (_containsAny(lastMessage.toLowerCase(), ['sad', 'upset', 'bad'])) {
      return const [
        QuickReply(
          id: 'thanks',
          text: StringsManager.chatQuickReplyThanks,
          iconData: Icons.favorite_rounded,
        ),
        QuickReply(
          id: 'tell_more',
          text: StringsManager.chatQuickReplyTellMore,
          iconData: Icons.chat_rounded,
        ),
      ];
    }

    return const [
      QuickReply(
        id: 'feelings',
        text: StringsManager.chatQuickReplyFeelings,
        iconData: Icons.sentiment_satisfied_rounded,
      ),
      QuickReply(
        id: 'play',
        text: StringsManager.chatQuickReplyPlay,
        iconData: Icons.sports_esports_rounded,
      ),
      QuickReply(
        id: 'learn',
        text: StringsManager.chatQuickReplyLearn,
        iconData: Icons.menu_book_rounded,
      ),
    ];
  }

  /// Check if text contains any of the keywords
  bool _containsAny(String text, List<String> keywords) {
    return keywords.any((keyword) => text.contains(keyword));
  }

  /// Generate unique message ID
  String _generateId() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }

  /// Clear chat history
  void clearChat() {
    _initialize();
  }
}
