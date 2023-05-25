//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/configuration/constants/constants.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';

import '../../domain/models/theatre_layer.dart';
import '../../domain/models/theatre_row.dart';
import '../../domain/models/theatre_section.dart';
import '../theatre_bloc/theatre_bloc.dart';
import 'seat_view.dart';

class TheatreView extends StatelessWidget {
  const TheatreView({
    super.key,
  });

  double getSeatWidth(BuildContext context, int maxSeats) {
    final totalWidth = context.mediaQuery.size.width;

    final totalGaps = (maxSeats - 1) * AppConstants.theatreGap +
        (AppConstants.theatrePadding * 2);
    final width = (totalWidth - totalGaps) / maxSeats;
    return width;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TheatreBloc, TheatreState>(
      // buildWhen: (previous, current) => ,
      builder: (context, state) {
        final seatWidth = getSeatWidth(context, state.maxSeats);
        return SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              // ...state.sections.map((e) => TheatreSectionView(section: e)),
              for (int i = 0; i < state.layers.length; i++)
                Column(
                  children: [
                    TheatreLayerView(
                        layer: state.layers[i], seatWidth: seatWidth),
                    if (i != state.layers.length - 1) const SizedBox(height: 8),
                  ],
                ),
            ],
          ),
        );
      },
    );
  }
}

class TheatreLayerView extends StatelessWidget {
  const TheatreLayerView({
    super.key,
    required this.layer,
    required this.seatWidth,
  });
  final TheatreLayer layer;
  final double seatWidth;
  @override
  Widget build(BuildContext context) {
    return layer.sections.length == 1
        ? TheatreSectionView(section: layer.sections[0], seatWidth: seatWidth)
        : Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.theatrePadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                // ...layer.sections.map((e) => TheatreSectionView(section: e)),
                for (int i = 0; i < layer.sections.length; i++)
                  Row(
                    children: [
                      TheatreSectionView(
                          section: layer.sections[i], seatWidth: seatWidth),
                      if (i != layer.sections.length - 1)
                        const SizedBox(width: 8),
                    ],
                  ),
              ],
            ),
          );
  }
}

class TheatreSectionView extends StatelessWidget {
  const TheatreSectionView({
    super.key,
    required this.section,
    required this.seatWidth,
  });
  final double seatWidth;
  final TheatreSection section;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < section.rows.length; i++)
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SectionRowView(row: section.rows[i], seatWidth: seatWidth),
              if (i != section.rows.length - 1) const SizedBox(height: 8),
            ],
          ),
      ],
    );
  }
}

class SectionRowView extends StatelessWidget {
  const SectionRowView({
    super.key,
    required this.row,
    required this.seatWidth,
  });

  final TheatreRow row;
  final double seatWidth;

  @override
  Widget build(BuildContext context) {
    final seatHeight = seatWidth * AppConstants.seatRatio;

    return BlocBuilder<TheatreBloc, TheatreState>(
      builder: (context, state) {
        final seats = state.seatsForRow(row.id);
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            for (int i = 0; i < seats.length; i++)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SeatView(
                    seat: seats[i],
                    width: seatWidth,
                    height: seatHeight,
                  ),
                  if (i != seats.length - 1) const SizedBox(width: 4),
                ],
              )
          ],
        );
      },
    );
  }
}
