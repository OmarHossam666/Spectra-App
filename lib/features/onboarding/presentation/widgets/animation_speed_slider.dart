import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:spectra/core/constants/colors_manager.dart';
import 'package:spectra/core/constants/strings_manager.dart';
import 'package:spectra/core/constants/styles_manager.dart';
import 'package:spectra/core/constants/values_manager.dart';

/// Animation speed slider with emoji indicators (turtle to rabbit)
class AnimationSpeedSlider extends StatelessWidget {
  const AnimationSpeedSlider({
    super.key,
    required this.value,
    required this.onChanged,
  });

  /// Value between 0.0 (slowest) and 1.0 (fastest)
  final double value;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final backgroundColor = isDark
        ? ColorsManager.darkGreySurface
        : Colors.white;
    final borderColor = isDark
        ? ColorsManager.darkGreySurface
        : ColorsManager.lightGrey;

    return Container(
      padding: EdgeInsets.all(ValuesManager.spaceLarge.r),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(ValuesManager.radiusLarge.r),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4.r,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            StringsManager.animationSpeedLabel,
            style: StylesManager.getSubHeadline2(
              color: isDark ? ColorsManager.cream : ColorsManager.darkGreyText,
            ),
          ),
          SizedBox(height: ValuesManager.spaceLarge.h),
          Row(
            children: [
              // Turtle emoji (slow)
              Opacity(
                opacity: value < 0.5 ? 1.0 : 0.5,
                child: Text(
                  StringsManager.emojiTurtle,
                  style: TextStyle(fontSize: 32.sp),
                ),
              ),
              SizedBox(width: ValuesManager.spaceDefault.w),
              // Slider
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    trackHeight: ValuesManager.sliderTrackHeight.h,
                    activeTrackColor: ColorsManager.communicationBlue,
                    inactiveTrackColor: isDark
                        ? ColorsManager.focusState.withValues(alpha: 0.3)
                        : ColorsManager.lightGrey,
                    thumbColor: Colors.white,
                    overlayColor: ColorsManager.communicationBlue.withValues(
                      alpha: 0.2,
                    ),
                    thumbShape: _CustomThumbShape(),
                  ),
                  child: Slider(value: value, onChanged: onChanged),
                ),
              ),
              SizedBox(width: ValuesManager.spaceDefault.w),
              // Rabbit emoji (fast)
              Opacity(
                opacity: value > 0.5 ? 1.0 : 0.5,
                child: Text(
                  StringsManager.emojiRabbit,
                  style: TextStyle(fontSize: 32.sp),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CustomThumbShape extends SliderComponentShape {
  _CustomThumbShape();

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size(40.r, 40.r);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final canvas = context.canvas;
    final thumbRadius = 18.r;

    // Shadow
    final shadowPaint = Paint()
      ..color = Colors.black.withValues(alpha: 0.15)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 4.r);
    canvas.drawCircle(center + Offset(0, 2.h), thumbRadius, shadowPaint);

    // White circle
    final thumbPaint = Paint()..color = Colors.white;
    canvas.drawCircle(center, thumbRadius, thumbPaint);

    // Border
    final borderPaint = Paint()
      ..color = ColorsManager.communicationBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.r;
    canvas.drawCircle(center, thumbRadius, borderPaint);
  }
}
