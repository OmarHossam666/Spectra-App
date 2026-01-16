import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors_manager.dart';
import 'values_manager.dart';

/// Spectra Responsive Typography & Styles Manager
/// Uses flutter_screenutil for responsive font sizes across all devices.
///
/// Key Design Constraints:
/// - Alignment: Always LEFT ALIGN (never justify)
/// - Style: Never use ITALICS (use Bold for emphasis)
/// - Type: SANS-SERIF fonts only (no decorative "feet" on letters)
/// - Responsive: All sizes scale with screen size using .sp
class ResponsiveStylesManager {
  ResponsiveStylesManager._(); // Private constructor

  // ============================================================
  // FONT FAMILIES
  // ============================================================

  static const String fontVerdana = 'Verdana';
  static const String fontArial = 'Arial';
  static const String fontLexend = 'Lexend';
  static const String fontOpenSans = 'Open Sans';
  static const String fontOpenDyslexic = 'OpenDyslexic';

  // ============================================================
  // RESPONSIVE TEXT STYLES (Standard System Fonts)
  // All font sizes use .sp for responsive scaling
  // ============================================================

  /// Main Headline - Verdana, 32pt responsive, Bold
  static TextStyle getHeadline1({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeHeadline1.sp,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Secondary Headline - Verdana, 28pt responsive, Bold
  static TextStyle getHeadline2({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeHeadline2.sp,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Tertiary Headline - Verdana, 24pt responsive, Bold
  static TextStyle getHeadline3({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeHeadline3.sp,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Sub-Headline 1 - Verdana, 20pt responsive, Semi-Bold
  static TextStyle getSubHeadline1({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeSubHeadline1.sp,
      fontWeight: FontWeight.w600,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Sub-Headline 2 - Verdana, 18pt responsive, Semi-Bold
  static TextStyle getSubHeadline2({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontVerdana,
      fontSize: ValuesManager.fontSizeSubHeadline2.sp,
      fontWeight: FontWeight.w600,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Body Text Large - Arial, 16pt responsive, Regular
  static TextStyle getBodyLarge({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodyLarge.sp,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Body Text Medium - Arial, 15pt responsive, Regular
  static TextStyle getBodyMedium({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodyMedium.sp,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Body Text Small - Arial, 14pt responsive, Regular
  static TextStyle getBodySmall({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodySmall.sp,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Instructions - Arial, 12pt responsive, Regular
  static TextStyle getInstruction({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeInstruction.sp,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightRelaxed,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  /// Caption - Arial, 11pt responsive, Regular
  static TextStyle getCaption({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeCaption.sp,
      fontWeight: FontWeight.normal,
      color: color ?? ColorsManager.focusState,
      height: ValuesManager.lineHeightNormal,
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
      fontSize: ValuesManager.fontSizeBodyLarge.sp,
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
      fontSize: ValuesManager.fontSizeBodySmall.sp,
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
      fontSize: ValuesManager.fontSizeBodyLarge.sp,
      fontWeight: FontWeight.bold,
      color: color ?? ColorsManager.darkGreyText,
      height: ValuesManager.lineHeightNormal,
      letterSpacing: ValuesManager.letterSpacingNormal,
    );
  }

  // ============================================================
  // SPECTRA COMPANION TEXT STYLES
  // ============================================================

  /// Companion Speech Bubble Text
  static TextStyle getCompanionSpeech({Color? color, String? fontFamily}) {
    return TextStyle(
      fontFamily: fontFamily ?? fontArial,
      fontSize: ValuesManager.fontSizeBodyLarge.sp,
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
      fontSize: ValuesManager.fontSizeSubHeadline2.sp,
      fontWeight: FontWeight.w600,
      color: color ?? ColorsManager.companionCalm,
      height: ValuesManager.lineHeightTight,
      letterSpacing: ValuesManager.letterSpacingWide,
    );
  }
}
