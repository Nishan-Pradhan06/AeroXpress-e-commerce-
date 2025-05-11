// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_color.dart';

ThemeData buildAppTheme(AppColors colors) {
  return ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: colors.brandPrimary,
    scaffoldBackgroundColor: colors.background,
    splashColor: colors.brandPrimary.withOpacity(0.2),
    // highlightColor: colors.brandPrimary.withOpacity(0.2),
    hoverColor: colors.brandPrimary.withOpacity(0.2),
    // hintColor: colors.textMuted,
    colorScheme: ColorScheme.fromSeed(
      brightness:
          colors == AppColors.darkTheme ? Brightness.dark : Brightness.light,
      seedColor: colors.brandPrimary,
      primary: colors.brandPrimary,
      secondary: colors.brandSecondary,
      error: colors.statusError,
      surface: colors.cardBackground,
      onPrimary: colors.neutralWhite,
      onSecondary: Colors.black,
      onSurface: colors.textPrimary,
      onError: colors.neutralWhite,
    ),
    appBarTheme: AppBarTheme(
      scrolledUnderElevation: 0,
      elevation: 0,
      centerTitle: true,
      backgroundColor:
          colors == AppColors.darkTheme
              ? colors.neutralWhite
              : colors.brandPrimary,
      iconTheme: IconThemeData(color: colors.brandPrimary),
      titleTextStyle: TextStyle(
        fontFamily: 'Poppins',
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: colors.brandPrimary,
      ),
      actionsIconTheme: IconThemeData(color: colors.brandPrimary),
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness:
            colors == AppColors.darkTheme ? Brightness.dark : Brightness.light,

        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    ),

    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontSize: 72.0,
        fontWeight: FontWeight.bold,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: colors.textPrimary,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: colors.textPrimary,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: colors.textSecondary,
      ),
      bodyLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: colors.textPrimary,
      ),
      bodyMedium: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: colors.textSecondary,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: colors.textMuted,
      ),
      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: colors.brandPrimary,
      ),
    ),
    iconTheme: IconThemeData(color: colors.textPrimary, size: 24),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: colors.cardBackground,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.textMuted.withOpacity(0.3)),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.textMuted.withOpacity(0.2)),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: colors.brandPrimary),
      ),
      hintStyle: TextStyle(color: colors.textMuted),
      contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: colors.neutralWhite,
        backgroundColor: colors.brandPrimary,
        textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,

      labelColor: colors.neutralWhite,
      unselectedLabelColor: colors.neutralWhite.withOpacity(0.7),
      indicator: UnderlineTabIndicator(
        borderSide: BorderSide(width: 3.0, color: colors.neutralWhite),
        insets: EdgeInsets.all(2),
      ),
      labelStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colors.cardBackground,
      selectedItemColor: colors.brandPrimary,
      unselectedItemColor: colors.textMuted,
      selectedIconTheme: IconThemeData(size: 28, color: colors.brandPrimary),
      unselectedIconTheme: IconThemeData(size: 24, color: colors.textMuted),
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        fontFamily: 'Poppins',
        letterSpacing: 0.5,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w400,
        fontFamily: 'Poppins',
        letterSpacing: 0.2,
      ),
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      enableFeedback: true,
    ),
  );
}
