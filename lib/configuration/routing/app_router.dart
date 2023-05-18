//

import 'package:flutter/material.dart';

import 'app_screens.dart';
import 'route_error_screen.dart';
import 'screens.dart';

class AppRouter {
  static Route<dynamic>? generate(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.initial:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => RouteErrorScreen(
                route: settings.name ?? 'no route provided',
                error: 'is not valid route'));
    }
  }
}
