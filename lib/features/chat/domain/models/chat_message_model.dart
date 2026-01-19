import 'package:flutter/material.dart';

/// Represents a single chat message
class ChatMessage {
  const ChatMessage({
    required this.id,
    required this.content,
    required this.isFromUser,
    required this.timestamp,
    this.isTyping = false,
    this.emotion,
    this.quickReplies,
  });

  final String id;
  final String content;
  final bool isFromUser;
  final DateTime timestamp;
  final bool isTyping;
  final ChatEmotion? emotion;
  final List<String>? quickReplies;

  ChatMessage copyWith({
    String? id,
    String? content,
    bool? isFromUser,
    DateTime? timestamp,
    bool? isTyping,
    ChatEmotion? emotion,
    List<String>? quickReplies,
  }) {
    return ChatMessage(
      id: id ?? this.id,
      content: content ?? this.content,
      isFromUser: isFromUser ?? this.isFromUser,
      timestamp: timestamp ?? this.timestamp,
      isTyping: isTyping ?? this.isTyping,
      emotion: emotion ?? this.emotion,
      quickReplies: quickReplies ?? this.quickReplies,
    );
  }
}

/// Emotions that Rafiq can express
enum ChatEmotion { happy, calm, curious, encouraging, supportive }

/// Extension to get icon for emotion
extension ChatEmotionExtension on ChatEmotion {
  IconData get icon {
    switch (this) {
      case ChatEmotion.happy:
        return Icons.sentiment_very_satisfied_rounded;
      case ChatEmotion.calm:
        return Icons.self_improvement_rounded;
      case ChatEmotion.curious:
        return Icons.psychology_rounded;
      case ChatEmotion.encouraging:
        return Icons.thumb_up_rounded;
      case ChatEmotion.supportive:
        return Icons.favorite_rounded;
    }
  }
}

/// Quick reply suggestion
class QuickReply {
  const QuickReply({required this.id, required this.text, this.iconData});

  final String id;
  final String text;
  final IconData? iconData;
}
