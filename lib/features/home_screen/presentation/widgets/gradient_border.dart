//

import 'package:flutter/material.dart';

import 'circle_blur_painter.dart';

class CircularGradientBorder extends StatelessWidget {
  const CircularGradientBorder({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CircleBlurPainter(
              color: Colors.white.withOpacity(0.15), blurRadius: 100),
          child: const SizedBox.expand(),
        ),
        CustomPaint(
          painter: CircleGragientBorderPainter(),
          child: const SizedBox.expand(),
        ),
      ],
    );
  }
}

class RectangleGradientBorder extends StatelessWidget {
  const RectangleGradientBorder({
    super.key,
    required this.gradient,
    required this.lineWidth,
    required this.radius,
  });
  final LinearGradient gradient;
  final double lineWidth;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          painter: CircleBlurPainter(
              color: Colors.white.withOpacity(0.15), blurRadius: 100),
          child: const SizedBox.expand(),
        ),
        CustomPaint(
          painter: RectangleGragientBorderPainter(
            gradient: gradient,
            lineWidth: lineWidth,
            radius: radius,
          ),
          child: const SizedBox.expand(),
        ),
      ],
    );
  }
}
