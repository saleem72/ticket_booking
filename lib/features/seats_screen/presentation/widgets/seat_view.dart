//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/models/seat.dart';
import '../theatre_bloc/theatre_bloc.dart';
import 'seat_path.dart';

class SeatView extends StatefulWidget {
  const SeatView(
      {super.key, required this.seat, this.width = 32, this.height = 22});
  final Seat seat;
  final double width;
  final double height;

  @override
  State<SeatView> createState() => _SeatViewState();
}

class _SeatViewState extends State<SeatView>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _initAnimation();
  }

  _initAnimation() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..addListener(() {
        if (_controller.status == AnimationStatus.completed) {
          _controller.reverse();
        }
      });

    _scale = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.ease,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant SeatView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.seat != oldWidget.seat) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context
          .read<TheatreBloc>()
          .add(TheatreEvent.seatWasTapped(seat: widget.seat)),
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.scale(
            scale: _scale.value,
            child: child,
          );
        },
        child: _child(),
      ),
    );
  }

  SizedBox _child() {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: CustomPaint(
        painter: SeatPainter(color: widget.seat.status.color),
        child: const SizedBox.expand(),
      ),
    );
  }
}
