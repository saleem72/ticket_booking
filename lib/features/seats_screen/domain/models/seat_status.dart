
//

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../configuration/theme/colors.dart';

enum SeatStatus {
  available,
  reserved,
  selected;

  String get id => toString();

  String get label => toString().split('.').last;

  factory SeatStatus.fromString(String value) {
    return SeatStatus.values
            .firstWhereOrNull((element) => element.label == value) ??
        SeatStatus.available;
  }

  Color get color {
    switch (this) {
      case SeatStatus.available:
        return const Color(0xFFC4C4C4);
      case SeatStatus.reserved:
        return AppColors.pink;
      case SeatStatus.selected:
        return AppColors.green;
    }
  }
}
