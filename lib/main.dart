import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/themes_manager.dart';
import 'package:spectra/core/helpers/responsive_helper.dart';
import 'package:spectra/core/routes/go_router.dart';
import 'package:spectra/features/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  runApp(const Spectra());
}

class Spectra extends StatelessWidget {
  const Spectra({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        ResponsiveHelper.designWidth,
        ResponsiveHelper.designHeight,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: goRouter,
          debugShowCheckedModeBanner: false,
          title: StringsManager.appName,
          theme: ThemesManager.lightTheme,
          darkTheme: ThemesManager.darkTheme,
          themeMode: ThemeMode.light,
        );
      },
      child: const OnboardingPage(),
    );
  }
}
