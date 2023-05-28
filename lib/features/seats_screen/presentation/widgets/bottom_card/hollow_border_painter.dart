//

import 'package:flutter/material.dart';

class HollowBorderPainter extends CustomPainter {
  final Paint line;

  HollowBorderPainter({
    required Color color,
    double lineWidth = 1,
  }) : line = Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = lineWidth;
  @override
  void paint(Canvas canvas, Size size) {
    final path = _hollowPath(size);
    final upperLine = _uppperLine(size);

    canvas.drawPath(path, line);
    canvas.drawPath(upperLine, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Path _uppperLine(Size size) {
    var path = Path();
    final width = size.width;
    path.moveTo(0, 2);
    path.lineTo(width, 2);
    path.close();
    return path;
  }

  Path _hollowPath(Size size) {
    var path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(1.0 * width, 0.27546 * height);
    path.lineTo(0.86282 * width, 0.27546 * height);
    path.cubicTo(
      0.79202 * width,
      0.27546 * height,
      0.73462 * width,
      0.3791 * height,
      0.73462 * width,
      0.50694 * height,
    );
    path.lineTo(0.73462 * width, 0.51389 * height);
    path.cubicTo(
      0.73462 * width,
      0.63574 * height,
      0.79019 * width,
      0.73369 * height,
      0.85766 * width,
      0.72454 * height,
    );
    // path.lineTo(0.95 * width, 0.72454 * height);
    path.lineTo(1.0 * width, 0.72454 * height);

    // reverse
    path.lineTo(0.85766 * width, 0.72454 * height);
    path.cubicTo(
      0.79019 * width,
      0.73369 * height,
      0.73462 * width,
      0.63574 * height,
      0.73462 * width,
      0.51389 * height,
    );
    path.lineTo(0.73462 * width, 0.50694 * height);

    // path.lineTo(0.86282 * width, 0.27546 * height);
    path.cubicTo(0.73462 * width, 0.3791 * height, 0.79202 * width,
        0.27546 * height, 0.86282 * width, 0.27546 * height);

    path.close();
    return path;
  }
}
