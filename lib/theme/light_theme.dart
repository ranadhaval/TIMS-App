import 'package:flutter/material.dart';
import 'package:tims/theme/app_theme.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: AppTheme.colorPrimaryTheme,
  visualDensity: VisualDensity.adaptivePlatformDensity,

  appBarTheme: AppBarTheme(
    color: AppTheme.colorPrimaryTheme,
    elevation: 0, toolbarTextStyle: TextTheme(
      headline6: TextStyle(
        color: AppTheme.colorWhite,
        fontSize: 20,
      ),
    ).bodyText2, titleTextStyle: TextTheme(
      headline6: TextStyle(
        color: AppTheme.colorWhite,
        fontSize: 20,
      ),
    ).headline6,
  ), colorScheme: ColorScheme.fromSwatch().copyWith(secondary: AppTheme.colorAccentTheme),
);
