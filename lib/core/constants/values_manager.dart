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

  // ============================================================
  // LOGIN SCREEN SPECIFIC VALUES
  // ============================================================

  /// Profile avatar primary size
  static const double profileAvatarPrimary = 140.0;

  /// Profile avatar secondary size
  static const double profileAvatarSecondary = 100.0;

  /// Profile glow padding
  static const double profileGlowPadding = 20.0;

  /// Profile glow blur radius
  static const double profileGlowBlurRadius = 20.0;

  /// Profile glow spread radius
  static const double profileGlowSpreadRadius = 5.0;

  /// Profile active indicator primary size
  static const double profileIndicatorPrimary = 32.0;

  /// Profile active indicator secondary size
  static const double profileIndicatorSecondary = 24.0;

  /// Profile avatar border width
  static const double profileAvatarBorderWidth = 4.0;

  /// Mascot size default
  static const double mascotSizeDefault = 160.0;

  /// Mascot size tablet
  static const double mascotSizeTablet = 200.0;

  /// Mascot size small
  static const double mascotSizeSmall = 120.0;

  /// Mascot fallback icon ratio
  static const double mascotFallbackRatio = 0.6;

  /// Mascot image ratio
  static const double mascotImageRatio = 0.85;

  /// Dialogue bubble max width
  static const double dialogueBubbleMaxWidth = 140.0;

  /// Pattern grid max width
  static const double patternGridMaxWidth = 320.0;

  /// Pattern icon size
  static const double patternIconSize = 64.0;

  /// Pattern icon selected size
  static const double patternIconSelectedSize = 28.0;

  /// Pattern placeholder border width
  static const double patternPlaceholderBorderWidth = 2.0;

  /// Pattern selected badge size
  static const double patternSelectedBadgeSize = 24.0;

  /// Biometric outer pulse size
  static const double biometricOuterPulseSize = 96.0;

  /// Biometric inner pulse size
  static const double biometricInnerPulseSize = 80.0;

  /// Biometric icon container size
  static const double biometricIconContainerSize = 64.0;

  /// Biometric icon size
  static const double biometricIconSize = 40.0;

  /// Parent avatar size
  static const double parentAvatarSize = 64.0;

  /// Parent avatar icon size
  static const double parentAvatarIconSize = 32.0;

  /// Help button compact size
  static const double helpButtonCompactSize = 56.0;

  /// Help button icon size
  static const double helpButtonIconSize = 28.0;

  /// Header balance width (for centering)
  static const double headerBalanceWidth = 48.0;

  /// PIN max length
  static const int pinMaxLength = 4;

  /// Pattern sequence length
  static const int patternSequenceLength = 3;

  // ============================================================
  // HOME SCREEN SPECIFIC VALUES
  // ============================================================

  /// Profile avatar size
  static const double homeProfileAvatarSize = 56.0;

  /// Profile online indicator size
  static const double homeOnlineIndicatorSize = 14.0;

  /// Profile fallback icon size
  static const double homeProfileFallbackIconSize = 32.0;

  /// Time indicator button size
  static const double homeTimeIndicatorSize = 48.0;

  /// Rafiq character size
  static const double homeRafiqSize = 100.0;

  /// Rafiq image size
  static const double homeRafiqImageSize = 85.0;

  /// Rafiq fallback icon size
  static const double homeRafiqFallbackIconSize = 60.0;

  /// Activity icon container size
  static const double homeActivityIconSize = 48.0;

  /// Module card default height
  static const double homeModuleCardHeight = 160.0;

  /// Module card wide height
  static const double homeModuleCardWideHeight = 90.0;

  /// Module card icon container size
  static const double homeModuleIconContainerSize = 64.0;

  /// Module card icon size
  static const double homeModuleIconSize = 40.0;

  /// Module card wide icon container size
  static const double homeModuleWideIconContainerSize = 56.0;

  /// SOS button size
  static const double homeSosButtonSize = 64.0;

  /// Header shadow blur radius
  static const double homeShadowBlurRadius = 15.0;

  /// Header shadow offset Y
  static const double homeShadowOffsetY = 5.0;

  /// Now/Next bar shadow blur radius
  static const double homeBarShadowBlurRadius = 20.0;

  /// Now/Next bar shadow offset Y
  static const double homeBarShadowOffsetY = 4.0;

  /// Progress bar height
  static const double homeProgressBarHeight = 4.0;

  /// SOS button shadow blur radius
  static const double homeSosShadowBlurRadius = 16.0;

  /// Bottom nav shadow blur radius
  static const double homeNavShadowBlurRadius = 20.0;

  /// Bottom nav shadow offset Y
  static const double homeNavShadowOffsetY = -4.0;

  /// Card shadow blur radius
  static const double homeCardShadowBlurRadius = 10.0;

  /// Card shadow offset Y
  static const double homeCardShadowOffsetY = 4.0;

  /// Demo refresh delay
  static const int homeRefreshDelayMs = 500;

  /// Demo activity progress
  static const double homeActivityProgress = 0.5;

  /// Demo activity duration minutes
  static const int homeActivityDurationMinutes = 30;

  // ============================================================
  // CHAT SCREEN VALUES
  // ============================================================

  /// Chat typing indicator delay in milliseconds
  static const int chatTypingDelayMs = 1500;

  /// Chat minimum typing delay
  static const int chatMinTypingDelayMs = 800;

  /// Chat maximum typing delay
  static const int chatMaxTypingDelayMs = 2000;

  /// Chat header height
  static const double chatHeaderHeight = 72;

  /// Chat avatar size
  static const double chatAvatarSize = 48;

  /// Chat avatar small size
  static const double chatAvatarSmall = 32;

  /// Chat input field height
  static const double chatInputHeight = 56;

  /// Chat message bubble max width percentage
  static const double chatBubbleMaxWidthPercent = 0.75;

  /// Chat message bubble padding horizontal
  static const double chatBubblePaddingH = 16;

  /// Chat message bubble padding vertical
  static const double chatBubblePaddingV = 12;

  /// Chat message bubble border radius
  static const double chatBubbleRadius = 20;

  /// Chat message bubble tail radius
  static const double chatBubbleTailRadius = 4;

  /// Chat quick reply height
  static const double chatQuickReplyHeight = 40;

  /// Chat quick reply border radius
  static const double chatQuickReplyRadius = 20;

  /// Chat quick reply spacing
  static const double chatQuickReplySpacing = 8;

  /// Chat message spacing
  static const double chatMessageSpacing = 8;

  /// Chat message group spacing
  static const double chatMessageGroupSpacing = 16;

  /// Chat input border radius
  static const double chatInputRadius = 28;

  /// Chat send button size
  static const double chatSendButtonSize = 44;

  /// Chat typing dot size
  static const double chatTypingDotSize = 8;

  /// Chat typing dot spacing
  static const double chatTypingDotSpacing = 4;

  /// Chat animation duration
  static const int chatAnimationDurationMs = 300;

  /// Chat list bottom padding
  static const double chatListBottomPadding = 16;

  /// Chat screen horizontal padding
  static const double chatScreenPaddingH = 16;
}
