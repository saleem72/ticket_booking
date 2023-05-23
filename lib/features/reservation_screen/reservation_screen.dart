//

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ticket_booking/configuration/constants/constants.dart';
import 'package:ticket_booking/configuration/extensions/build_context_extension.dart';
import 'package:ticket_booking/configuration/routing/app_screens.dart';
import 'package:ticket_booking/core/domain/models/movie.dart';
import 'package:ticket_booking/features/home_screen/presentation/widgets/glass_card.dart';

import '../home_screen/presentation/widgets/gradient_border.dart';
import '../test_screen/resizable_list.dart';

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
                MoviesDetialsUI(movie: movie),
                const GlassyAppBar(),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Select date and time',
                style: context.textTheme.titleMedium?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 17,
                ),
              ),
              const SizedBox(height: 20),
              ResizableList(
                totalWidth: MediaQuery.of(context).size.width,
                height: 160,
                itemSize: itemWidth,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        DateFormat('EEE').format(items[index]),
                        style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        DateFormat('d').format(items[index]),
                        style: context.textTheme.titleSmall?.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  );
                },
                onItemFocus: (idx) {
                  print(idx);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingLarge),
                child: ReservationButton(
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 46),
            ],
          ),
        ],
      ),
    );
  }
}

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

class GlassyAppBar extends StatelessWidget {
  const GlassyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(top: 24),
        height: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBarButton(
              onPressed: () => context.navigator.pop(),
              icon: Icons.arrow_back,
            ),
            AppBarButton(
              onPressed: () => context.navigator.pushNamed(AppScreens.test),
              icon: Icons.more_vert,
            ),
          ],
        ),
      ),
    );
  }
}

class MoviesDetialsUI extends StatelessWidget {
  const MoviesDetialsUI({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(height: 64),
      ],
    );
  }
}

class MovieFullImage extends StatelessWidget {
  const MovieFullImage({
    super.key,
    required this.url,
  });

  final String url;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          url,
          fit: BoxFit.fill,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(0.4),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AppBarButton extends StatelessWidget {
  const AppBarButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.25),
          shape: BoxShape.circle,
        ),
        clipBehavior: Clip.hardEdge,
        child: Stack(
          children: [
            const GalssCard(
              sigmaX: 5,
              child: CircularGradientBorder(),
            ),
            Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
