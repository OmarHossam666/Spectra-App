import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'colors_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';

/// ============================================================
/// SPECTRA THEME MANAGEMENT SYSTEM
/// ============================================================
///
/// Designed for children with Autism following neuro-inclusive
/// accessibility guidelines. This system provides three distinct
/// themes optimized for different sensory needs:
///
/// 1. **Light Theme (Serenity Mode)**: Standard calming theme with
///    soft pastels and cream backgrounds. Avoids harsh pure white.
///
/// 2. **Dark Theme (Low Eye-Strain Mode)**: Soft charcoal backgrounds
///    with desaturated colors to reduce eye strain in low-light.
///
/// 3. **Low Stimulation Mode (Sensory Regulation)**: Monochromatic
///    grayscale theme with zero shadows/gradients for maximum
///    sensory calming during overwhelm.
///
/// CRITICAL DESIGN PRINCIPLES:
/// - AVOID pure white (#FFFFFF) - causes sensory glare
/// - AVOID pure black (#000000) - too harsh contrast
/// - AVOID italics - difficult for dyslexic users
/// - USE large touch targets (44x44px minimum)
/// - USE low elevation (0-1) to reduce visual clutter
/// - USE rounded corners for softer visual appearance
/// ============================================================
class ThemesManager {
  ThemesManager._(); // Private constructor

  // ============================================================
  // LIGHT THEME (Serenity Mode)
  // ============================================================
  /// Standard calming theme designed for everyday use.
  /// Uses soft pastels and cream backgrounds to prevent sensory glare.
  ///
  /// WHY: Pure white (#FFFFFF) reflects 100% of light, causing eye strain
  /// and sensory overload. Cream (#FDFBF7) reduces this while staying light.
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // COLOR SCHEME
      // Using soft pastels - avoids harsh primary colors that can overwhelm
      colorScheme: ColorsManager.lightColorScheme,

      // BACKGROUND COLORS
      // Cream instead of white to reduce sensory glare
      scaffoldBackgroundColor: ColorsManager.cream,
      canvasColor: ColorsManager.cream,

      // TEXT THEME
      // Using Verdana/Arial - wide letter spacing aids reading
      // NO italics - they are hard to process for many neurodiverse users
      textTheme: StylesManager.getTextTheme(
        textColor: ColorsManager.darkGreyText,
        fontFamily: SpectraFontFamily.standard,
      ),

