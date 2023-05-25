//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/core/presentation/widgets/glassy_app_bar.dart';

import 'presentation/theatre_bloc/theatre_bloc.dart';
import 'presentation/widgets/bottom_card/seats_bottom_card.dart';
import 'presentation/widgets/neon_arc.dart';
import 'presentation/widgets/seat_options.dart';
import 'presentation/widgets/theatre_view.dart';

class SeatsScreen extends StatelessWidget {
  const SeatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (context) => TheatreBloc()..add(TheatreEvent.fetch()),
      child: const SeatsScreenContent(),
    );
  }
}

class SeatsScreenContent extends StatelessWidget {
  const SeatsScreenContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2C135C),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SafeArea(
            child: Column(
              children: [
                GlassyAppBar(
                  trailingIcon: Icons.calendar_month,
                  trailingAction: () {},
                  title: 'Choose Seats',
                ),
                const SizedBox(height: 32),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.0),
                  child: NeonArc(),
                ),
                const SizedBox(height: 32),
                const TheatreView(),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 42, vertical: 16),
                  child: SeatOptions(),
                ),
              ],
            ),
          ),
          const SeatsBottomCard()
        ],
      ),
    );
  }
}
