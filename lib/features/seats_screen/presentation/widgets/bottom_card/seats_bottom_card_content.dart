//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/presentation/reservation_bloc/reservation_bloc.dart';
import '../../theatre_bloc/theatre_bloc.dart';
import 'hollow_card_line.dart';

class SeatsBottomCardContent extends StatelessWidget {
  const SeatsBottomCardContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<TheatreBloc, TheatreState>(
      listenWhen: (previous, current) => previous.seats != current.seats,
      listener: (context, state) {
        context
            .read<ReservationBloc>()
            .add(ReservationEvent.updateSeats(seats: state.selectedSeats()));
      },
      child: BlocBuilder<ReservationBloc, ReservationState>(
        builder: (context, state) {
          return _content(context, state);
        },
      ),
    );
  }

  Column _content(BuildContext context, ReservationState state) {
    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HollowCardLine(
          icon: Icons.calendar_month,
          first: DateFormat('MMMM dd, yyyy').format(state.date),
          second: DateFormat('hh:mm a').format(state.date),
        ),
        const SizedBox(height: 30),
        HollowCardLine(
          icon: Icons.grid_view_rounded,
          first: state.section() ?? '',
          second: state.selectedSeats(),
        ),
        const SizedBox(height: 30),
        HollowCardLine(
          icon: Icons.shopping_cart_rounded,
          first: state.total() ?? '',
        ),
      ],
    );
  }
}
