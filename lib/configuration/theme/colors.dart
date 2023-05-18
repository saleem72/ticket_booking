//

import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const green = Color(0xFF09FBD3);
  static const magenta = Color(0xFFB6116B);
  static const indigo = Color(0xFF2E1371);
  static const pink = Color(0xFFFE53BB);
  static const black = Color(0xFF21232F);
  static const darkPurple = Color(0xFF130B2B);

  static const background = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      indigo,
      darkPurple,
    ],
  );
}
