import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      textTheme: _buildTextTheme(Colors.black87),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),

      // ✅ AppBar picks up your font automatically everywhere
      appBarTheme: AppBarTheme(
        titleTextStyle: _font(18.sp, FontWeight.w600, Colors.black87),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      textTheme: _buildTextTheme(Colors.white),
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.dark,
      ),

      // ✅ Dark variant
      appBarTheme: AppBarTheme(
        titleTextStyle: _font(18.sp, FontWeight.w600, Colors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.grey.shade900,
      ),
    );
  }

  // ✅ Name now matches the actual font being used
  static TextStyle _font(double size, FontWeight weight, Color color) {
    return GoogleFonts.dancingScript(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  // ── TextTheme ─────────────────────────────────────────

  static TextTheme _buildTextTheme(Color baseColor) {
    return TextTheme(
      displayLarge:  _font(32.sp, FontWeight.w700, baseColor),
      displayMedium: _font(28.sp, FontWeight.w700, baseColor),
      headlineLarge: _font(24.sp, FontWeight.w600, baseColor),
      headlineMedium:_font(20.sp, FontWeight.w600, baseColor),
      titleLarge:    _font(18.sp, FontWeight.w600, baseColor),
      titleMedium:   _font(16.sp, FontWeight.w500, baseColor),
      titleSmall:    _font(14.sp, FontWeight.w500, baseColor),
      bodyLarge:     _font(16.sp, FontWeight.w400, baseColor),
      bodyMedium:    _font(14.sp, FontWeight.w400, baseColor),
      bodySmall:     _font(12.sp, FontWeight.w400, baseColor),
      labelLarge:    _font(14.sp, FontWeight.w500, baseColor),
      labelSmall:    _font(11.sp, FontWeight.w400, baseColor),
    );
  }
}