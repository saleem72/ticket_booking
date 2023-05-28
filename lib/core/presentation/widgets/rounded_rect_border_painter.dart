//

import 'package:flutter/material.dart';

class RoundedRectBorderPainter extends CustomPainter {
  RoundedRectBorderPainter({
    required this.gradient,
    required this.lineWidth,
    required this.radius,
  });

  final LinearGradient gradient;
  final double lineWidth;
  final double radius;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(
      0 + lineWidth / 2,
      0 + lineWidth / 2,
      size.width - lineWidth / 2,
      size.height - lineWidth / 2,
    );
    Paint line = Paint()
      ..shader = gradient.createShader(rect)
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.stroke;
    final path = _roundedRectPath(size, radius);
    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

  Path _roundedRectPath(Size size, double radius) {
    var path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(0, radius);

    path.quadraticBezierTo(
      0,
      0,
      radius,
      0,
    );

    path.lineTo(width - radius, 0);
    path.quadraticBezierTo(
      width,
      0,
      width,
      radius,
    );

    path.lineTo(width, height - radius);
    path.quadraticBezierTo(
      width,
      height,
      width - radius,
      1.0 * height,
    );
    path.lineTo(radius, 1.0 * height);
    path.quadraticBezierTo(
      0,
      1.0 * height,
      0,
      height - radius,
    );
    path.lineTo(0, radius);

    path.close();
    return path;
  }
}
