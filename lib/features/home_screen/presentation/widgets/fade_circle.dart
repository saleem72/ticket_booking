//

import 'package:flutter/material.dart';

import 'circle_blur_painter.dart';

class FadeCircle extends StatelessWidget {
  const FadeCircle({
    super.key,
    this.width = 300,
    this.height = 300,
    this.blurRadius = 150,
    required this.color,
  });

  final double width;
  final double height;
  final Color color;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: CustomPaint(
        painter: CircleBlurPainter(
          blurRadius: blurRadius,
          color: color,
        ),
        child: const SizedBox.expand(),
      ),
    );
  }
}
