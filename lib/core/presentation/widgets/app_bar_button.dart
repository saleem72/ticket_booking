//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import 'glass_card.dart';
import 'gradient_border.dart';

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.width = 44,
    this.height = 44,
    this.label,
  });
  final VoidCallback onPressed;
  final IconData icon;
  final double width;
  final double height;
  final String? label;
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
            GlassCard(
              sigmaX: 5,
              fill: Colors.white.withOpacity(0.6),
              child: const CircularGradientBorder(),
            ),
            label == null
                ? Center(
                    child: Icon(
                      icon,
                      color: Colors.white,
                    ),
                  )
                : Center(
                    child: Text(
                      label!,
                      style: context.textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  )
          ],
        ),
      ),
    );
  }
}
