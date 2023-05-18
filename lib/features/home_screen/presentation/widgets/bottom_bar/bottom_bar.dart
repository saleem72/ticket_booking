//

import 'package:flutter/material.dart';

import '../../../../../configuration/constants/constants.dart';
import '../../../domain/models/bottom_bar_item.dart';
import '../bottom_bar_active_button.dart';
import 'bottom_bar_background.dart';
import 'bottom_bar_button.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppConstants.bottomTabBarHeight,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          const BottomBarBackground(),
          SizedBox(
            height: AppConstants.bottomTabBarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...BottomBarItem.values.map((e) => BottomBarButton(item: e)),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Transform.translate(
              offset: const Offset(0, -16),
              child: const BottomBarActiveButton(),
            ),
          ),
        ],
      ),
    );
  }
}
