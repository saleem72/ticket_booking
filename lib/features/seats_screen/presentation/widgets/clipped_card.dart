//

import 'package:flutter/material.dart';

class ClippedCardClipper extends CustomClipper<Path> {
  final double borderRadius;
  ClippedCardClipper({
    required this.borderRadius,
  });
  @override
  Path getClip(Size size) {
    return _clippedCardPath(size, borderRadius);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClippedCard extends CustomPainter {
  final Color color;
  final PaintingStyle style;
  final double strokeWidth;
  final double borderRadius;

  ClippedCard({
    this.color = Colors.white,
    this.style = PaintingStyle.stroke,
    this.strokeWidth = 1,
    required this.borderRadius,
  });
  @override
  void paint(Canvas canvas, Size size) {
    final path = _clippedCardPath(size, borderRadius);
    final line = Paint()
      ..color = color
      ..style = style
      ..strokeWidth = strokeWidth;

    canvas.drawPath(path, line);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

Path _clippedCardPath(Size size, double radius) {
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

  path.lineTo(0.99675 * width, 0.65 * height);
  path.cubicTo(
    0.94173 * width,
    0.65 * height,
    0.89714 * width,
    0.67433 * height,
    0.89714 * width,
    0.70435 * height,
  );
  path.cubicTo(
    0.89714 * width,
    0.73436 * height,
    0.94173 * width,
    0.7587 * height,
    0.99675 * width,
    0.7587 * height,
  );
  // path.lineTo(0.99675 * width, 0.93478 * height);
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
  path.lineTo(0.00073 * width, 0.7587 * height);
  path.cubicTo(
    0.05574 * width,
    0.7587 * height,
    0.10033 * width,
    0.73436 * height,
    0.10033 * width,
    0.70435 * height,
  );
  path.cubicTo(
    0.10033 * width,
    0.67433 * height,
    0.05574 * width,
    0.65 * height,
    0.00073 * width,
    0.65 * height,
  );
  path.lineTo(0, radius);

  path.close();
  return path;
}
