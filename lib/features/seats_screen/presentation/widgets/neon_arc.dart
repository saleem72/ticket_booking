//

import 'package:flutter/material.dart';

import 'arc_path.dart';

class NeonArc extends StatelessWidget {
  const NeonArc({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: CustomPaint(
        painter: ArcPainter(),
        child: const SizedBox.expand(),
      ),
    );
  }
}
