//

import 'package:flutter/material.dart';

import '../../../../../configuration/constants/constants.dart';
import '../faded_oval.dart';
import '../../../../../core/presentation/widgets/glass_card.dart';

class BottomBarBackground extends StatelessWidget {
  const BottomBarBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.bottomTabBarHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _bg(),
          _base(),
        ],
      ),
    );
  }

  Widget _base() {
    return Container(
      height: AppConstants.bottomTabBarHeight,
      width: double.maxFinite,
      decoration: const BoxDecoration(),
      clipBehavior: Clip.hardEdge,
      child: GlassCard(
        fill: Colors.white.withOpacity(0.6),
        child: Container(),
      ),
    );
  }

  Widget _bg() {
    return SizedBox(
      height: AppConstants.bottomTabBarHeight,
      child: Stack(
        children: const [
          FadedOval(
            color: Color(0xFFFF53C0),
            alignment: Alignment.bottomRight,
            offset: Offset(0, 90),
            blurRadius: 50,
          ),
          FadedOval(
            color: Color(0xFF5172B3),
            alignment: Alignment.bottomCenter,
            offset: Offset(0, 90),
            blurRadius: 50,
          ),
          FadedOval(
            color: Color(0xFF3B1578),
            alignment: Alignment.bottomLeft,
            offset: Offset(0, 0),
            blurRadius: 50,
          ),
        ],
      ),
    );
  }
}
