//

import 'package:flutter/material.dart';

class DotView extends StatelessWidget {
  const DotView({
    super.key,
    this.width = 6,
    this.height = 6,
    this.color = Colors.white,
  });

  final double width;
  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: width,
      width: height,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
