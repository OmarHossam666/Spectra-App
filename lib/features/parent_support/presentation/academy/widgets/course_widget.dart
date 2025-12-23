import 'package:flutter/material.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

class CourseWidget extends StatelessWidget {
  const CourseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ValuesManager.spaceDefault,
      ),
      child: Container(
        height: 260,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          image: const DecorationImage(
            image: AssetImage('assets/images/parent_support_green_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Gradient Overlay
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black.withAlpha((175))],
                ),
              ),
            ),
            // Content
            Padding(
              padding: const EdgeInsets.all(ValuesManager.spaceLarge),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 0, 248, 95),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      StringsManager.featuredCourse,
                      style: StylesManager.getCaption().copyWith(
                        fontWeight: FontWeight.w900,
                        letterSpacing: 0.5,
                        color: ColorsManager.softBlack,
                      ),
                    ),
                  ),
                  const SizedBox(height: ValuesManager.spaceSmall),
                  Text(
                    StringsManager.understandingSensoryOverload,
                    style: StylesManager.getHeadline3().copyWith(
                      height: 1.1,
                      color: ColorsManager.cream,
                    ),
                  ),
                  const SizedBox(height: ValuesManager.spaceSmall),
                  Row(
                    children: [
                      const Icon(
                        Icons.schedule,
                        color: ColorsManager.cream,
                        size: 18,
                      ),
                      const SizedBox(width: ValuesManager.spaceExtraSmall),
                      Text(
                        StringsManager.fifteenMin,
                        style: StylesManager.getBodyMedium().copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.cream,
                        ),
                      ),
                      const SizedBox(width: ValuesManager.spaceSmall),
                      const Text(
                        "•",
                        style: TextStyle(color: ColorsManager.cream),
                      ),
                      const SizedBox(width: ValuesManager.spaceSmall),
                      const Icon(
                        Icons.play_circle_outline,
                        size: 18,
                        color: ColorsManager.cream,
                      ),
                      const SizedBox(width: ValuesManager.spaceExtraSmall),
                      Text(
                        StringsManager.videoLesson,
                        style: StylesManager.getBodyMedium().copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorsManager.cream,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
