//

import 'package:flutter/material.dart';

class HollowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return _hollowPath(size);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class HollowPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.pink;

    final path = _hollowPath(size);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

Path _hollowPath(Size size) {
  var path = Path();
  final width = size.width;
  final height = size.height;
  path.moveTo(0, 0);
  path.lineTo(1.0 * width, 0);
  path.lineTo(1.0 * width, 0.27546 * height);
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
    0.73075 * height,
  );
  path.lineTo(1.0 * width, 0.72454 * height);
  path.lineTo(1.0 * width, 1.0 * height);
  path.lineTo(0, 1.0 * height);
  path.lineTo(0, 0);
  path.close();
  return path;
}
