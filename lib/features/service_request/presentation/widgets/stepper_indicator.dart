import 'package:flutter/material.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/theme/styles_manager.dart';
import 'package:home_services_app/core/utils/app_strings.dart';
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
    double progress = currentStep / totalSteps;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Row(
      children: [
        CustomPaint(
          painter: CircleProgressPainter(progress),
          child: Container(
            width:screenHeight* AppSize.s0_148,
            height: screenHeight* AppSize.s0_148,
            alignment: Alignment.center,
            child: Text(
              '$currentStep of $totalSteps',
              style: getBoldStyle(color: AppColors.black,fontSize: screenWidth * AppSize.s0_06)
            ),
          ),
        ),
        SizedBox(width: screenWidth* AppSize. s0_03,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: getBoldStyle(color: AppColors.black,fontSize: screenWidth * AppSize.s0_049),
            ),
            const SizedBox(height:AppSize.s10),
            Text(
              AppStrings.nextPage + nextTitle,
              style: getBoldStyle(color: AppColors.darkGrey,fontSize:screenWidth * AppSize.s0_035),
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

    double radius = (size.width / 2) - AppSize.s4;
    Offset center = Offset(size.width / 2, size.height / 2);


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
