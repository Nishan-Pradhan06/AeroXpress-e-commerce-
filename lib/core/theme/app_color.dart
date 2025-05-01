import 'package:flutter/material.dart';

class AppColors {
  final Color brandPrimary;
  final Color brandSecondary;
  final Color statusSuccess;
  final Color statusError;
  final Color statusWarning;
  final Color statusInfo;
  final Color background;
  final Color cardBackground;
  final Color surface;
  final Color textPrimary;
  final Color textSecondary;
  final Color textMuted;
  final Color textHighlight;
  final Color border;
  final Color focus;
  final Color hoverBackground;
  final Color selectedItemBackground;
  final Color saleBadge;
  final Color discountLabel;
  final Color neutralWhite;
  final Color dark;

  const AppColors({
    required this.brandPrimary,
    required this.brandSecondary,
    required this.statusSuccess,
    required this.statusError,
    required this.statusWarning,
    required this.statusInfo,
    required this.background,
    required this.cardBackground,
    required this.surface,
    required this.textPrimary,
    required this.textSecondary,
    required this.textMuted,
    required this.textHighlight,
    required this.border,
    required this.focus,
    required this.hoverBackground,
    required this.selectedItemBackground,
    required this.saleBadge,
    required this.discountLabel,
    required this.neutralWhite,
    required this.dark,
  });

  static AppColors lightTheme = const AppColors(
    brandPrimary: Color(0xFF1C5FAB),
    brandSecondary: Color(0xFFFFB300),
    statusSuccess: Color(0xFF34A853),
    statusError: Color(0xFFEA4335),
    statusWarning: Color(0xFFFFC107),
    statusInfo: Color(0xFF17A2B8),
    background: Color(0xFFF8F9FA),
    cardBackground: Color(0xFFFFFFFF),
    surface: Color(0xFFF1F3F4),
    textPrimary: Color(0xFF202124),
    textSecondary: Color(0xFF5F6368),
    textMuted: Color(0xFF9AA0A6),
    textHighlight: Color(0xFF1A73E8),
    border: Color(0xFFE0E0E0),
    focus: Color(0xFF2962FF),
    hoverBackground: Color(0xFFE8F0FE),
    selectedItemBackground: Color(0xFFD2E3FC),
    saleBadge: Color(0xFFFF5252),
    discountLabel: Color(0xFF00C853),
    neutralWhite: Color(0xFFFFFFFF),
    dark: Color(0xFF121212),
  );

  static AppColors darkTheme = const AppColors(
    brandPrimary: Color(0xFF90CAF9),
    brandSecondary: Color(0xFFFFE082), 
    statusSuccess: Color(0xFF81C784),
    statusError: Color(0xFFEF9A9A),
    statusWarning: Color(0xFFFFE57F),
    statusInfo: Color(0xFF80DEEA),
    background: Color(0xFF121212),
    cardBackground: Color(0xFF1E1E1E),
    surface: Color(0xFF2C2C2C),
    textPrimary: Color(0xFFE0E0E0),
    textSecondary: Color(0xFFB0BEC5),
    textMuted: Color(0xFF78909C),
    textHighlight: Color(0xFF64B5F6),
    border: Color(0xFF424242),
    focus: Color(0xFF448AFF),
    hoverBackground: Color(0xFF1A237E),
    selectedItemBackground: Color(0xFF3949AB),
    saleBadge: Color(0xFFFF8A80),
    discountLabel: Color(0xFF00E676),
    neutralWhite: Color(0xFFFFFFFF),
    dark: Color(0xFF121212),
  );
}
