import 'package:flutter/material.dart';
import 'colors_manager.dart';
import 'values_manager.dart';

/// Spectra Typography & Styles Manager
/// Designed with neuro-inclusive guidelines for maximum readability.
///
/// Key Design Constraints:
/// - Alignment: Always LEFT ALIGN (never justify)
/// - Style: Never use ITALICS (use Bold for emphasis)
/// - Type: SANS-SERIF fonts only (no decorative "feet" on letters)
class StylesManager {
  StylesManager._(); // Private constructor

  // ============================================================
  // FONT FAMILIES
  // ============================================================

  /// Standard System Font - Verdana (Headlines)
  /// Wide letter spacing and high readability on screens
  static const String fontVerdana = 'Verdana';

  /// Standard System Font - Arial (Body Text)
  /// Classic, clean Sans Serif, familiar and easy to decode
  static const String fontArial = 'Arial';

  /// Modern Digital Font - Lexend (Headings)
  /// Designed for easy reading, reduces visual crowding
  static const String fontLexend = 'Lexend';

  /// Modern Digital Font - Open Sans (Body)
  /// Open shapes and excellent clarity
  static const String fontOpenSans = 'Open Sans';

  /// Accessibility Font - OpenDyslexic
  /// Prevents letters from "floating" or flipping for users with
  /// dyslexia or processing challenges
  static const String fontOpenDyslexic = 'OpenDyslexic';

  // ============================================================
  // STANDARD SYSTEM TEXT STYLES (Verdana/Arial)
  // ============================================================

