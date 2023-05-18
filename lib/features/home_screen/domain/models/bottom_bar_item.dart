//

import 'package:flutter/material.dart';

enum BottomBarItem {
  home,
  location,
  reservation,
  tickets,
  profile;

  IconData get icon {
    switch (this) {
      case BottomBarItem.home:
        return Icons.home;
      case BottomBarItem.location:
        return Icons.location_on;
      case BottomBarItem.reservation:
        return Icons.view_module_rounded;
      case BottomBarItem.tickets:
        return Icons.grid_view_rounded;
      case BottomBarItem.profile:
        return Icons.person;
    }
  }

  String get title {
    return toString().split('.').last.toUpperCase();
  }
}
