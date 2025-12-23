import 'package:flutter/material.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

class Module1 extends StatelessWidget {
  const Module1({super.key});

  @override
  Widget build(BuildContext context) {
    return // Module 1 (Active)
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ValuesManager.spaceDefault,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        StringsManager.module1,
                        style: StylesManager.getCaption().copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: ValuesManager.spaceExtraSmall),
                      Text(
                        StringsManager.visualSupports,
                        style: StylesManager.getSubHeadline2().copyWith(
                          height: 1.2,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: ValuesManager.spaceMedium),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: ValuesManager.borderRadiusLarge,
                    image: const DecorationImage(
                      image: NetworkImage(
                        'https://cdn-icons-png.flaticon.com/512/3406/3406830.png',
                      ), // Child icon
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: ValuesManager.spaceDefault),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  StringsManager.fortyPercentComplete,
                  style: StylesManager.getBodyMedium().copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  StringsManager.twelveMinRemaining,
                  style: StylesManager.getCaption(),
                ),
              ],
            ),
            const SizedBox(height: ValuesManager.spaceSmall),
            ClipRRect(
              borderRadius: ValuesManager.borderRadiusMedium,
              child: LinearProgressIndicator(value: 0.4, minHeight: 12),
            ),
            const SizedBox(height: ValuesManager.spaceDefault),
            SizedBox(
              width: double.infinity,
              height: ValuesManager.buttonHeightMedium,
              child: ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.play_circle_filled),
                label: const Text(StringsManager.resume),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
