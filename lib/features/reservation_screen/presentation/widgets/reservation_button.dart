//

import 'package:flutter/material.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import '../../../../configuration/constants/constants.dart';
import '../../../../core/presentation/widgets/gradient_border.dart';

class ReservationButton extends StatelessWidget {
  const ReservationButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: double.maxFinite,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
          gradient: const LinearGradient(
            end: Alignment(1.1602983117103577, 1.3591668903827667),
            begin: Alignment(-0.3591668903827667, 0.025133831426501274),
            colors: [
              Color(0xFFB6116B),
              Color(0xFF3B1578),
            ],
          ),
        ),
        child: Stack(
          children: [
            RectangleGradientBorder(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFFFF53C0),
                  const Color(0xFFFF53C0).withOpacity(0),
                ],
              ),
              lineWidth: 2,
              radius: 20,
            ),
            Center(
              child: Text(
                'Reservation',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
