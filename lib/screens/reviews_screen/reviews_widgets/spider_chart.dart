import 'package:flutter/material.dart';
import 'dart:math';
import 'package:tobeto_mobile_app/utils/constant/constants.dart';

class SpiderChart extends StatefulWidget {
  final List<double> values;

  const SpiderChart({super.key, required this.values});

  @override
  State<SpiderChart> createState() => _SpiderChartState();
}

class _SpiderChartState extends State<SpiderChart>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<Color> colors = [
    TobetoColor.card.lightBrown,
    TobetoColor.card.fuchsia,
    TobetoColor.card.pink,
    TobetoColor.card.darkGreen,
    TobetoColor.card.yellow,
    TobetoColor.card.turquoise,
    TobetoColor.card.peach,
    TobetoColor.card.darkPurple,
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.stop();
        }
      });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: SpiderChartPainter(widget.values, colors, _animation.value),
      size: Size(
        ScreenUtil.getHeight(context) * 0.4,
        ScreenUtil.getHeight(context) * 0.4,
      ),
    );
  }
}

class SpiderChartPainter extends CustomPainter {
  final List<double> values;
  final List<Color> colors;
  final double animationValue;
  final int sides = 8;

  SpiderChartPainter(this.values, this.colors, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = TobetoColor.frame.grey
      ..style = PaintingStyle.stroke;

    final Paint fillPaint = Paint()
      ..color = Colors.grey.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final double radius = min(size.width / 2, size.height / 2) * 0.8;
    final Offset center = Offset(size.width / 2, size.height / 2);

    // Draw the spider web lines
    for (int i = 0; i < sides; i++) {
      final angle = (2 * pi * i) / sides;
      final x = center.dx + radius * cos(angle);
      final y = center.dy + radius * sin(angle);
      canvas.drawLine(center, Offset(x, y), paint);
    }

    // Draw the concentric circles
    for (int i = 1; i <= 5; i++) {
      final r = radius * (i / 5);
      canvas.drawCircle(center, r, paint);
    }

    // Draw the polygon based on values
    final path = Path();
    for (int i = 0; i < sides; i++) {
      final angle = (2 * pi * i) / sides;
      final r = radius * values[i] * animationValue;
      final x = center.dx + r * cos(angle);
      final y = center.dy + r * sin(angle);
      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }

      // Draw the points with different colors
      final pointPaint = Paint()
        ..color = colors[i]
        ..style = PaintingStyle.fill;
      canvas.drawCircle(Offset(x, y), 5, pointPaint);
    }
    path.close();
    canvas.drawPath(path, fillPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
