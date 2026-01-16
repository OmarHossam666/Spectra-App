import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// Spectra Responsive Helper
/// Modern and efficient responsive utilities using flutter_screenutil
///
/// Design Reference Size: 375 x 812 (iPhone X/XS)
/// This is a common baseline for mobile-first responsive design.
///
/// Usage:
/// - Use .w for width-based scaling
/// - Use .h for height-based scaling
/// - Use .r for radius scaling (uses min of w/h for consistency)
/// - Use .sp for font size scaling (includes text scaling factor)
///
/// Example:
/// ```dart
/// Container(
///   width: 100.w,      // Scales based on screen width
///   height: 50.h,      // Scales based on screen height
///   padding: EdgeInsets.all(16.r),
///   child: Text('Hello', style: TextStyle(fontSize: 16.sp)),
/// )
/// ```
class ResponsiveHelper {
  ResponsiveHelper._();

  /// Design reference width (iPhone X/XS)
  static const double designWidth = 375.0;

  /// Design reference height (iPhone X/XS)
  static const double designHeight = 812.0;

  /// Minimum text scale factor to ensure readability
  static const double minTextScaleFactor = 0.8;

  /// Maximum text scale factor to prevent overflow
  static const double maxTextScaleFactor = 1.3;

  /// Initialize ScreenUtil with design size
  /// Call this in the builder of ScreenUtilInit
  static void init(BuildContext context) {
    ScreenUtil.init(context);
  }

  /// Check if the current device is a tablet
  static bool get isTablet => ScreenUtil().screenWidth > 600;

  /// Check if the current device is in landscape mode
  static bool get isLandscape =>
      ScreenUtil().screenWidth > ScreenUtil().screenHeight;

  /// Get adaptive columns for grid layouts
  static int get gridColumns {
    final width = ScreenUtil().screenWidth;
    if (width >= 1200) return 6;
    if (width >= 900) return 4;
    if (width >= 600) return 3;
    return 2;
  }

  /// Get responsive horizontal padding based on screen width
  static double get horizontalPadding {
    final width = ScreenUtil().screenWidth;
    if (width >= 1200) return 48.w;
    if (width >= 600) return 32.w;
    return 16.w;
  }

  /// Get responsive content max width for large screens
  static double get contentMaxWidth {
    if (isTablet) return 600.w;
    return double.infinity;
  }
}

/// Extension for responsive EdgeInsets
extension ResponsiveEdgeInsets on EdgeInsets {
  /// Convert EdgeInsets to responsive values
  EdgeInsets get r => EdgeInsets.only(
    left: left.r,
    top: top.r,
    right: right.r,
    bottom: bottom.r,
  );

  /// Convert EdgeInsets with width-based horizontal and height-based vertical
  EdgeInsets get responsive => EdgeInsets.only(
    left: left.w,
    top: top.h,
    right: right.w,
    bottom: bottom.h,
  );
}

/// Extension for responsive BorderRadius
extension ResponsiveBorderRadius on BorderRadius {
  /// Convert BorderRadius to responsive values using .r
  BorderRadius get r => BorderRadius.only(
    topLeft: Radius.circular(topLeft.x.r),
    topRight: Radius.circular(topRight.x.r),
    bottomLeft: Radius.circular(bottomLeft.x.r),
    bottomRight: Radius.circular(bottomRight.x.r),
  );
}

/// Extension for responsive Size
extension ResponsiveSize on Size {
  /// Convert Size to responsive values
  Size get r => Size(width.w, height.h);
}

/// Extension for responsive BoxConstraints
extension ResponsiveBoxConstraints on BoxConstraints {
  /// Convert BoxConstraints to responsive values
  BoxConstraints get r => BoxConstraints(
    minWidth: minWidth.w,
    maxWidth: maxWidth.isFinite ? maxWidth.w : double.infinity,
    minHeight: minHeight.h,
    maxHeight: maxHeight.isFinite ? maxHeight.h : double.infinity,
  );
}

/// Responsive spacing widget (vertical)
class VerticalSpace extends StatelessWidget {
  const VerticalSpace(this.height, {super.key});

  final double height;

  @override
  Widget build(BuildContext context) => SizedBox(height: height.h);
}

/// Responsive spacing widget (horizontal)
class HorizontalSpace extends StatelessWidget {
  const HorizontalSpace(this.width, {super.key});

  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(width: width.w);
}
