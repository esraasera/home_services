import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_string.dart';
import 'package:home_services_app/core/values/app_values.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep;
  final String title;
  final String nextTitle;
  final int totalSteps;

  const StepperIndicator({
    super.key,
    required this.currentStep,
    required this.title,
    required this.nextTitle,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / AppSize.s4;

    return Row(
      children: [
        CustomPaint(
          painter: CircleProgressPainter(progress),
          child: Container(
            width: AppSize.s100,
            height:  AppSize.s100,
            alignment: Alignment.center,
            child: Text(
              '$currentStep of $totalSteps',
              style: getBoldStyle(color: AppColors.black,fontSize:AppSize.s18)
            ),
          ),
        ),
        const SizedBox(width:AppSize.s10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: getBoldStyle(color: AppColors.black,fontSize: AppSize.s18),
            ),
            const SizedBox(height:AppSize.s10),
            Text(
              AppStrings.next + nextTitle,
              style: getBoldStyle(color: AppColors.grey,fontSize: AppSize.s12),
            ),
          ],
        ),
      ],
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;

  CircleProgressPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()
      ..color = AppColors.grey
      ..strokeWidth = AppSize.s8
      ..style = PaintingStyle.stroke;

    Paint foreground = Paint()
      ..color = AppColors.primary
      ..strokeWidth =AppSize.s8
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / AppSize.s2, size.height / AppSize.s2);
    double radius = size.width / AppSize.s2 - AppSize.s4;

    canvas.drawCircle(center, radius, background);

    double angle = AppSize.sAngle * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      AppSize.sDrawArc,
      angle,
      false,
      foreground,
    );
  }
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
