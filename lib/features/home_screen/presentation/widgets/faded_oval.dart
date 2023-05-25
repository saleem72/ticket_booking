//

import 'package:flutter/material.dart';

import '../../../../configuration/constants/constants.dart';
import 'fade_circle.dart';

class FadedOval extends StatelessWidget {
  const FadedOval({
    super.key,
    required this.color,
    this.alignment,
    required this.offset,
    required this.blurRadius,
    this.height = 231,
  });

  final Color color;
  final AlignmentGeometry? alignment;
  final Offset offset;
  final double height;
  final double blurRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.bottomTabBarHeight,
      alignment: alignment,
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      clipBehavior: Clip.hardEdge,
      child: FittedBox(
        // height: AppConstants.bottomTabBarHeight,
        // width: double.maxFinite,
        fit: BoxFit.none,
        child: Transform.translate(
          offset: offset,
          child: FadeCircle(
            width: 200,
            height: height,
            color: color.withOpacity(0.6),
            blurRadius: blurRadius,
          ),
        ),
      ),
    );
  }
}
