//

import 'dart:ui';

import 'package:flutter/material.dart';

class GlassCard extends StatelessWidget {
  const GlassCard({
    Key? key,
    required this.child,
    this.topMargin = 2,
    this.opacity = 0.2,
    this.sigmaX = 15,
    required this.fill,
  }) : super(key: key);
  final double topMargin;
  final Widget child;
  final double opacity;
  final double sigmaX;
  final Color fill;
  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaX),
      child: Container(
        margin: EdgeInsets.only(top: topMargin),
        child: Stack(
          children: [
            Opacity(
              opacity: 0.2,
              child: Container(
                decoration: BoxDecoration(
                  color: fill,
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
