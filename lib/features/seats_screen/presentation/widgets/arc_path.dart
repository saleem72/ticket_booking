//

import 'package:flutter/material.dart';

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    const color = Color(0xFFFF53C0);
    final line = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final path = myPath(size);

    // Paint shadowPaint1 = Paint()
    //   ..color = color
    //   ..style = PaintingStyle.stroke
    //   ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10)
    //   ..strokeWidth = 11;

    // Paint shadowPaint2 = Paint()
    //   ..color = color
    //   ..style = PaintingStyle.stroke
    //   ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 7)
    //   ..strokeWidth = 9;

    Paint shadowPaint3 = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5)
      ..strokeWidth = 6;
    // ;
    // canvas.drawPath(path, shadowPaint1);
    // canvas.drawPath(path, shadowPaint2);
    canvas.drawPath(path, shadowPaint3);
    // canvas.drawShadow(path, Colors.pink.withOpacity(0.3), 3, true);
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  Path myPath(Size size) {
    var path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(0.01023 * width, 0.93315 * height);
    path.cubicTo(
      0.28648 * width,
      -0.22957 * height,
      0.6923 * width,
      -0.17774 * height,
      0.99107 * width,
      0.83756 * height,
    );
    return path;
  }
}
