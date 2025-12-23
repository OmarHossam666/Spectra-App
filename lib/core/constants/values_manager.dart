import 'package:flutter/material.dart';

/// Spectra Values Manager
/// Centralized constants for consistent UI/UX across the app.
/// All hardcoded values are extracted here for easy maintenance.
///
/// Categories:
/// - Spacing: Paddings, margins, gaps
/// - Sizing: Dimensions, touch targets, icon sizes
/// - Border Radius: Rounded corners for softer appearance
/// - Elevation: Shadow depths (kept low for sensory sensitivity)
/// - Animation: Durations, curves
/// - Opacity: Alpha values for transparency
class ValuesManager {
  ValuesManager._(); // Private constructor

  // ============================================================
  // ACCESSIBILITY CONSTANTS
  // Based on autism accessibility research
  // ============================================================

  /// Minimum touch target size (44x44px) per WCAG guidelines
  /// Children with autism may have motor planning challenges
  static const double minTouchTargetSize = 44.0;

  // ============================================================
  // BORDER RADIUS
  // Large rounded corners for softer, less aggressive appearance
  // Sharp corners can feel threatening to sensory-sensitive users
  // ============================================================

  static const double radiusNone = 0.0;
  static const double radiusExtraSmall = 4.0;
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 12.0;
  static const double radiusLarge = 16.0;
  static const double radiusExtraLarge = 24.0;
  static const double radiusCircular = 100.0;

  // Pre-built BorderRadius for convenience
  static BorderRadius get borderRadiusSmall =>
      BorderRadius.circular(radiusSmall);
  static BorderRadius get borderRadiusMedium =>
      BorderRadius.circular(radiusMedium);
  static BorderRadius get borderRadiusLarge =>
      BorderRadius.circular(radiusLarge);
  static BorderRadius get borderRadiusExtraLarge =>
      BorderRadius.circular(radiusExtraLarge);

  // ============================================================
  // ELEVATION
  // Low elevation reduces visual clutter and shadow distractions
  // High elevation creates contrast that can be overwhelming
  // ============================================================

  static const double elevationNone = 0.0;
  static const double elevationLow = 1.0;
  static const double elevationMedium = 2.0;
  static const double elevationHigh = 4.0;
  static const double elevationMax = 8.0;

  // ============================================================
  // BUTTON DIMENSIONS
  // Large touch targets for motor skill accessibility
  // ============================================================

  static const double buttonHeightSmall = 40.0;
  static const double buttonHeightMedium = 48.0;
  static const double buttonHeightLarge = 56.0;

  // ============================================================
  // ICON SIZES
  // Consistent sizing for predictability
  // ============================================================

  static const double iconSizeSmall = 16.0;
  static const double iconSizeMedium = 20.0;
  static const double iconSizeDefault = 24.0;
  static const double iconSizeLarge = 32.0;
  static const double iconSizeExtraLarge = 48.0;

  // ============================================================
  // SPACING (Padding & Margin)
  // Consistent spacing creates visual rhythm and predictability
  // ============================================================

  static const double spaceNone = 0.0;
  static const double spaceExtraSmall = 4.0;
  static const double spaceSmall = 8.0;
  static const double spaceMedium = 12.0;
  static const double spaceDefault = 16.0;
  static const double spaceLarge = 24.0;
  static const double spaceExtraLarge = 32.0;
  static const double spaceHuge = 48.0;

  // Pre-built EdgeInsets for convenience
  static EdgeInsets get paddingSmall => const EdgeInsets.all(spaceSmall);
  static EdgeInsets get paddingMedium => const EdgeInsets.all(spaceMedium);
  static EdgeInsets get paddingDefault => const EdgeInsets.all(spaceDefault);
  static EdgeInsets get paddingLarge => const EdgeInsets.all(spaceLarge);

