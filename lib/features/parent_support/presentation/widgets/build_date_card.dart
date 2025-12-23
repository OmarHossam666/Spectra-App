
  import 'package:flutter/material.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

Widget buildDateCard(String day, String date, bool isSelected) {
    return Container(
      width: 60,
      height: 72,
      margin: const EdgeInsets.only(right: ValuesManager.spaceSmall),
      decoration: BoxDecoration(
        borderRadius: ValuesManager.borderRadiusLarge,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            isSelected ? StringsManager.today : day,
            style: StylesManager.getCaption(
            ).copyWith(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            ),
          ),
          Text(
            date,
            style: StylesManager.getSubHeadline2(
            ).copyWith(fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }
  
