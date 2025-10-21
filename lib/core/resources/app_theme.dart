import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.darkBlue,
      brightness: Brightness.light,
    ),
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.white,
    dividerTheme: DividerThemeData(
      color: AppColors.black.withValues(alpha: 0.1),
      thickness: 1,
    ),
  );
}
