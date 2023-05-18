//

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/theme/colors.dart';

class CircleBlurPainter extends CustomPainter {
  CircleBlurPainter({
    this.blurRadius = 15,
    this.color = Colors.lightBlue,
  });

  final double blurRadius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = color
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius);
    // Offset center = Offset(size.width / 2, size.height / 2);
    // double radius = math.min(size.width / 2, size.height / 2);
    // canvas.drawCircle(center, radius, line);

    // Rect rect = Rect.fromCircle(center: center, radius: radius);

    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    canvas.drawOval(rect, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class RectangleBlurPainter extends CustomPainter {
  RectangleBlurPainter({
    this.blurRadius = 15,
    this.color = Colors.lightBlue,
  });

  final double blurRadius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    Paint line = Paint()
      // ..shader = LinearGradient(
      //   begin: Alignment.topCenter,
      //   end: Alignment.bottomCenter,
      //   colors: [
      //     Colors.white.withOpacity(0.3),
      //     Colors.black.withOpacity(0),
      //   ],
      // ).createShader(rect)
      ..color = Colors.white.withOpacity(0.6)
      ..style = PaintingStyle.fill
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius);

    canvas.drawRect(rect, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CircleGragientBorderPainter extends CustomPainter {
  CircleGragientBorderPainter({
    this.blurRadius = 15,
    this.color = Colors.lightBlue,
  });

  final double blurRadius;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    Rect rect = Rect.fromLTRB(0, 0, size.width, size.height);
    Paint line = Paint()
      // ..shader = LinearGradient(
      //   begin: Alignment(0.6559888124465942, 1.1565858125686646),
      //   end: Alignment(-1.259852647781372, 1.6198104619979858),
      //   colors: [
      //     const Color(0xFF194234).withOpacity(0),
      //     const Color(0xFF60FFCA),
      //   ],
      // ).createShader(rect)
      ..shader = LinearGradient(
        begin: const Alignment(0.1, 0.05),
        end: const Alignment(0.3, 0.2),
        colors: [
          const Color(0xFF60FFCA),
          const Color(0xFF194234).withOpacity(0),
        ],
        // stops: const [0, 0.5],
      ).createShader(rect)
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = math.min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
