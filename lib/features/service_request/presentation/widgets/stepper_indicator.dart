import 'package:flutter/material.dart';

class StepperIndicator extends StatelessWidget {
  final int currentStep;
  final String title;

  const StepperIndicator({
    super.key,
    required this.currentStep,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    double progress = currentStep / 4;

    return Row(
      children: [
        CustomPaint(
          painter: CircleProgressPainter(progress),
          child: Container(
            width: 50,
            height: 50,
            alignment: Alignment.center,
            child: Text(
              '$currentStep',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
      ..color = Colors.grey
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    Paint foreground = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = size.width / 2 - 4;

    canvas.drawCircle(center, radius, background);

    double angle = 2 * 3.141592 * progress;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592 / 2,
      angle,
      false,
      foreground,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
