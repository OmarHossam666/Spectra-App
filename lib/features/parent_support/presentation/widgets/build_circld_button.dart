import 'package:flutter/material.dart';
import 'package:spectra/core/constants/colors_manager.dart';

Widget buildCircleButton(IconData icon) {
  return Container(
    width: 48,
    height: 48,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.transparent,
    ),
    child: Icon(icon, color: ColorsManager.softBlack),
  );
}
