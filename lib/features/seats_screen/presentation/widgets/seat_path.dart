//

import 'package:flutter/material.dart';

class SeatPainter extends CustomPainter {
  SeatPainter({
    required Color color,
  }) : filler = Paint()..color = color;

  final Paint filler;
  @override
  void paint(Canvas canvas, Size size) {
    final sround = _srouund(size);
    final core = _core(size);
    canvas.drawPath(core, filler);
    canvas.drawPath(sround, filler);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  Path _core(Size size) {
    var path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(0.23333 * width, 0.13644 * height);
    path.cubicTo(
      0.23333 * width,
      0.0644 * height,
      0.27811 * width,
      0.006 * height,
      0.33333 * width,
      0.006 * height,
    );
    path.lineTo(0.66667 * width, 0.006 * height);
    path.cubicTo(
      0.7219 * width,
      0.006 * height,
      0.76667 * width,
      0.0644 * height,
      0.76667 * width,
      0.13644 * height,
    );
    path.lineTo(0.76667 * width, 0.6147 * height);
    path.cubicTo(
      0.76667 * width,
      0.63871 * height,
      0.75174 * width,
      0.65818 * height,
      0.73333 * width,
      0.65818 * height,
    );
    path.lineTo(0.26667 * width, 0.65818 * height);
    path.cubicTo(
      0.24826 * width,
      0.65818 * height,
      0.23333 * width,
      0.63871 * height,
      0.23333 * width,
      0.6147 * height,
    );
    path.lineTo(0.23333 * width, 0.13644 * height);
    path.close();
    return path;
  }

  Path _srouund(Size size) {
    var path = Path();
    final width = size.width;
    final height = size.height;
    path.moveTo(0, 0.17992 * height);
    path.cubicTo(
      0,
      0.13189 * height,
      0.02985 * width,
      0.09296 * height,
      0.06667 * width,
      0.09296 * height,
    );
    path.lineTo(0.13333 * width, 0.09296 * height);
    path.cubicTo(
      0.17015 * width,
      0.09296 * height,
      0.2 * width,
      0.13189 * height,
      0.2 * width,
      0.17992 * height,
    );
    path.lineTo(0.2 * width, 0.6147 * height);
    path.cubicTo(
      0.2 * width,
      0.66272 * height,
      0.22985 * width,
      0.70166 * height,
      0.26667 * width,
      0.70166 * height,
    );
    path.lineTo(0.73333 * width, 0.70166 * height);
    path.cubicTo(
      0.77015 * width,
      0.70166 * height,
      0.8 * width,
      0.66272 * height,
      0.8 * width,
      0.6147 * height,
    );
    path.lineTo(0.8 * width, 0.17992 * height);
    path.cubicTo(
      0.8 * width,
      0.13189 * height,
      0.82985 * width,
      0.09296 * height,
      0.86667 * width,
      0.09296 * height,
    );
    path.lineTo(0.93333 * width, 0.09296 * height);
    path.cubicTo(
      0.97015 * width,
      0.09296 * height,
      1.0 * width,
      0.13189 * height,
      1.0 * width,
      0.17992 * height,
    );
    path.lineTo(1.0 * width, 0.74513 * height);
    path.cubicTo(
      1.0 * width,
      0.8652 * height,
      0.92538 * width,
      0.96253 * height,
      0.83333 * width,
      0.96253 * height,
    );
    path.lineTo(0.16667 * width, 0.96253 * height);
    path.cubicTo(
      0.07462 * width,
      0.96253 * height,
      0,
      0.8652 * height,
      0,
      0.74513 * height,
    );
    path.lineTo(0, 0.17992 * height);
    path.close();
    return path;
  }
}
