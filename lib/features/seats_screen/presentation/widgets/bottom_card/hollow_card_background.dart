//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';
import 'package:ticket_booking/features/seats_screen/presentation/widgets/bottom_card/hollow_border_painter.dart';

import '../../../../../core/presentation/widgets/glass_card.dart';
import '../../../../home_screen/presentation/widgets/fade_circle.dart';
import 'hollow_path.dart';

class HollowCardBackground extends StatelessWidget {
  const HollowCardBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Stack(
        children: [
          _bg(context),
          _glassy(),
          CustomPaint(
            painter: HollowBorderPainter(
              color: Colors.white.withOpacity(0.3),
            ),
            child: const SizedBox.expand(),
          ),
        ],
      ),
    );
  }

  ClipPath _glassy() {
    return ClipPath(
      clipper: HollowClipper(),
      child: GlassCard(
        fill: Colors.white.withOpacity(0.6),
        sigmaX: 100,
        child: Container(),
      ),
    );
  }

  /*

          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        
  */

  ClipPath _bg(BuildContext context) {
    return ClipPath(
      clipper: HollowClipper(),
      child: const SeatsBackground(),
    );
  }
}

class SeatsBackground extends StatelessWidget {
  const SeatsBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: HollowClipper(),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: Transform.translate(
              offset: const Offset(50, 140),
              child: FittedBox(
                fit: BoxFit.none,
                child: FadeCircle(
                  width: context.mediaQuery.size.width / 2,
                  height: context.mediaQuery.size.width * 0.57,
                  color: const Color(0xFFFF53C0).withOpacity(0.6),
                  blurRadius: 100,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Transform.translate(
              offset: const Offset(0, 140),
              child: FittedBox(
                fit: BoxFit.none,
                child: FadeCircle(
                  width: context.mediaQuery.size.width / 2,
                  height: context.mediaQuery.size.width * 0.57,
                  color: const Color(0xFF5172B3).withOpacity(0.8),
                  blurRadius: 100,
                ),
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(0, 0),
            child: FittedBox(
              fit: BoxFit.none,
              child: FadeCircle(
                width: context.mediaQuery.size.width / 2,
                height: context.mediaQuery.size.width * 0.57,
                color: const Color(0xFF3B1578),
                blurRadius: 100,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
