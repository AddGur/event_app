import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Kolory
  static const Color primaryColor = Color(0xFF4A90E2);
  static const Color secondaryColor = Color(0xFF6A85B6);
  static const Color accentColor = Colors.orange;
  static const Color textColor = Color(0xFF333333);
  static const Color cardBackgroundColor = Colors.white;

  // Gradienty
  static const Gradient loginGradient = LinearGradient(
    colors: [primaryColor, secondaryColor],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const Gradient homeGradient = LinearGradient(
    colors: [Colors.white, Color(0xFFE8F5FF)],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  // Teksty
  static final TextStyle displayLarge = GoogleFonts.poppins(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: textColor,
  );

  static final TextStyle displayMedium = GoogleFonts.poppins(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: textColor,
  );

  static final TextStyle displaySmall = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: textColor,
  );

  static final InputDecoration inputDecoration = InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
  );

  static final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: accentColor,
    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
  );

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      textTheme: TextTheme(
        displayLarge: displayLarge,
        displayMedium: displayMedium,
        bodyLarge: GoogleFonts.poppins(fontSize: 14, color: textColor),
        bodyMedium: GoogleFonts.poppins(fontSize: 12, color: textColor),
      ),
      cardColor: cardBackgroundColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: primaryButtonStyle,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        primary: primaryColor,
        secondary: secondaryColor,
        surface: cardBackgroundColor,
        onPrimary: Colors.white,
        onSurface: textColor,
      ),
    );
  }
}
