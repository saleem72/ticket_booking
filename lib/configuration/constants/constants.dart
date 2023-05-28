//

import 'package:flutter/material.dart';

class AppConstants {
  AppConstants._();

  static const double paddingSmall = 4;
  static const double paddingMedium = 8;
  static const double paddingLarge = 20;

  static const double borderRadiusSmall = 10;
  static const double borderRadiusMedium = 20;

  static const double imageCardRatio = 100 / 130;

  static const double bottomTabBarTotalHeight = 107;
  static const double bottomTabBarHeight = 90;

  static String baseURL = 'http://192.168.192.12:3000/api/';
  static String moviesEndpoint = 'movies';

  static const double theatreGap = 8;
  static const double theatrePadding = 20;
  static const double seatRatio = 22 / 32;

  // width: 250, height: 460
  // width: 390, height: 844
  // 132
  // 414 460
  static const double clippedCardHeightRatio = 460 / 844;
  static const double clippedCardWidthRatio = 250 / 460;
  static const double clippedCardBarcodeRatio = 132 / 460;
  static const double clippedCardSmallerScale = 414 / 460;

  static const gradientForSelected = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(1, 1.3140583634376526),
    colors: [
      Color(0xFFB6116B),
      Color(0xFF2E1371),
    ],
  );

  static final gradientForSelectedBorder = LinearGradient(
    begin: const Alignment(-0.5, -0.7),
    end: const Alignment(-0.1, -0.5),
    colors: [
      const Color(0xFFFF53C0).withOpacity(0.7),
      const Color(0xFFFF53C0).withOpacity(0),
    ],
  );

  static const gradientForNormalBorder = LinearGradient(
    begin: Alignment(-0.5, -0.7),
    end: Alignment(-0.1, -0.5),
    colors: [
      Color(0xFF60FFCA),
      Color(0xFF194234),
    ],
  );

  static const gradientForNormal = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment(1, 1.3140583634376526),
    colors: [
      Color(0xFF2E1371),
      Color(0xFF21232F),
    ],
  );
}
