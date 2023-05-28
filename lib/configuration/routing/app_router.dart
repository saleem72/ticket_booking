//

import 'package:flutter/material.dart';
import 'package:ticket_booking/core/domain/models/movie.dart';

import 'app_screens.dart';
import 'route_error_screen.dart';
import 'screens.dart';

class AppRouter {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.initial:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case AppScreens.reservation:
        final movie = settings.arguments as Movie?;
        if (movie != null) {
          return MaterialPageRoute(
            builder: (_) => ReservationScreen(movie: movie),
          );
        } else {
          return MaterialPageRoute(
            builder: (_) => RouteErrorScreen(
              route: settings.name ?? 'no route provided',
              error: 'You have to provide a movie for thid link',
            ),
          );
        }
      case AppScreens.chooseSeats:
        return MaterialPageRoute(
          builder: (_) => const SeatsScreen(),
        );
      case AppScreens.tickets:
        return MaterialPageRoute(
          builder: (_) => const TicketsScreen(),
        );
      case AppScreens.test:
        return MaterialPageRoute(builder: (_) => const TestScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => RouteErrorScreen(
            route: settings.name ?? 'no route provided',
            error: 'is not valid route',
          ),
        );
    }
  }
}
