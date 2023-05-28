//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import '../../../../configuration/assets/app_icons.dart';
import '../../../../configuration/constants/constants.dart';
import '../../../../core/presentation/widgets/glass_card.dart';
import '../../../../core/presentation/widgets/rounded_rect_border_painter.dart';
import '../../../seats_screen/presentation/widgets/clipped_card.dart';

class TicketCard extends StatelessWidget {
  const TicketCard({
    super.key,
    required this.image,
    required this.angle,
  });

  final String image;
  final double angle;

  @override
  Widget build(BuildContext context) {
    final height =
        context.mediaQuery.size.height * AppConstants.clippedCardHeightRatio;
    return Transform.scale(
      scale: angle == 0 ? 1 : AppConstants.clippedCardSmallerScale,
      child: Transform.translate(
        offset: Offset(
            angle > 0
                ? 20
                : angle < 0
                    ? -20
                    : 0,
            0),
        child: Transform.rotate(
          angle: angle,
          child: SizedBox(
            height: height,
            width: height * AppConstants.clippedCardWidthRatio,
            child: ClipPath(
              clipper: ClippedCardClipper(borderRadius: 40),
              child: Stack(
                fit: StackFit.expand,
                alignment: Alignment.bottomCenter,
                children: [
                  _movieImage(),
                  CustomPaint(
                    painter: RoundedRectBorderPainter(
                      gradient: AppConstants.gradientForNormalBorder,
                      lineWidth: 4,
                      radius: 40,
                    ),
                  ),
                  _content(context, height),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column _content(BuildContext context, double height) {
    return Column(
      children: [
        const SizedBox(height: 20),
        _movieDeatils(context),
        const Spacer(),
        _bottomCard(context, height),
      ],
    );
  }

  Padding _movieDeatils(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Doctor Strange",
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.87),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "in the Multiverse of Madness",
            style: context.textTheme.bodyLarge?.copyWith(
              color: Colors.white.withOpacity(0.65),
              fontSize: 13,
              fontWeight: FontWeight.normal,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _bottomCard(BuildContext context, double height) {
    return ClipRect(
      child: Container(
        height: height * AppConstants.clippedCardBarcodeRatio,
        alignment: Alignment.bottomCenter,
        child: Container(
          height: height * AppConstants.clippedCardBarcodeRatio,
          alignment: Alignment.bottomCenter,
          child: GlassCard(
            sigmaX: 40,
            fill: Colors.white.withOpacity(0.8),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BarcodeCardInfoLine(
                        label: 'Date: ',
                        value: 'April 23',
                      ),
                      BarcodeCardInfoLine(
                        label: 'Time: ',
                        value: '6 p.m.',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      BarcodeCardInfoLine(
                        label: 'Row: ',
                        value: '2',
                      ),
                      BarcodeCardInfoLine(
                        label: 'Seats: ',
                        value: '9 , 10',
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Container(
                      color: Colors.pink,
                      alignment: Alignment.center,
                      child: Image.asset(
                        AppImages.barcode,
                        fit: BoxFit.fill,
                        width: double.maxFinite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _movieImage() {
    return Image.asset(
      image,
      fit: BoxFit.cover,
    );
  }
}

class BarcodeCardInfoLine extends StatelessWidget {
  const BarcodeCardInfoLine({
    super.key,
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      // Time: 6 p.m.
      children: [
        Text(
          label,
          style: context.textTheme.bodyMedium?.copyWith(
            color: const Color(0xFF56147A),
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
        Text(
          value,
          style: context.textTheme.bodyMedium?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
