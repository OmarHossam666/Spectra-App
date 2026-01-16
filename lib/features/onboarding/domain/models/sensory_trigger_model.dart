import 'package:flutter/material.dart';

/// Represents a sensory trigger option in the sensory profile wizard
class SensoryTriggerModel {
  final String id;
  final String label;
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;

  const SensoryTriggerModel({
    required this.id,
    required this.label,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
  });
}
