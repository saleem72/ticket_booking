//

import 'dart:ui';

import 'package:flutter/material.dart';

class GalssCard extends StatelessWidget {
  const GalssCard({
    Key? key,
    required this.child,
    this.topMargin = 2,
    this.opacity = 0.2,
    this.sigmaX = 15,
  }) : super(key: key);
  final double topMargin;
  final Widget child;
  final double opacity;
  final double sigmaX;
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
                  color: Colors.white.withOpacity(0.6),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }

  // Add optinal shadow behind the card
  List<BoxShadow> _shadows() => const [
        BoxShadow(
          color: Colors.white,
          blurRadius: 1,
          spreadRadius: 1,
        )
      ];
}
