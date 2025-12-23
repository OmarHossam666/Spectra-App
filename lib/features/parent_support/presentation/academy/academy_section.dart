import 'package:flutter/material.dart';
import 'package:spectra/core/constants/values_manager.dart';
import 'package:spectra/features/parent_support/presentation/academy/widgets/course_widget.dart';
import 'package:spectra/features/parent_support/presentation/academy/widgets/module1.dart';
import 'package:spectra/features/parent_support/presentation/academy/widgets/module2.dart';

class AcademySection extends StatelessWidget {
  const AcademySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       CourseWidget(),
        const SizedBox(height: ValuesManager.spaceDefault),
        Module1(),
        Module2(),
      ],
    );
  }
}
