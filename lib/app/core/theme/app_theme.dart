import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColors.background,
      textTheme: _buildTextTheme(Colors.black87),
      colorScheme: ColorScheme.light(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        surface: AppColors.white,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: Colors.black87,
        onError: AppColors.white,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: _font(18.sp, FontWeight.w600, Colors.black87),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: Colors.black87,
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.darkBackground,
      textTheme: _buildTextTheme(AppColors.white),
      colorScheme: ColorScheme.dark(
        primary: AppColors.primary,
        secondary: AppColors.secondary,
        error: AppColors.error,
        surface: AppColors.darkSurface,
        onPrimary: AppColors.white,
        onSecondary: AppColors.white,
        onSurface: AppColors.white,
        onError: AppColors.white,
      ),
      appBarTheme: AppBarTheme(
        titleTextStyle: _font(18.sp, FontWeight.w600, AppColors.white),
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.darkBackground2,
        foregroundColor: AppColors.white,
      ),
    );
  }

  static TextStyle _font(double size, FontWeight weight, Color color) {
    return GoogleFonts.poppins(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }

  static TextTheme _buildTextTheme(Color baseColor) {
    return TextTheme(
      displayLarge: _font(32.sp, FontWeight.w700, baseColor),
      displayMedium: _font(28.sp, FontWeight.w700, baseColor),
      headlineLarge: _font(24.sp, FontWeight.w600, baseColor),
      headlineMedium: _font(20.sp, FontWeight.w600, baseColor),
      titleLarge: _font(18.sp, FontWeight.w600, baseColor),
      titleMedium: _font(16.sp, FontWeight.w500, baseColor),
      titleSmall: _font(14.sp, FontWeight.w500, baseColor),
      bodyLarge: _font(16.sp, FontWeight.w400, baseColor),
      bodyMedium: _font(14.sp, FontWeight.w400, baseColor),
      bodySmall: _font(12.sp, FontWeight.w400, baseColor),
      labelLarge: _font(14.sp, FontWeight.w500, baseColor),
      labelSmall: _font(11.sp, FontWeight.w400, baseColor),
    );
  }
}
