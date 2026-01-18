import 'package:flutter/material.dart';

/// Spectra Color Palette Manager
/// Designed with neuro-inclusive guidelines to prevent sensory overload.
/// Colors are soft, pastel, and low-contrast while remaining distinguishable.
class ColorsManager {
  ColorsManager._(); // Private constructor to prevent instantiation

  // ============================================================
  // 1. SERENITY PALETTE (Backgrounds & Surfaces)
  // Use for main app background, cards, and containers.
  // Never use pure white (#FFFFFF) as it's too harsh.
  // ============================================================

  /// Cream / Off-White - Warmer alternative to white
  static const Color cream = Color(0xFFFDFBF7);

  /// Soft Beige - Neutral, calming base
  static const Color softBeige = Color(0xFFF5F5DC);

  /// Light Grey - Clean, modern, low glare
  static const Color lightGrey = Color(0xFFF2F2F2);

  /// Pale Blue - For "Communication" area backgrounds
  static const Color paleBlue = Color(0xFFE3F2FD);

  /// Sage Green Light - For "Routine" area backgrounds
  static const Color sageGreenLight = Color(0xFFE8F5E9);

  // ============================================================
  // 2. FUNCTIONAL PALETTE (Modules & Buttons)
  // Use for buttons, icons, and highlighting specific modules.
  // Colors are colorful but desaturated.
  // ============================================================

  /// Communication Blue - Soft Sky Blue (Communication Module)
  static const Color communicationBlue = Color(0xFF90CAF9);

  /// Routine Green - Calm Sage Green (Schedules & Routines Module)
  static const Color routineGreen = Color(0xFFA5D6A7);

  /// Soft Rose - For Emotion/Social skills
  static const Color softRose = Color(0xFFF48FB1);

  /// Lavender - For creative or extra activities
  static const Color lavender = Color(0xFFCE93D8);

  /// Mint - For sensory regulation features
  static const Color mint = Color(0xFF80CBC4);

  // ============================================================
  // 3. ACCESSIBILITY PALETTE (Text & Dark Mode)
  // Use for text and reading elements.
  // High contrast but not harsh.
  // ============================================================

  /// Dark Grey - Primary Text (Use instead of #000000)
  static const Color darkGreyText = Color(0xFF37474F);

  /// Soft Black - Dark Mode Background (Deep charcoal, easier on eyes)
  static const Color softBlack = Color(0xFF1C1C1E);

  /// Dark Grey Surface - For cards in Dark Mode
  static const Color darkGreySurface = Color(0xFF2C2C2E);

  /// Focus / Active State - Blue-grey for selected items
  static const Color focusState = Color(0xFF546E7A);

  // ============================================================
  // 4. SPECTRA COMPANION PALETTE (AI Personality)
  // Use for the "Spectra" robot avatar to convey emotion.
  // ============================================================

  /// Calm State - Friendly Light Blue
  static const Color companionCalm = Color(0xFF4FC3F7);

  /// Alert / Attention - Soft Red (warning but not scary)
  static const Color companionAlert = Color(0xFFE57373);

  /// Happy / Positive - Soft Orange/Yellow
  static const Color companionHappy = Color(0xFFFFCC80);

  /// Neutral / Waiting - Light Blue-Grey
  static const Color companionNeutral = Color(0xFFB0BEC5);

  // ============================================================
  // 5. LOW STIMULATION MODE PALETTE
  // Monochromatic (One color) + Gray
  // Backgrounds: Plain Cream, Grey, or Black (no gradients/patterns)
  // ============================================================

  /// Low Stim Background - Plain Cream
  static const Color lowStimCream = Color(0xFFFDFBF7);

  /// Low Stim Grey
  static const Color lowStimGrey = Color(0xFFE0E0E0);

  /// Low Stim Dark - For dark low stimulation mode
  static const Color lowStimDark = Color(0xFF212121);

  // ============================================================
  // 6. CALM MODE PALETTE
  // Shifts the entire screen to Neutral colors (Beiges/Grays)
  // ============================================================

  /// Calm Mode Primary - Soft Beige
  static const Color calmModePrimary = Color(0xFFF5F5DC);

  /// Calm Mode Secondary - Warm Grey
  static const Color calmModeSecondary = Color(0xFFD7CCC8);

  /// Calm Mode Accent - Muted Taupe
  static const Color calmModeAccent = Color(0xFFBCAAA4);

  // ============================================================
  // THEME COLOR SCHEMES
  // Pre-configured color schemes for each theme mode
  // ============================================================

