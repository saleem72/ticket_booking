//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/seat.dart';
import '../theatre_bloc/theatre_bloc.dart';
import 'seat_path.dart';

class SeatView extends StatelessWidget {
  const SeatView(
      {super.key, required this.seat, this.width = 32, this.height = 22});
  final Seat seat;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<TheatreBloc>()
          .add(TheatreEvent.seatWasTapped(seat: seat)),
      child: SizedBox(
        width: width,
        height: height,
        child: CustomPaint(
          painter: SeatPainter(color: seat.status.color),
          child: const SizedBox.expand(),
        ),
      ),
    );
  }
}
