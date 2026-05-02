import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color background = Color(0xFF0d1515);
  static const Color surface = Color(0xFF0d1515);
  static const Color surfaceVariant = Color(0xFF2e3637);
  static const Color onSurface = Color(0xFFdce4e5);
  
  static const Color primary = Color(0xFF00dbe9);
  static const Color secondary = Color(0xFFe9b3ff);
  static const Color tertiary = Color(0xFFedf7ff);
  
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        onSurface: onSurface,
        surfaceContainerHighest: surfaceVariant,
      ),
      textTheme: TextTheme(
        displayLarge: GoogleFonts.manrope(fontSize: 48, fontWeight: FontWeight.w700, color: onSurface),
        displayMedium: GoogleFonts.manrope(fontSize: 32, fontWeight: FontWeight.w600, color: onSurface),
        displaySmall: GoogleFonts.manrope(fontSize: 24, fontWeight: FontWeight.w600, color: onSurface),
        bodyLarge: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.w400, color: onSurface),
        bodyMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400, color: onSurface),
        labelSmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w600, color: onSurface, letterSpacing: 0.5),
      ),
    );
  }
}
