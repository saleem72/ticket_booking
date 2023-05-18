//

import 'package:flutter/material.dart';

import 'circle_blur_painter.dart';

class GragientBorder extends StatelessWidget {
  const GragientBorder({super.key});

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
