import 'package:flutter/material.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

class LearningPathWidget extends StatelessWidget {
  const LearningPathWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: ValuesManager.spaceLarge),

        // Learning Path Header
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ValuesManager.spaceLarge,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringsManager.myLearningPath,
                style: StylesManager.getSubHeadline1(),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  StringsManager.seeAll,
                  style: StylesManager.getBodyLarge().copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: ValuesManager.spaceMedium),
      ],
    );
  }
}
