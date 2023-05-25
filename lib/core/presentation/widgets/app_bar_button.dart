//

import 'package:flutter/material.dart';

import 'glass_card.dart';
import 'gradient_border.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.width = 44,
    this.height = 44,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            GalssCard(
              sigmaX: 5,
              fill: Colors.white.withOpacity(0.6),
              child: const CircularGradientBorder(),
            ),
            Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