  // Symmetric padding
  static EdgeInsets get paddingHorizontalSmall =>
      const EdgeInsets.symmetric(horizontal: spaceSmall);
  static EdgeInsets get paddingHorizontalDefault =>
      const EdgeInsets.symmetric(horizontal: spaceDefault);
  static EdgeInsets get paddingHorizontalLarge =>
      const EdgeInsets.symmetric(horizontal: spaceLarge);
  static EdgeInsets get paddingVerticalSmall =>
      const EdgeInsets.symmetric(vertical: spaceSmall);
  static EdgeInsets get paddingVerticalDefault =>
      const EdgeInsets.symmetric(vertical: spaceDefault);

  // Button padding
  static EdgeInsets get buttonPaddingPrimary =>
      const EdgeInsets.symmetric(horizontal: spaceLarge, vertical: spaceMedium);
  static EdgeInsets get buttonPaddingSecondary => const EdgeInsets.symmetric(
    horizontal: spaceDefault,
    vertical: spaceSmall,
  );

  // Input padding
  static EdgeInsets get inputPadding => const EdgeInsets.symmetric(
    horizontal: spaceDefault,
    vertical: spaceDefault,
  );

  // Card margin
  static EdgeInsets get cardMargin => const EdgeInsets.all(spaceSmall);

  // List tile padding
  static EdgeInsets get listTilePadding => const EdgeInsets.symmetric(
    horizontal: spaceDefault,
    vertical: spaceSmall,
  );

  // Chip padding
  static EdgeInsets get chipPadding =>
      const EdgeInsets.symmetric(horizontal: spaceMedium, vertical: spaceSmall);

  // ============================================================
  // BORDER WIDTH
  // Consistent border widths
  // ============================================================

  static const double borderWidthThin = 1.0;
  static const double borderWidthDefault = 2.0;
  static const double borderWidthThick = 3.0;

  // ============================================================
  // DIVIDER
  // ============================================================

  static const double dividerThickness = 1.0;
  static const double dividerSpace = 16.0;

  // ============================================================
  // SLIDER / PROGRESS
  // ============================================================

  static const double sliderTrackHeight = 8.0;

  // ============================================================
  // OPACITY / ALPHA VALUES
  // For transparency effects
  // ============================================================

  static const double opacityDisabled = 0.38;
  static const double opacityLight = 0.2;
  static const double opacityMedium = 0.3;
  static const double opacitySemiTransparent = 0.5;
  static const double opacityHigh = 0.7;
  static const double opacityFull = 1.0;

  // ============================================================
  // ANIMATION DURATIONS
  // Smooth, non-jarring transitions for sensory comfort
  // ============================================================

  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationMedium = Duration(milliseconds: 300);
  static const Duration durationSlow = Duration(milliseconds: 500);
  static const Duration durationVerySlow = Duration(milliseconds: 800);

  // ============================================================
  // FONT SIZES
  // Follows Spectra typography guidelines
  // ============================================================

  /// Main Headlines: 24-32pt
  static const double fontSizeHeadline1 = 32.0;
  static const double fontSizeHeadline2 = 28.0;
  static const double fontSizeHeadline3 = 24.0;

  /// Sub-Headlines: 18-20pt
  static const double fontSizeSubHeadline1 = 20.0;
  static const double fontSizeSubHeadline2 = 18.0;

  /// Body Text: 14-16pt
  static const double fontSizeBodyLarge = 16.0;
  static const double fontSizeBodyMedium = 15.0;
  static const double fontSizeBodySmall = 14.0;

  /// Instructions: 12pt (Minimum)
  static const double fontSizeInstruction = 12.0;

  /// Caption/Small text
  static const double fontSizeCaption = 11.0;

  // ============================================================
  // LINE HEIGHTS
  // For comfortable reading
  // ============================================================

  static const double lineHeightTight = 1.2;
  static const double lineHeightNormal = 1.5;
  static const double lineHeightRelaxed = 1.75;

  // ============================================================
  // LETTER SPACING
  // Slightly increased for better readability
  // ============================================================

  static const double letterSpacingTight = -0.5;
  static const double letterSpacingNormal = 0.0;
  static const double letterSpacingWide = 0.5;
  static const double letterSpacingExtraWide = 1.0;
}
