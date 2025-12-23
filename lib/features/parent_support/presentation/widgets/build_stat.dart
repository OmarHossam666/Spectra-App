
import 'package:flutter/material.dart';
import 'package:spectra/core/constants/styles_manager.dart';

Widget buildStat(
    String label,
    String value,
    String suffix, {
    bool isHighlight = false,
  }) {
    return Column(
      children: [
        Text(
          label,
          style: StylesManager.getCaption(
          ).copyWith(fontWeight: FontWeight.w500),
        ),
        RichText(
          text: TextSpan(
            text: value,
            style: StylesManager.getBodyMedium(
            ).copyWith(
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
            children: [
              TextSpan(
                text: suffix,
                style: StylesManager.getCaption().copyWith(fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ],
    );
  }