  /// Light Theme Colors (Serenity Theme)
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: communicationBlue,
    onPrimary: darkGreyText,
    secondary: routineGreen,
    onSecondary: darkGreyText,
    tertiary: lavender,
    onTertiary: darkGreyText,
    error: companionAlert,
    onError: cream,
    surface: cream,
    onSurface: darkGreyText,
    surfaceContainerHighest: lightGrey,
    outline: focusState,
  );

  /// Dark Theme Colors
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: communicationBlue,
    onPrimary: softBlack,
    secondary: routineGreen,
    onSecondary: softBlack,
    tertiary: lavender,
    onTertiary: softBlack,
    error: companionAlert,
    onError: softBlack,
    surface: softBlack,
    onSurface: cream,
    surfaceContainerHighest: darkGreySurface,
    outline: focusState,
  );

  /// Low Stimulation Theme Colors
  static const ColorScheme lowStimColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: lowStimGrey,
    onPrimary: darkGreyText,
    secondary: lowStimGrey,
    onSecondary: darkGreyText,
    tertiary: lowStimGrey,
    onTertiary: darkGreyText,
    error: companionAlert,
    onError: lowStimCream,
    surface: lowStimCream,
    onSurface: darkGreyText,
    surfaceContainerHighest: lowStimGrey,
    outline: focusState,
  );

  /// Calm Mode Theme Colors
  static const ColorScheme calmColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: calmModeAccent,
    onPrimary: darkGreyText,
    secondary: calmModeSecondary,
    onSecondary: darkGreyText,
    tertiary: calmModeSecondary,
    onTertiary: darkGreyText,
    error: companionAlert,
    onError: calmModePrimary,
    surface: calmModePrimary,
    onSurface: darkGreyText,
    surfaceContainerHighest: calmModeSecondary,
    outline: calmModeAccent,
  );

  // ============================================================
  // MODULE-SPECIFIC COLOR GETTERS
  // Utility methods for module-specific colors
  // ============================================================

  /// Get background color for Communication module
  static Color get communicationBackground => paleBlue;

  /// Get accent color for Communication module
  static Color get communicationAccent => communicationBlue;

  /// Get background color for Routine/Schedule module
  static Color get routineBackground => sageGreenLight;

  /// Get accent color for Routine/Schedule module
  static Color get routineAccent => routineGreen;

  /// Get color for Emotion/Social skills module
  static Color get emotionAccent => softRose;

  /// Get color for Creative activities module
  static Color get creativeAccent => lavender;

  /// Get color for Sensory regulation features
  static Color get sensoryAccent => mint;

  // ============================================================
  // SPECTRA COMPANION STATE COLORS
  // Helper methods to get companion avatar colors by state
  // ============================================================

  /// Get Spectra Companion color by emotional state
  static Color getCompanionColor(CompanionState state) {
    switch (state) {
      case CompanionState.calm:
        return companionCalm;
      case CompanionState.alert:
        return companionAlert;
      case CompanionState.happy:
        return companionHappy;
      case CompanionState.neutral:
        return companionNeutral;
    }
  }

  // ============================================================
  // LOGIN SCREEN SPECIFIC COLORS
  // ============================================================

  /// Emergency help banner light background
  static const Color helpBannerLight = Color(0xFFFEE2E2); // Red 100

  /// Emergency help banner text/icon color
  static const Color helpBannerText = Color(0xFFDC2626); // Red 600

  // ============================================================
  // HOME SCREEN GRADIENT COLORS
  // Dynamic sky gradient colors based on time of day
  // ============================================================

  /// Dark mode sky gradient start
  static const Color skyDarkStart = Color(0xFF1E3A5F);

  /// Dark mode sky gradient end
  static const Color skyDarkEnd = Color(0xFF152238);

  /// Morning sky gradient start
  static const Color skyMorningStart = Color(0xFF87CEEB);

  /// Morning sky gradient end
  static const Color skyMorningEnd = Color(0xFFB4D7E8);

  /// Afternoon sky gradient start
  static const Color skyAfternoonStart = Color(0xFF64B5F6);

  /// Afternoon sky gradient end
  static const Color skyAfternoonEnd = Color(0xFF90CAF9);

  /// Evening sky gradient start
  static const Color skyEveningStart = Color(0xFFFFB74D);

  /// Evening sky gradient end
  static const Color skyEveningEnd = Color(0xFFFFCC80);

  /// Night sky gradient start
  static const Color skyNightStart = Color(0xFF3F51B5);

  /// Night sky gradient end
  static const Color skyNightEnd = Color(0xFF5C6BC0);

  // ============================================================
  // HOME MODULE ICON COLORS
  // ============================================================

  /// Talk module icon color (purple)
  static const Color moduleTalkIcon = Color(0xFF9C27B0);

  /// Feelings module icon color (pink)
  static const Color moduleFeelingsIcon = Color(0xFFE91E63);

  /// Learn module icon color (green)
  static const Color moduleLearnIcon = Color(0xFF4CAF50);

  /// Calm Space module icon color (teal)
  static const Color moduleCalmIcon = Color(0xFF009688);

  /// Breakfast activity background color
  static const Color activityBreakfastBg = Color(0xFFFFF3E0);
}

/// Enum representing the emotional states of the Spectra Companion AI
enum CompanionState {
  /// Calm state - Friendly Light Blue
  calm,

  /// Alert / Attention state - Soft Red (warning but not scary)
  alert,

  /// Happy / Positive state - Soft Orange/Yellow
  happy,

  /// Neutral / Waiting state - Light Blue-Grey
  neutral,
}

/// Enum representing the different theme modes available in Spectra
enum SpectraThemeMode {
  /// Standard light theme (Serenity Theme)
  light,

  /// Dark mode - Soft Black/Dark Gray backgrounds
  dark,

  /// Low Stimulation Mode - Monochromatic + Gray
  lowStimulation,

  /// Calm Mode - Neutral Beiges/Grays
  calm,
}
