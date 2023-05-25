//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/configuration/constants/constants.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';
import 'package:ticket_booking/configuration/routing/app_screens.dart';
import 'package:ticket_booking/core/domain/models/movie.dart';
import 'package:ticket_booking/core/domain/models/movie_time.dart';
import 'package:ticket_booking/core/presentation/reservation_bloc/reservation_bloc.dart';
import 'package:ticket_booking/core/presentation/widgets/glass_card.dart';

import '../../core/presentation/widgets/glassy_app_bar.dart';
import '../../core/presentation/widgets/gradient_border.dart';
import 'presentation/widgets/movie_full_image.dart';
import 'presentation/widgets/reservation_button.dart';
import 'presentation/widgets/resizable_list.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({
    super.key,
    required this.movie,
  });
  final Movie movie;
  @override
  Widget build(BuildContext context) {
    final items = [0, 1, 2, 3, 4, 5]
        .map<DateTime>((e) => DateTime.now().add(Duration(days: e)))
        .toList();
    const List<MovieTime> times = [
      MovieTime(hour: 2, minutes: 30),
      MovieTime(hour: 4, minutes: 30),
      MovieTime(hour: 6, minutes: 30),
      MovieTime(hour: 8, minutes: 30),
      MovieTime(hour: 10, minutes: 30),
    ];
    final totalWidth = context.mediaQuery.size.width;
    final itemWidth = (totalWidth - 120) / 5.4;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          SizedBox(
            height: context.mediaQuery.size.height * 0.6,
            child: Stack(
              fit: StackFit.expand,
              children: [
                if (movie.posterPathHighResURLString != null)
                  MovieFullImage(url: movie.posterPathHighResURLString!),
                // MoviesDetialsUI(movie: movie),
                GlassyAppBar(
                  trailingAction: () {},
                  trailingIcon: Icons.more_vert,
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                movie.title ?? '',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                movie.subtitle ?? '',
                style: context.textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Text(
                  movie.overview ?? '',
                  style: context.textTheme.titleSmall?.copyWith(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Select date and time',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 240,
                child: Stack(
                  children: [
                    _daysSelector(context, itemWidth, items),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: _timeSelector(context, itemWidth, times),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingLarge),
                child: ReservationButton(
                  onPressed: () =>
                      context.navigator.pushNamed(AppScreens.chooseSeats),
                ),
              ),
              const SizedBox(height: 46),
            ],
          ),
        ],
      ),
    );
  }

  ResizableList _timeSelector(
      BuildContext context, double itemWidth, List<MovieTime> items) {
    return ResizableList(
      totalWidth: MediaQuery.of(context).size.width,
      height: 100,
      itemSize: itemWidth,
      itemCount: items.length,
      minHeight: 40,
      maxHeight: 40,
      itemBuilder: (context, index) {
        return Center(
          child: Text(
            items[index].label,
            style: context.textTheme.titleSmall?.copyWith(
              color: Colors.white,
            ),
          ),
        );
      },
      onItemFocus: (idx) {
        final time = items[idx];
        context.read<ReservationBloc>().add(
            ReservationEvent.setTime(hour: time.hour, minutes: time.minutes));
      },
    );
  }

  ResizableList _daysSelector(
      BuildContext context, double itemWidth, List<DateTime> items) {
    return ResizableList(
      totalWidth: MediaQuery.of(context).size.width,
      height: 160,
      itemSize: itemWidth,
      itemCount: items.length,
      itemBuilder: (context, index) {
        final date = items[index];
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              DateFormat('EEE').format(date),
              style: context.textTheme.titleSmall?.copyWith(
                color: Colors.white,
              ),
            ),
            Text(
              DateFormat('d').format(date),
              style: context.textTheme.titleSmall?.copyWith(
                color: Colors.white,
              ),
            ),
          ],
        );
      },
      onItemFocus: (idx) {
        context
            .read<ReservationBloc>()
            .add(ReservationEvent.setDay(date: items[idx]));
      },
    );
  }
}
