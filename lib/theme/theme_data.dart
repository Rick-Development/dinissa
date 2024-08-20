
import 'package:flutter/material.dart';

import 'material_colors.dart';

final lightTheme = ThemeData(
    primaryColor: lightColorScheme.primary,
    colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: lightColorScheme.primary,
        onPrimary: lightColorScheme.onPrimary,
        inversePrimary: lightColorScheme.inversePrimary,
        secondary: lightColorScheme.secondary,
        onSecondary: lightColorScheme.onSecondary,
        error: lightColorScheme.error,
        onError: lightColorScheme.onError,
        surface: lightColorScheme.surface,
        onSurface: lightColorScheme.onSurface,
        onSurfaceVariant: lightColorScheme.onSurfaceVariant,
        onInverseSurface: lightColorScheme.onInverseSurface,
        outline: lightColorScheme.outline
    ),
    textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 21,
          fontWeight: FontWeight.bold,
        )
    )
);

final darkTheme = ThemeData(
    primaryColor: darkColorScheme.primary,
    colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: darkColorScheme.primary,
        onPrimary: darkColorScheme.onPrimary,
        inversePrimary: darkColorScheme.inversePrimary,
        secondary: darkColorScheme.secondary,
        onSecondary: darkColorScheme.onSecondary,
        error: darkColorScheme.error,
        onError: darkColorScheme.onError,
        surface: darkColorScheme.surface,
        onSurface: darkColorScheme.onSurface,
        onInverseSurface: darkColorScheme.onInverseSurface,
        outline: darkColorScheme.outline
    )
);

ThemeData getDarkTheme() {
  return darkTheme;
}

ThemeData getLightTheme() {
  return lightTheme;
}