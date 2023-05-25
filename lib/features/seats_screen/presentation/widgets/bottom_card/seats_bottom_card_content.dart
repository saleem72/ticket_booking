//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/presentation/reservation_bloc/reservation_bloc.dart';
import 'hollow_card_line.dart';

class SeatsBottomCardContent extends StatelessWidget {
  const SeatsBottomCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final date = context
        .select<ReservationBloc, ReservationState>((value) => value.state)
        .date;
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HollowCardLine(
          icon: Icons.calendar_month,
          first: DateFormat('MMMM dd, yyyy').format(date),
          second: DateFormat('hh:mm a').format(date),
        ),
        const SizedBox(height: 30),
        const HollowCardLine(
          icon: Icons.grid_view_rounded,
          first: 'VIP Section',
          second: 'Seat 9 ,10',
        ),
        const SizedBox(height: 30),
        const HollowCardLine(
          icon: Icons.shopping_cart_rounded,
          first: 'Total: \$30',
        ),
      ],
    );
  }
}
