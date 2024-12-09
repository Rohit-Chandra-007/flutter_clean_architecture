// lib/theme/app_theme.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryTeal = Color(0xFF2DD4BF);
  static const Color primaryViolet = Color(0xFF8B5CF6);
  static const Color primaryRose = Color(0xFFFB7185);
  static const Color primaryAmber = Color(0xFFFBBF24);
  
  // Gradient Colors
  static const List<Color> backgroundGradient = [
    Color(0xFFFFF1F2), // rose-100
    Color(0xFFCCFBF1), // teal-100
    Color(0xFFEDE9FE), // violet-100
  ];

  // Text Colors
  static const Color textPrimary = Color(0xFF1F2937);    // gray-800
  static const Color textSecondary = Color(0xFF4B5563);  // gray-600
  static const Color textTertiary = Color(0xFF6B7280);   // gray-500

  // Surface Colors
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color surfaceMedium = Color(0xFFF3F4F6);
  static const Color surfaceDark = Color(0xFFE5E7EB);

  // Glass Effect Colors
  static Color glassWhite = Colors.white.withOpacity(0.3);
  static Color glassBorder = Colors.white.withOpacity(0.4);
  static double glassBlur = 10.0;

  // Spacing
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;

  // Border Radius
  static const double radiusXs = 4.0;
  static const double radiusSm = 8.0;
  static const double radiusMd = 12.0;
  static const double radiusLg = 16.0;
  static const double radiusXl = 24.0;
  static const double radiusFull = 9999.0;

  // Elevation
  static List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  static List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 8,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Colors.black.withOpacity(0.1),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  // Get Theme Data
  static ThemeData getThemeData() {
    return ThemeData(
      primaryColor: primaryTeal,
      scaffoldBackgroundColor: Colors.transparent,
      fontFamily: GoogleFonts.inter().fontFamily,
      
      // Text Theme
      textTheme: TextTheme(
        displayLarge: GoogleFonts.inter(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        displayMedium: GoogleFonts.inter(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        displaySmall: GoogleFonts.inter(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        headlineMedium: GoogleFonts.inter(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        headlineSmall: GoogleFonts.inter(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: textPrimary,
        ),
        titleLarge: GoogleFonts.inter(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: textPrimary,
        ),
        bodyLarge: GoogleFonts.inter(
          fontSize: 16,
          color: textSecondary,
        ),
        bodyMedium: GoogleFonts.inter(
          fontSize: 14,
          color: textSecondary,
        ),
        bodySmall: GoogleFonts.inter(
          fontSize: 12,
          color: textTertiary,
        ),
      ),

      // Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryTeal,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: spacingMd,
            vertical: spacingSm,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusMd),
          ),
        ),
      ),

      // Card Theme
      cardTheme: CardTheme(
        color: glassWhite,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radiusMd),
          side: BorderSide(color: glassBorder),
        ),
      ),

      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: primaryTeal,
        unselectedItemColor: textTertiary,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
      ),

      // Icon Theme
      iconTheme: const IconThemeData(
        color: textSecondary,
        size: 24,
      ),
    );
  }

  // Glass Container Decoration
  static BoxDecoration glassDecoration({
    double radius = radiusMd,
    Color? borderColor,
    List<Color>? gradientColors,
  }) {
    return BoxDecoration(
      color: glassWhite,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(
        color: borderColor ?? glassBorder,
      ),
      gradient: gradientColors != null
          ? LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )
          : null,
    );
  }

  // Gradient Text Style
  static TextStyle gradientTextStyle({
    required List<Color> colors,
    double fontSize = 16,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      foreground: Paint()
        ..shader = LinearGradient(
          colors: colors,
        ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0)),
    );
  }
}

// Extension for easy theme access
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  Size get screenSize => MediaQuery.of(this).size;
  EdgeInsets get padding => MediaQuery.of(this).padding;
}

// Usage Example:
/*
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.getThemeData(),
      home: MyHomePage(),
    );
  }
}

// In your widgets:
Container(
  decoration: AppTheme.glassDecoration(),
  child: Text(
    'Hello',
    style: context.textTheme.headlineMedium,
  ),
)

// For gradient text:
Text(
  'Gradient Title',
  style: AppTheme.gradientTextStyle(
    colors: [AppTheme.primaryTeal, AppTheme.primaryViolet],
    fontSize: 24,
    fontWeight: FontWeight.bold,
  ),
)
*/

/*
  Summary:
  1. Created a class AppTheme to store all the theme-related properties.
  2. Added colors, gradients, text styles, spacing, border radius, elevation, and more.
  3. Created a method getThemeData() to return the ThemeData for the app.
  4. Added a glassDecoration() method to create a glass effect container decoration.
  5. Added a gradientTextStyle() method to create a gradient text style.
  6. Created a ThemeExtension to easily access theme properties in widgets.
  7. Updated the main.dart and signup_page.dart files to use the AppTheme class.
*/