import 'package:flutter/material.dart';

import 'colors.dart';

/// Material theme definitions.
class AppTheme {
  static ThemeData lightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
      useMaterial3: true,
    );
  }
}
