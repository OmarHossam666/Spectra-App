import 'package:flutter/material.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

class Module2 extends StatelessWidget {
  const Module2({super.key});

  @override
  Widget build(BuildContext context) {
    return // Module 2 (Locked)
    Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ValuesManager.spaceDefault,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(32),
        borderOnForeground: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: ValuesManager.borderRadiusLarge,
                  image: const DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1526431969340-9114f852e673?ixlib=rb-1.2.1&auto=format&fit=crop&w=200&q=80',
                    ), // Sleeping
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: ValuesManager.spaceDefault),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringsManager.module2,
                      style: StylesManager.getCaption().copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      StringsManager.sleepRoutines,
                      style: StylesManager.getSubHeadline2().copyWith(
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: ValuesManager.spaceExtraSmall),
                    Row(
                      children: [
                        const Icon(
                          Icons.lock_open,
                          size: ValuesManager.iconSizeSmall,
                        ),
                        const SizedBox(width: ValuesManager.spaceExtraSmall),
                        Text(
                          StringsManager.startNow,
                          style: StylesManager.getCaption().copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: ValuesManager.buttonHeightSmall,
                height: ValuesManager.buttonHeightSmall,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const Icon(Icons.chevron_right),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
