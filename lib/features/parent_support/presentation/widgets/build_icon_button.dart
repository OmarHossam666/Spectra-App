import 'package:flutter/material.dart';
import 'package:spectra/core/constants/values_manager.dart';


  Widget buildIconBtn(IconData icon) {
    return Container(
      width: ValuesManager.iconSizeLarge,
      height: ValuesManager.iconSizeLarge,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: ValuesManager.iconSizeSmall,
      ),
    );
  }

