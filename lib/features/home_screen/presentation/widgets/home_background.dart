//

import 'package:flutter/material.dart';

import '../../../../configuration/theme/colors.dart';
import 'fade_circle.dart';

class HomeBackground extends StatelessWidget {
  const HomeBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.background,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Transform.translate(
              offset: const Offset(150, 150),
              child:
                  FadeCircle(color: const Color(0xFFFF53C0).withOpacity(0.25)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.translate(
              offset: const Offset(-150, 0),
              child: FadeCircle(
                color: const Color(0xFF60FFCA).withOpacity(0.2),
                blurRadius: 200,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
