import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_colors.dart';

final ThemeData appThemeData = ThemeData(
  useMaterial3: true,
  fontFamily: 'Poppins',
  primaryColor: brandPrimaryColor,
  // scaffoldBackgroundColor: backgroundLight,
  hintColor: textMutedColor,
  colorScheme: ColorScheme.fromSeed(
    seedColor: brandPrimaryColor,
    primary: brandPrimaryColor,
    secondary: brandSecondaryColor,
    error: statusErrorColor,
    // background: backgroundLight,
    surface: neutralWhiteColor,
    onPrimary: neutralWhiteColor,
    onSecondary: Colors.black,
    onSurface: textPrimaryColor,
    onError: neutralWhiteColor,
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    backgroundColor: brandPrimaryColor,
    iconTheme: const IconThemeData(color: Colors.white),
    titleTextStyle: const TextStyle(
      fontFamily: 'Poppins',
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  ),

  textTheme: TextTheme(
    displayLarge: const TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: textPrimaryColor,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: textPrimaryColor,
    ),
    titleSmall: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      color: textSecondaryColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: textPrimaryColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: textSecondaryColor,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      color: textMutedColor,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w600,
      color: brandPrimaryColor,
    ),
  ),

  iconTheme: IconThemeData(color: textPrimaryColor, size: 24),

  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: neutralWhiteColor,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: textMutedColor.withOpacity(0.3)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: textMutedColor.withOpacity(0.2)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: brandPrimaryColor),
    ),
    hintStyle: TextStyle(color: textMutedColor),
    contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: neutralWhiteColor,
      backgroundColor: brandPrimaryColor,
      textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
    ),
  ),
);
