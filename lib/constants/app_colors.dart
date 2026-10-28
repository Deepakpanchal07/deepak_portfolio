import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color background = Color(0xFF0A0C10);
  static const Color surface = Color(0xFF12151C);
  static const Color surfaceLight = Color(0xFF181D26);
  static const Color surfaceElevated = Color(0xFF202633);
  
  // Borders & Dividers
  static const Color border = Color(0xFF222836);
  static const Color borderSubtle = Color(0x1AFFFFFF);
  static const Color borderGlow = Color(0x4DFF6B35);

  // Vibrant Orange Accents (#FF6B35)
  static const Color accent = Color(0xFFFF6B35);
  static const Color accentLight = Color(0xFFFF895A);
  static const Color accentDark = Color(0xFFE2521C);
  static const Color accentGlow = Color(0x33FF6B35);
  static const Color accentSubtle = Color(0x1AFF6B35);

  // Text Colors
  static const Color textPrimary = Color(0xFFF8FAFC);
  static const Color textSecondary = Color(0xFFA1ADC2);
  static const Color textMuted = Color(0xFF64748B);
  static const Color textDark = Color(0xFF0F172A);

  // Status & Extras
  static const Color success = Color(0xFF10B981);
  static const Color successGlow = Color(0x3310B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color cyanAccent = Color(0xFF00D2FF);

  // Gradients
  static const LinearGradient accentGradient = LinearGradient(
    colors: [Color(0xFFFF6B35), Color(0xFFFF8E53)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient darkCardGradient = LinearGradient(
    colors: [Color(0xFF151922), Color(0xFF0F1218)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [Color(0x1FFFFFFF), Color(0x05FFFFFF)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
