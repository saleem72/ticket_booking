//

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';
import 'package:ticket_booking/configuration/routing/app_screens.dart';

import '../../../../configuration/constants/constants.dart';
import '../home_bloc/home_bloc.dart';
import 'movie_card.dart';
import 'section_title.dart';

class MoviesGrid extends StatelessWidget {
  const MoviesGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppConstants.paddingLarge),
              const SectionTitle(label: 'Now Playing'),
              const SizedBox(height: AppConstants.paddingLarge),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingLarge),
                  itemCount: state.group.playNow.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = state.group.playNow[index];
                    return GestureDetector(
                      onTap: () => context.navigator
                          .pushNamed(AppScreens.reservation, arguments: movie),
                      child: MovieCard(movie: movie),
                    );
                  },
                  separatorBuilder: (context, index) => Container(width: 8),
                ),
              ),
              const SizedBox(height: AppConstants.paddingLarge),
              const SectionTitle(label: 'Coming Soon'),
              const SizedBox(height: AppConstants.paddingLarge),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingLarge),
                  itemCount: state.group.comingSoon.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = state.group.comingSoon[index];
                    return MovieCard(movie: movie);
                  },
                  separatorBuilder: (context, index) => Container(width: 8),
                ),
              ),
              const SizedBox(height: AppConstants.paddingLarge),
              const SectionTitle(label: 'Top movies'),
              const SizedBox(height: AppConstants.paddingLarge),
              SizedBox(
                height: 130,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.paddingLarge),
                  itemCount: state.group.topMovies.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    final movie = state.group.topMovies[index];
                    return MovieCard(
                      movie: movie,
                      borderRadius: AppConstants.borderRadiusMedium,
                    );
                  },
                  separatorBuilder: (context, index) => Container(width: 8),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