      // APPBAR THEME
      // Flat (0 elevation) to reduce visual clutter
      // Centered title for predictable visual layout
      appBarTheme: AppBarTheme(
        elevation: ValuesManager.elevationNone,
        scrolledUnderElevation: ValuesManager.elevationNone,
        centerTitle: true,
        backgroundColor: ColorsManager.cream,
        foregroundColor: ColorsManager.darkGreyText,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: StylesManager.getSubHeadline1(
          color: ColorsManager.darkGreyText,
        ),
        iconTheme: IconThemeData(
          color: ColorsManager.darkGreyText,
          size: ValuesManager.iconSizeDefault,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      // CARD THEME
      // Low elevation (1) to minimize shadow distractions
      // Rounded corners for softer visual appearance
      cardTheme: CardThemeData(
        elevation: ValuesManager.elevationLow,
        color: ColorsManager.softBeige,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
        margin: ValuesManager.cardMargin,
      ),

      // ELEVATED BUTTON THEME
      // Large touch targets (min 44x44px) for motor skill accessibility
      // Rounded corners for softer appearance
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: ValuesManager.elevationLow,
          backgroundColor: ColorsManager.communicationBlue,
          foregroundColor: ColorsManager.darkGreyText,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
          ),
          textStyle: StylesManager.getButtonPrimary(),
        ),
      ),

      // FILLED BUTTON THEME
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: ColorsManager.communicationBlue,
          foregroundColor: ColorsManager.darkGreyText,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
          ),
          textStyle: StylesManager.getButtonPrimary(),
        ),
      ),

      // OUTLINED BUTTON THEME
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorsManager.communicationBlue,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
          ),
          side: BorderSide(
            color: ColorsManager.communicationBlue,
            width: ValuesManager.borderWidthDefault,
          ),
          textStyle: StylesManager.getButtonPrimary(
            color: ColorsManager.communicationBlue,
          ),
        ),
      ),

      // TEXT BUTTON THEME
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorsManager.communicationBlue,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightSmall,
          ),
          padding: ValuesManager.buttonPaddingSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusMedium,
          ),
          textStyle: StylesManager.getButtonSecondary(
            color: ColorsManager.communicationBlue,
          ),
        ),
      ),

      // FLOATING ACTION BUTTON THEME
      // Large size for easy targeting
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: ValuesManager.elevationLow,
        backgroundColor: ColorsManager.communicationBlue,
        foregroundColor: ColorsManager.darkGreyText,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
        extendedTextStyle: StylesManager.getButtonPrimary(),
      ),

      // ICON THEME
      // Consistent sizing for predictability
      iconTheme: IconThemeData(
        color: ColorsManager.darkGreyText,
        size: ValuesManager.iconSizeDefault,
      ),

      // INPUT DECORATION THEME
      // Clear borders, no clutter, rounded corners
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsManager.lightGrey,
        contentPadding: ValuesManager.inputPadding,
        border: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide(
            color: ColorsManager.communicationBlue,
            width: ValuesManager.borderWidthDefault,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide(
            color: ColorsManager.companionAlert,
            width: ValuesManager.borderWidthDefault,
          ),
        ),
        labelStyle: StylesManager.getBodyMedium(
          color: ColorsManager.focusState,
        ),
        hintStyle: StylesManager.getBodyMedium(color: ColorsManager.focusState),
      ),

      // BOTTOM NAVIGATION BAR THEME
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: ColorsManager.cream,
        selectedItemColor: ColorsManager.communicationBlue,
        unselectedItemColor: ColorsManager.focusState,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: StylesManager.getCaption(
          color: ColorsManager.communicationBlue,
        ),
        unselectedLabelStyle: StylesManager.getCaption(
          color: ColorsManager.focusState,
        ),
      ),

      // NAVIGATION BAR THEME (Material 3)
      navigationBarTheme: NavigationBarThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: ColorsManager.cream,
        indicatorColor: ColorsManager.communicationBlue.withValues(
          alpha: ValuesManager.opacityLight,
        ),
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return StylesManager.getCaption(
              color: ColorsManager.communicationBlue,
            );
          }
          return StylesManager.getCaption(color: ColorsManager.focusState);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: ColorsManager.communicationBlue,
              size: ValuesManager.iconSizeDefault,
            );
          }
          return IconThemeData(
            color: ColorsManager.focusState,
            size: ValuesManager.iconSizeDefault,
          );
        }),
      ),

      // DIALOG THEME
      dialogTheme: DialogThemeData(
        elevation: ValuesManager.elevationMedium,
        backgroundColor: ColorsManager.cream,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
        titleTextStyle: StylesManager.getSubHeadline1(
          color: ColorsManager.darkGreyText,
        ),
        contentTextStyle: StylesManager.getBodyLarge(
          color: ColorsManager.darkGreyText,
        ),
      ),

      // BOTTOM SHEET THEME
      bottomSheetTheme: BottomSheetThemeData(
        elevation: ValuesManager.elevationLow,
        backgroundColor: ColorsManager.cream,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(ValuesManager.radiusLarge),
          ),
        ),
      ),

      // SNACKBAR THEME
      snackBarTheme: SnackBarThemeData(
        elevation: ValuesManager.elevationLow,
        backgroundColor: ColorsManager.darkGreyText,
        contentTextStyle: StylesManager.getBodyMedium(
          color: ColorsManager.cream,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // CHIP THEME
      chipTheme: ChipThemeData(
        backgroundColor: ColorsManager.lightGrey,
        selectedColor: ColorsManager.communicationBlue,
        labelStyle: StylesManager.getBodySmall(),
        padding: ValuesManager.chipPadding,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusSmall,
        ),
      ),

      // DIVIDER THEME
      dividerTheme: DividerThemeData(
        color: ColorsManager.lightGrey,
        thickness: ValuesManager.dividerThickness,
        space: ValuesManager.dividerSpace,
      ),

      // PROGRESS INDICATOR THEME
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsManager.communicationBlue,
        linearTrackColor: ColorsManager.lightGrey,
        circularTrackColor: ColorsManager.lightGrey,
      ),

      // SWITCH THEME
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.communicationBlue;
          }
          return ColorsManager.lightGrey;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.communicationBlue.withValues(
              alpha: ValuesManager.opacitySemiTransparent,
            );
          }
          return ColorsManager.focusState.withValues(
            alpha: ValuesManager.opacityMedium,
          );
        }),
      ),

      // CHECKBOX THEME
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.communicationBlue;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(ColorsManager.cream),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ValuesManager.radiusExtraSmall),
        ),
      ),

      // SLIDER THEME
      sliderTheme: SliderThemeData(
        activeTrackColor: ColorsManager.communicationBlue,
        inactiveTrackColor: ColorsManager.lightGrey,
        thumbColor: ColorsManager.communicationBlue,
        overlayColor: ColorsManager.communicationBlue.withValues(
          alpha: ValuesManager.opacityLight,
        ),
        trackHeight: ValuesManager.sliderTrackHeight,
      ),

      // LIST TILE THEME
      listTileTheme: ListTileThemeData(
        contentPadding: ValuesManager.listTilePadding,
        minVerticalPadding: ValuesManager.spaceMedium,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
        titleTextStyle: StylesManager.getBodyLarge(
          color: ColorsManager.darkGreyText,
        ),
        subtitleTextStyle: StylesManager.getBodySmall(
          color: ColorsManager.focusState,
        ),
      ),

      // TOOLTIP THEME
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ColorsManager.darkGreyText,
          borderRadius: ValuesManager.borderRadiusSmall,
        ),
        textStyle: StylesManager.getCaption(color: ColorsManager.cream),
      ),

      // TAB BAR THEME
      tabBarTheme: TabBarThemeData(
        labelColor: ColorsManager.communicationBlue,
        unselectedLabelColor: ColorsManager.focusState,
        labelStyle: StylesManager.getButtonPrimary(),
        unselectedLabelStyle: StylesManager.getButtonSecondary(),
        indicatorColor: ColorsManager.communicationBlue,
        indicatorSize: TabBarIndicatorSize.label,
      ),

      // POPUP MENU THEME
      popupMenuTheme: PopupMenuThemeData(
        elevation: ValuesManager.elevationLow,
        color: ColorsManager.cream,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
        textStyle: StylesManager.getBodyMedium(),
      ),

      // EXPANSION TILE THEME
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: ColorsManager.cream,
        collapsedBackgroundColor: ColorsManager.cream,
        iconColor: ColorsManager.focusState,
        collapsedIconColor: ColorsManager.focusState,
        textColor: ColorsManager.darkGreyText,
        collapsedTextColor: ColorsManager.darkGreyText,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
      ),

      // SEARCH BAR THEME
      searchBarTheme: SearchBarThemeData(
        elevation: WidgetStateProperty.all(ValuesManager.elevationNone),
        backgroundColor: WidgetStateProperty.all(ColorsManager.lightGrey),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusMedium,
          ),
        ),
        textStyle: WidgetStateProperty.all(StylesManager.getBodyMedium()),
        hintStyle: WidgetStateProperty.all(
          StylesManager.getBodyMedium(color: ColorsManager.focusState),
        ),
      ),

      // SEGMENTED BUTTON THEME
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return ColorsManager.communicationBlue;
            }
            return ColorsManager.lightGrey;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return ColorsManager.darkGreyText;
            }
            return ColorsManager.focusState;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: ValuesManager.borderRadiusMedium,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // DARK THEME (Low Eye-Strain Mode)
  // ============================================================
  /// Low eye-strain theme for use in dim lighting or evening hours.
  /// Uses soft charcoal backgrounds instead of pure black.
  ///
  /// WHY: Pure black (#000000) creates harsh contrast with text,
  /// causing eye strain. Soft black (#1C1C1E) is gentler while
  /// maintaining readability.
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,

      // COLOR SCHEME
      colorScheme: ColorsManager.darkColorScheme,

      // BACKGROUND COLORS
      // Soft black instead of pure black to reduce harsh contrast
      scaffoldBackgroundColor: ColorsManager.softBlack,
      canvasColor: ColorsManager.softBlack,

      // TEXT THEME
      // Using cream text on dark background - softer than pure white
      textTheme: StylesManager.getTextTheme(
        textColor: ColorsManager.cream,
        fontFamily: SpectraFontFamily.standard,
      ),

      // APPBAR THEME
      appBarTheme: AppBarTheme(
        elevation: ValuesManager.elevationNone,
        scrolledUnderElevation: ValuesManager.elevationNone,
        centerTitle: true,
        backgroundColor: ColorsManager.softBlack,
        foregroundColor: ColorsManager.cream,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: StylesManager.getSubHeadline1(
          color: ColorsManager.cream,
        ),
        iconTheme: IconThemeData(
          color: ColorsManager.cream,
          size: ValuesManager.iconSizeDefault,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),

      // CARD THEME
      cardTheme: CardThemeData(
        elevation: ValuesManager.elevationLow,
        color: ColorsManager.darkGreySurface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
        margin: ValuesManager.cardMargin,
      ),

      // ELEVATED BUTTON THEME
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: ValuesManager.elevationLow,
          backgroundColor: ColorsManager.communicationBlue,
          foregroundColor: ColorsManager.softBlack,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
          ),
          textStyle: StylesManager.getButtonPrimary(
            color: ColorsManager.softBlack,
          ),
        ),
      ),

      // FILLED BUTTON THEME
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: ColorsManager.communicationBlue,
          foregroundColor: ColorsManager.softBlack,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
          ),
          textStyle: StylesManager.getButtonPrimary(
            color: ColorsManager.softBlack,
          ),
        ),
      ),

      // OUTLINED BUTTON THEME
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: ColorsManager.communicationBlue,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
          ),
          side: BorderSide(
            color: ColorsManager.communicationBlue,
            width: ValuesManager.borderWidthDefault,
          ),
          textStyle: StylesManager.getButtonPrimary(
            color: ColorsManager.communicationBlue,
          ),
        ),
      ),

      // TEXT BUTTON THEME
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: ColorsManager.communicationBlue,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightSmall,
          ),
          padding: ValuesManager.buttonPaddingSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusMedium,
          ),
          textStyle: StylesManager.getButtonSecondary(
            color: ColorsManager.communicationBlue,
          ),
        ),
      ),

      // FLOATING ACTION BUTTON THEME
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: ValuesManager.elevationLow,
        backgroundColor: ColorsManager.communicationBlue,
        foregroundColor: ColorsManager.softBlack,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
        extendedTextStyle: StylesManager.getButtonPrimary(
          color: ColorsManager.softBlack,
        ),
      ),

      // ICON THEME
      iconTheme: IconThemeData(
        color: ColorsManager.cream,
        size: ValuesManager.iconSizeDefault,
      ),

      // INPUT DECORATION THEME
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsManager.darkGreySurface,
        contentPadding: ValuesManager.inputPadding,
        border: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide(
            color: ColorsManager.communicationBlue,
            width: ValuesManager.borderWidthDefault,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide(
            color: ColorsManager.companionAlert,
            width: ValuesManager.borderWidthDefault,
          ),
        ),
        labelStyle: StylesManager.getBodyMedium(
          color: ColorsManager.focusState,
        ),
        hintStyle: StylesManager.getBodyMedium(color: ColorsManager.focusState),
      ),

      // BOTTOM NAVIGATION BAR THEME
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: ColorsManager.softBlack,
        selectedItemColor: ColorsManager.communicationBlue,
        unselectedItemColor: ColorsManager.focusState,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: StylesManager.getCaption(
          color: ColorsManager.communicationBlue,
        ),
        unselectedLabelStyle: StylesManager.getCaption(
          color: ColorsManager.focusState,
        ),
      ),

      // NAVIGATION BAR THEME (Material 3)
      navigationBarTheme: NavigationBarThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: ColorsManager.softBlack,
        indicatorColor: ColorsManager.communicationBlue.withValues(
          alpha: ValuesManager.opacityMedium,
        ),
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return StylesManager.getCaption(
              color: ColorsManager.communicationBlue,
            );
          }
          return StylesManager.getCaption(color: ColorsManager.focusState);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: ColorsManager.communicationBlue,
              size: ValuesManager.iconSizeDefault,
            );
          }
          return IconThemeData(
            color: ColorsManager.focusState,
            size: ValuesManager.iconSizeDefault,
          );
        }),
      ),

      // DIALOG THEME
      dialogTheme: DialogThemeData(
        elevation: ValuesManager.elevationMedium,
        backgroundColor: ColorsManager.darkGreySurface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
        titleTextStyle: StylesManager.getSubHeadline1(
          color: ColorsManager.cream,
        ),
        contentTextStyle: StylesManager.getBodyLarge(
          color: ColorsManager.cream,
        ),
      ),

      // BOTTOM SHEET THEME
      bottomSheetTheme: BottomSheetThemeData(
        elevation: ValuesManager.elevationLow,
        backgroundColor: ColorsManager.darkGreySurface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(ValuesManager.radiusLarge),
          ),
        ),
      ),

      // SNACKBAR THEME
      snackBarTheme: SnackBarThemeData(
        elevation: ValuesManager.elevationLow,
        backgroundColor: ColorsManager.cream,
        contentTextStyle: StylesManager.getBodyMedium(
          color: ColorsManager.darkGreyText,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // CHIP THEME
      chipTheme: ChipThemeData(
        backgroundColor: ColorsManager.darkGreySurface,
        selectedColor: ColorsManager.communicationBlue,
        labelStyle: StylesManager.getBodySmall(color: ColorsManager.cream),
        padding: ValuesManager.chipPadding,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusSmall,
        ),
      ),

      // DIVIDER THEME
      dividerTheme: DividerThemeData(
        color: ColorsManager.darkGreySurface,
        thickness: ValuesManager.dividerThickness,
        space: ValuesManager.dividerSpace,
      ),

      // PROGRESS INDICATOR THEME
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: ColorsManager.communicationBlue,
        linearTrackColor: ColorsManager.darkGreySurface,
        circularTrackColor: ColorsManager.darkGreySurface,
      ),

      // SWITCH THEME
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.communicationBlue;
          }
          return ColorsManager.focusState;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.communicationBlue.withValues(
              alpha: ValuesManager.opacitySemiTransparent,
            );
          }
          return ColorsManager.darkGreySurface;
        }),
      ),

      // CHECKBOX THEME
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return ColorsManager.communicationBlue;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(ColorsManager.softBlack),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ValuesManager.radiusExtraSmall),
        ),
        side: BorderSide(
          color: ColorsManager.focusState,
          width: ValuesManager.borderWidthDefault,
        ),
      ),

      // SLIDER THEME
      sliderTheme: SliderThemeData(
        activeTrackColor: ColorsManager.communicationBlue,
        inactiveTrackColor: ColorsManager.darkGreySurface,
        thumbColor: ColorsManager.communicationBlue,
        overlayColor: ColorsManager.communicationBlue.withValues(
          alpha: ValuesManager.opacityLight,
        ),
        trackHeight: ValuesManager.sliderTrackHeight,
      ),

      // LIST TILE THEME
      listTileTheme: ListTileThemeData(
        contentPadding: ValuesManager.listTilePadding,
        minVerticalPadding: ValuesManager.spaceMedium,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
        titleTextStyle: StylesManager.getBodyLarge(color: ColorsManager.cream),
        subtitleTextStyle: StylesManager.getBodySmall(
          color: ColorsManager.focusState,
        ),
      ),

      // TOOLTIP THEME
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: ColorsManager.cream,
          borderRadius: ValuesManager.borderRadiusSmall,
        ),
        textStyle: StylesManager.getCaption(color: ColorsManager.darkGreyText),
      ),

      // TAB BAR THEME
      tabBarTheme: TabBarThemeData(
        labelColor: ColorsManager.communicationBlue,
        unselectedLabelColor: ColorsManager.focusState,
        labelStyle: StylesManager.getButtonPrimary(color: ColorsManager.cream),
        unselectedLabelStyle: StylesManager.getButtonSecondary(
          color: ColorsManager.focusState,
        ),
        indicatorColor: ColorsManager.communicationBlue,
        indicatorSize: TabBarIndicatorSize.label,
      ),

      // POPUP MENU THEME
      popupMenuTheme: PopupMenuThemeData(
        elevation: ValuesManager.elevationLow,
        color: ColorsManager.darkGreySurface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
        textStyle: StylesManager.getBodyMedium(color: ColorsManager.cream),
      ),

      // EXPANSION TILE THEME
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: ColorsManager.softBlack,
        collapsedBackgroundColor: ColorsManager.softBlack,
        iconColor: ColorsManager.focusState,
        collapsedIconColor: ColorsManager.focusState,
        textColor: ColorsManager.cream,
        collapsedTextColor: ColorsManager.cream,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
      ),

      // SEARCH BAR THEME
      searchBarTheme: SearchBarThemeData(
        elevation: WidgetStateProperty.all(ValuesManager.elevationNone),
        backgroundColor: WidgetStateProperty.all(ColorsManager.darkGreySurface),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusMedium,
          ),
        ),
        textStyle: WidgetStateProperty.all(
          StylesManager.getBodyMedium(color: ColorsManager.cream),
        ),
        hintStyle: WidgetStateProperty.all(
          StylesManager.getBodyMedium(color: ColorsManager.focusState),
        ),
      ),

      // SEGMENTED BUTTON THEME
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return ColorsManager.communicationBlue;
            }
            return ColorsManager.darkGreySurface;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return ColorsManager.softBlack;
            }
            return ColorsManager.focusState;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: ValuesManager.borderRadiusMedium,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // LOW STIMULATION THEME (Sensory Regulation Mode)
  // ============================================================
  /// Monochromatic theme for use during sensory overwhelm.
  /// Removes ALL color variation - only grayscale.
  /// Zero shadows, zero gradients, maximum simplicity.
  ///
  /// WHY: During sensory overload, any additional visual stimulus
  /// can worsen the experience. This theme strips away all
  /// non-essential visual elements to create a calming environment.
  static ThemeData get lowStimulationTheme {
    // Low stim uses grayscale - desaturated version of colors
    const Color lowStimBackground = Color(0xFFF5F5F5);
    const Color lowStimSurface = Color(0xFFE8E8E8);
    const Color lowStimPrimary = Color(0xFF9E9E9E);
    const Color lowStimText = Color(0xFF424242);
    const Color lowStimSubtle = Color(0xFFBDBDBD);
    const Color lowStimError = Color(0xFF9E9E9E);

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      // COLOR SCHEME
      // Completely monochromatic - no hue variation
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: lowStimPrimary,
        onPrimary: lowStimText,
        secondary: lowStimPrimary,
        onSecondary: lowStimText,
        tertiary: lowStimPrimary,
        onTertiary: lowStimText,
        error: lowStimError, // Even error is gray to avoid alarm
        onError: lowStimBackground,
        surface: lowStimBackground,
        onSurface: lowStimText,
        surfaceContainerHighest: lowStimSurface,
        outline: lowStimSubtle,
      ),

      // BACKGROUND COLORS
      // Plain light gray - no patterns or gradients
      scaffoldBackgroundColor: lowStimBackground,
      canvasColor: lowStimBackground,

      // TEXT THEME
      textTheme: StylesManager.getTextTheme(
        textColor: lowStimText,
        fontFamily: SpectraFontFamily.standard,
      ),

      // APPBAR THEME
      // Completely flat, no visual distinction
      appBarTheme: AppBarTheme(
        elevation: ValuesManager.elevationNone,
        scrolledUnderElevation: ValuesManager.elevationNone,
        centerTitle: true,
        backgroundColor: lowStimBackground,
        foregroundColor: lowStimText,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: StylesManager.getSubHeadline1(color: lowStimText),
        iconTheme: IconThemeData(
          color: lowStimText,
          size: ValuesManager.iconSizeDefault,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),

      // CARD THEME
      // ZERO elevation - no shadows whatsoever
      cardTheme: CardThemeData(
        elevation: ValuesManager.elevationNone,
        color: lowStimSurface,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
          side: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
        ),
        margin: ValuesManager.cardMargin,
      ),

      // ELEVATED BUTTON THEME
      // Flat buttons with subtle borders instead of elevation
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: ValuesManager.elevationNone,
          backgroundColor: lowStimSurface,
          foregroundColor: lowStimText,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
            side: BorderSide(
              color: lowStimSubtle,
              width: ValuesManager.borderWidthThin,
            ),
          ),
          textStyle: StylesManager.getButtonPrimary(color: lowStimText),
        ),
      ),

      // FILLED BUTTON THEME
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: lowStimPrimary,
          foregroundColor: lowStimBackground,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
          ),
          textStyle: StylesManager.getButtonPrimary(color: lowStimBackground),
        ),
      ),

      // OUTLINED BUTTON THEME
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: lowStimText,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightMedium,
          ),
          padding: ValuesManager.buttonPaddingPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusLarge,
          ),
          side: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
          textStyle: StylesManager.getButtonPrimary(color: lowStimText),
        ),
      ),

      // TEXT BUTTON THEME
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: lowStimText,
          minimumSize: Size(
            ValuesManager.minTouchTargetSize,
            ValuesManager.buttonHeightSmall,
          ),
          padding: ValuesManager.buttonPaddingSecondary,
          shape: RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusMedium,
          ),
          textStyle: StylesManager.getButtonSecondary(color: lowStimText),
        ),
      ),

      // FLOATING ACTION BUTTON THEME
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: lowStimSurface,
        foregroundColor: lowStimText,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
          side: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
        ),
        extendedTextStyle: StylesManager.getButtonPrimary(color: lowStimText),
      ),

      // ICON THEME
      iconTheme: IconThemeData(
        color: lowStimText,
        size: ValuesManager.iconSizeDefault,
      ),

      // INPUT DECORATION THEME
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lowStimSurface,
        contentPadding: ValuesManager.inputPadding,
        border: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide(
            color: lowStimText,
            width: ValuesManager.borderWidthDefault,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          borderSide: BorderSide(
            color: lowStimPrimary,
            width: ValuesManager.borderWidthDefault,
          ),
        ),
        labelStyle: StylesManager.getBodyMedium(color: lowStimSubtle),
        hintStyle: StylesManager.getBodyMedium(color: lowStimSubtle),
      ),

      // BOTTOM NAVIGATION BAR THEME
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: lowStimBackground,
        selectedItemColor: lowStimText,
        unselectedItemColor: lowStimSubtle,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: StylesManager.getCaption(color: lowStimText),
        unselectedLabelStyle: StylesManager.getCaption(color: lowStimSubtle),
      ),

      // NAVIGATION BAR THEME
      navigationBarTheme: NavigationBarThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: lowStimBackground,
        indicatorColor: lowStimSurface,
        surfaceTintColor: Colors.transparent,
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return StylesManager.getCaption(color: lowStimText);
          }
          return StylesManager.getCaption(color: lowStimSubtle);
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: lowStimText,
              size: ValuesManager.iconSizeDefault,
            );
          }
          return IconThemeData(
            color: lowStimSubtle,
            size: ValuesManager.iconSizeDefault,
          );
        }),
      ),

      // DIALOG THEME
      dialogTheme: DialogThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: lowStimBackground,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
          side: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
        ),
        titleTextStyle: StylesManager.getSubHeadline1(color: lowStimText),
        contentTextStyle: StylesManager.getBodyLarge(color: lowStimText),
      ),

      // BOTTOM SHEET THEME
      bottomSheetTheme: BottomSheetThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: lowStimBackground,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(ValuesManager.radiusLarge),
          ),
          side: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
        ),
      ),

      // SNACKBAR THEME
      snackBarTheme: SnackBarThemeData(
        elevation: ValuesManager.elevationNone,
        backgroundColor: lowStimPrimary,
        contentTextStyle: StylesManager.getBodyMedium(color: lowStimBackground),
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
        behavior: SnackBarBehavior.floating,
      ),

      // CHIP THEME
      chipTheme: ChipThemeData(
        backgroundColor: lowStimSurface,
        selectedColor: lowStimPrimary,
        labelStyle: StylesManager.getBodySmall(color: lowStimText),
        padding: ValuesManager.chipPadding,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusSmall,
          side: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
        ),
      ),

      // DIVIDER THEME
      dividerTheme: DividerThemeData(
        color: lowStimSubtle,
        thickness: ValuesManager.dividerThickness,
        space: ValuesManager.dividerSpace,
      ),

      // PROGRESS INDICATOR THEME
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: lowStimPrimary,
        linearTrackColor: lowStimSurface,
        circularTrackColor: lowStimSurface,
      ),

      // SWITCH THEME
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return lowStimText;
          }
          return lowStimSubtle;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return lowStimPrimary;
          }
          return lowStimSurface;
        }),
      ),

      // CHECKBOX THEME
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return lowStimPrimary;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(lowStimBackground),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(ValuesManager.radiusExtraSmall),
        ),
        side: BorderSide(
          color: lowStimSubtle,
          width: ValuesManager.borderWidthDefault,
        ),
      ),

      // SLIDER THEME
      sliderTheme: SliderThemeData(
        activeTrackColor: lowStimPrimary,
        inactiveTrackColor: lowStimSurface,
        thumbColor: lowStimText,
        overlayColor: Colors.transparent,
        trackHeight: ValuesManager.sliderTrackHeight,
      ),

      // LIST TILE THEME
      listTileTheme: ListTileThemeData(
        contentPadding: ValuesManager.listTilePadding,
        minVerticalPadding: ValuesManager.spaceMedium,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
        titleTextStyle: StylesManager.getBodyLarge(color: lowStimText),
        subtitleTextStyle: StylesManager.getBodySmall(color: lowStimSubtle),
      ),

      // TOOLTIP THEME
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color: lowStimText,
          borderRadius: ValuesManager.borderRadiusSmall,
        ),
        textStyle: StylesManager.getCaption(color: lowStimBackground),
      ),

      // TAB BAR THEME
      tabBarTheme: TabBarThemeData(
        labelColor: lowStimText,
        unselectedLabelColor: lowStimSubtle,
        labelStyle: StylesManager.getButtonPrimary(color: lowStimText),
        unselectedLabelStyle: StylesManager.getButtonSecondary(
          color: lowStimSubtle,
        ),
        indicatorColor: lowStimText,
        indicatorSize: TabBarIndicatorSize.label,
      ),

      // POPUP MENU THEME
      popupMenuTheme: PopupMenuThemeData(
        elevation: ValuesManager.elevationNone,
        color: lowStimBackground,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
          side: BorderSide(
            color: lowStimSubtle,
            width: ValuesManager.borderWidthThin,
          ),
        ),
        textStyle: StylesManager.getBodyMedium(color: lowStimText),
      ),

      // EXPANSION TILE THEME
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor: lowStimBackground,
        collapsedBackgroundColor: lowStimBackground,
        iconColor: lowStimSubtle,
        collapsedIconColor: lowStimSubtle,
        textColor: lowStimText,
        collapsedTextColor: lowStimText,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusMedium,
        ),
      ),

      // SEARCH BAR THEME
      searchBarTheme: SearchBarThemeData(
        elevation: WidgetStateProperty.all(ValuesManager.elevationNone),
        backgroundColor: WidgetStateProperty.all(lowStimSurface),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: ValuesManager.borderRadiusMedium,
            side: BorderSide(
              color: lowStimSubtle,
              width: ValuesManager.borderWidthThin,
            ),
          ),
        ),
        textStyle: WidgetStateProperty.all(
          StylesManager.getBodyMedium(color: lowStimText),
        ),
        hintStyle: WidgetStateProperty.all(
          StylesManager.getBodyMedium(color: lowStimSubtle),
        ),
      ),

      // SEGMENTED BUTTON THEME
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return lowStimPrimary;
            }
            return lowStimSurface;
          }),
          foregroundColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return lowStimBackground;
            }
            return lowStimText;
          }),
          shape: WidgetStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: ValuesManager.borderRadiusMedium,
            ),
          ),
        ),
      ),
    );
  }

  // ============================================================
  // THEME GETTER BY MODE
  // ============================================================

  /// Get theme by mode enum
  static ThemeData getTheme(SpectraThemeMode mode) {
    switch (mode) {
      case SpectraThemeMode.light:
        return lightTheme;
      case SpectraThemeMode.dark:
        return darkTheme;
      case SpectraThemeMode.lowStimulation:
        return lowStimulationTheme;
      case SpectraThemeMode.calm:
        return _calmTheme;
    }
  }

  /// Calm Mode Theme - Bonus theme using warm neutrals
  /// For transitions or relaxation periods
  static ThemeData get _calmTheme {
    return lightTheme.copyWith(
      colorScheme: ColorsManager.calmColorScheme,
      scaffoldBackgroundColor: ColorsManager.calmModePrimary,
      canvasColor: ColorsManager.calmModePrimary,
      cardTheme: CardThemeData(
        elevation: ValuesManager.elevationLow,
        color: ColorsManager.calmModeSecondary,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: ValuesManager.borderRadiusLarge,
        ),
      ),
      appBarTheme: AppBarTheme(
        elevation: ValuesManager.elevationNone,
        scrolledUnderElevation: ValuesManager.elevationNone,
        centerTitle: true,
        backgroundColor: ColorsManager.calmModePrimary,
        foregroundColor: ColorsManager.darkGreyText,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: StylesManager.getSubHeadline1(
          color: ColorsManager.darkGreyText,
        ),
        iconTheme: IconThemeData(
          color: ColorsManager.darkGreyText,
          size: ValuesManager.iconSizeDefault,
        ),
      ),
    );
  }
}