  /// Main Headline - Verdana, 32pt, Bold
  static TextStyle getHeadline1({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeHeadline1,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Secondary Headline - Verdana, 28pt, Bold
  static TextStyle getHeadline2({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeHeadline2,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Tertiary Headline - Verdana, 24pt, Bold
  static TextStyle getHeadline3({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeHeadline3,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Sub-Headline 1 - Verdana, 20pt, Semi-Bold
  static TextStyle getSubHeadline1({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeSubHeadline1,
      fontWeight: FontWeight.w600,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Sub-Headline 2 - Verdana, 18pt, Semi-Bold
  static TextStyle getSubHeadline2({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeSubHeadline2,
      fontWeight: FontWeight.w600,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Body Text Large - Arial, 16pt, Regular
  static TextStyle getBodyLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodyLarge,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Body Text Medium - Arial, 15pt, Regular
  static TextStyle getBodyMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodyMedium,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Body Text Small - Arial, 14pt, Regular
  static TextStyle getBodySmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodySmall,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Instructions - Arial, 12pt, Regular
  static TextStyle getInstruction({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeInstruction,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightRelaxed,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Caption - Arial, 11pt, Regular
  static TextStyle getCaption({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeCaption,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.focusState,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingWide,
    );
  }

  // ============================================================
  // MODERN DIGITAL TEXT STYLES (Lexend/Open Sans)
  // For use with Google Fonts
  // ============================================================

  /// Modern Headline - Lexend, Bold
  static TextStyle getModernHeadline1({Color? color}) {
    return TextStyle(
      fontFamily: fontLexend,
      fontSize: ValuesManager.fontSizeHeadline1,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Modern Sub-Headline - Lexend, Semi-Bold
  static TextStyle getModernSubHeadline({Color? color}) {
    return TextStyle(
      fontFamily: fontLexend,
      fontSize: ValuesManager.fontSizeSubHeadline1,
      fontWeight: FontWeight.w600,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Modern Body - Open Sans, Regular
  static TextStyle getModernBody({Color? color}) {
    return TextStyle(
      fontFamily: fontOpenSans,
      fontSize: ValuesManager.fontSizeBodyLarge,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  // ============================================================
  // ACCESSIBILITY TEXT STYLES (OpenDyslexic)
  // Switchable option in settings for users with dyslexia
  // ============================================================

  /// Accessibility Headline - OpenDyslexic, Bold
  static TextStyle getAccessibleHeadline({Color? color, double? fontSize}) {
    return TextStyle(
      fontFamily: fontOpenDyslexic,
      fontSize: fontSize ?? ValuesManager.fontSizeHeadline3,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightRelaxed,
      letterSpacing: ValuesManager.letterSpacingWide,
    );
  }

  /// Accessibility Body - OpenDyslexic, Regular
  static TextStyle getAccessibleBody({Color? color, double? fontSize}) {
    return TextStyle(
      fontFamily: fontOpenDyslexic,
      fontSize: fontSize ?? ValuesManager.fontSizeBodyLarge,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightRelaxed,
      letterSpacing: ValuesManager.letterSpacingWide,
    );
  }

  // ============================================================
  // BUTTON TEXT STYLES
  // ============================================================

  /// Primary Button Text
  static TextStyle getButtonPrimary({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodyLarge,
      fontWeight: FontWeight.w600,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingWide,
    );
  }

  /// Secondary Button Text
  static TextStyle getButtonSecondary({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodySmall,
      fontWeight: FontWeight.w500,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  // ============================================================
  // EMPHASIS STYLES (Bold only - never italics!)
  // ============================================================

  /// Bold emphasis for body text
  static TextStyle getBodyBold({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodyLarge,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  // ============================================================
  // SPECTRA COMPANION TEXT STYLES
  // For AI bot dialogue and communication
  // ============================================================

  /// Companion Speech Bubble Text
  static TextStyle getCompanionSpeech({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodyLarge,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightRelaxed,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Companion Name/Label
  static TextStyle getCompanionLabel({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeSubHeadline2,
      fontWeight: FontWeight.w600,
      color: color ?? ColorsManager.companionCalm,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingWide,
    );
  }

  // ============================================================
  // TEXT THEME FOR MATERIAL THEME
  // Pre-configured TextTheme for use in ThemeData
  // ============================================================

  /// Get complete TextTheme for Material Theme
  static TextTheme getTextTheme({
    Color? textColor,
    SpectraFontFamily fontFamily = SpectraFontFamily.standard,
  }) {
    final String headingFont = _getHeadingFont(fontFamily);
    final String bodyFont = _getBodyFont(fontFamily);
    final Color color = textColor ?? ColorsManager.darkGreyText;

    return TextTheme(
      // Display styles
      displayLarge: getHeadline1(color: color, fontFamily: headingFont),
      displayMedium: getHeadline2(color: color, fontFamily: headingFont),
      displaySmall: getHeadline3(color: color, fontFamily: headingFont),

      // Headline styles
      headlineLarge: getHeadline3(color: color, fontFamily: headingFont),
      headlineMedium: getSubHeadline1(color: color, fontFamily: headingFont),
      headlineSmall: getSubHeadline2(color: color, fontFamily: headingFont),

      // Title styles
      titleLarge: getSubHeadline1(color: color, fontFamily: headingFont),
      titleMedium: getSubHeadline2(color: color, fontFamily: headingFont),
      titleSmall: getBodyLarge(color: color, fontFamily: bodyFont),

      // Body styles
      bodyLarge: getBodyLarge(color: color, fontFamily: bodyFont),
      bodyMedium: getBodyMedium(color: color, fontFamily: bodyFont),
      bodySmall: getBodySmall(color: color, fontFamily: bodyFont),

      // Label styles
      labelLarge: getButtonPrimary(color: color, fontFamily: bodyFont),
      labelMedium: getButtonSecondary(color: color, fontFamily: bodyFont),
      labelSmall: getCaption(color: color, fontFamily: bodyFont),
    );
  }

  /// Get heading font based on font family preference
  static String _getHeadingFont(SpectraFontFamily fontFamily) {
    switch (fontFamily) {
      case SpectraFontFamily.standard:
        return fontVerdana;
      case SpectraFontFamily.modern:
        return fontLexend;
      case SpectraFontFamily.accessible:
        return fontOpenDyslexic;
    }
  }

  /// Get body font based on font family preference
  static String _getBodyFont(SpectraFontFamily fontFamily) {
    switch (fontFamily) {
      case SpectraFontFamily.standard:
        return fontArial;
      case SpectraFontFamily.modern:
        return fontOpenSans;
      case SpectraFontFamily.accessible:
        return fontOpenDyslexic;
    }
  }
}

/// Enum representing the font family options in Spectra
enum SpectraFontFamily {
  /// Standard System Fonts - Verdana/Arial
  /// Wide spacing, high readability, no download required
  standard,

  /// Modern Digital Fonts - Lexend/Open Sans
  /// Google Fonts, designed for easy reading
  modern,

  /// Accessibility Fonts - OpenDyslexic
  /// For users with dyslexia or processing challenges
  accessible,
}
