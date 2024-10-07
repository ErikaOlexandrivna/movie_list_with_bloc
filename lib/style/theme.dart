import 'package:flutter/material.dart';
import 'package:movie_list_with_bloc/style/palette.dart';

final darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Palette.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: Palette.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Palette.textPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: Palette.textPrimary,
      ),
      bodyLarge: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Palette.textPrimary,
      ),
      bodySmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Palette.textSecondary,
      ),
    )
);