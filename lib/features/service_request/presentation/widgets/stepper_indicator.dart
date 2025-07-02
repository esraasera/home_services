import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_services_app/core/theme/app_colors.dart';
import 'package:home_services_app/core/values/app_values.dart';
import 'package:home_services_app/features/service_request/presentation/controller/cubit/settings_cubit.dart';
import 'package:home_services_app/features/service_request/presentation/controller/states/settings_states.dart';

String getLocalizedNumber(int number) {
  return 'numbers.${number}'.tr();
}

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

    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, state) {
        var cubit = SettingsCubit.get(context);
        return Row(
          children: [
            CustomPaint(
              painter: CircleProgressPainter(progress, cubit.isDark),
              child: Container(
                width: AppSize.s0_148.sh,
                height: AppSize.s0_148.sh,
                alignment: Alignment.center,
                child: Text(
                  '${getLocalizedNumber(currentStep)} ${"of".tr()} ${getLocalizedNumber(totalSteps)}',
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: AppSize.s0_06.sw,
                  ),
                ),
              ),
            ),
            SizedBox(width: AppSize.s0_03.sw),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: AppSize.s0_06.sw,
                  ),
                ),
                SizedBox(height: AppSize.s4.h),
                if (nextTitle.isNotEmpty)
                  Text(
                    "nextPage".tr() + nextTitle,
                    style: Theme.of(context).textTheme.displayLarge!.copyWith(
                      fontSize: AppSize.s0_045.sw,
                      color: cubit.isDark ? AppColors.lightPrimary : AppColors.primary,
                    ),
                  ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  final double progress;
  final bool isDark;

  CircleProgressPainter(this.progress, this.isDark);

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()
      ..color = isDark ? Colors.white : AppColors.grey
      ..strokeWidth = AppSize.s8
      ..style = PaintingStyle.stroke;

    Paint foreground = Paint()
      ..color = AppColors.primary
      ..strokeWidth = AppSize.s8
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
