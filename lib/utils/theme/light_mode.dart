import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

MaterialColor createMaterialColor(Color color) {
  final Map<int, Color> colorSwatch = {
    50: color.withOpacity(0.1),
    100: color.withOpacity(0.2),
    200: color.withOpacity(0.3),
    300: color.withOpacity(0.4),
    400: color.withOpacity(0.5),
    500: color.withOpacity(0.6),
    600: color.withOpacity(0.7),
    700: color.withOpacity(0.8),
    800: color.withOpacity(0.9),
    900: color,
  };
  return MaterialColor(color.value, colorSwatch);
}

class ThemeDataModes {
  // Light and Dark Theme
  ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor:
          const Color.fromARGB(255, 255, 255, 255), // Light background
      titleTextStyle: TextStyle(
        color: Colors.black, // Black text for light background
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black, // Black icons
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.white, // White background
    primaryColor: const Color(0xFF0079EB), // Same red primary color
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light, // Light theme
      primarySwatch: createMaterialColor(const Color(0xFF0079EB)),
    ).copyWith(
      secondary: Colors.grey[700], // Slightly darker secondary for contrast
      onSecondary: Colors.black,
      onPrimary: Colors.white, // Black text or icon on the secondary color
    ),
  );

  ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: const Color(0xFF1B1B1B),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontFamily: GoogleFonts.poppins().fontFamily,
        fontSize: 20,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(
          color: Colors.white,
        ),
      ),
    ),
    scaffoldBackgroundColor: const Color(0xFF1B1B1B),
    primaryColor: const Color(0xFF0079EB),
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.dark,
      primarySwatch: createMaterialColor(const Color(0xFF0079EB)),
    ).copyWith(
      secondary: Colors.grey[700], // Slightly darker secondary for contrast
      onSecondary: Colors.white,
      onPrimary: Colors.white, // Text or icon color on the secondary color
    ),
  );
}
