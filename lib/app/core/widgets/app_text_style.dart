import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class AppTextStyle extends StatelessWidget {
  const AppTextStyle({
    required this.text,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.color,
    this.textAlign,
    this.decoration,
    super.key,
    this.decorationColor,
    this.overflow,
  });
  final String text;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final TextOverflow? overflow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: height,
          decoration: decoration,
          decorationColor: decorationColor,
        ),
      ),
    );
  }
}

class AppTextStyleOverFlow extends StatelessWidget {
  const AppTextStyleOverFlow({
    required this.text,
    this.maxLines,
    this.fontSize,
    this.fontWeight,
    this.height,
    this.color,
    this.textAlign,
    super.key,
  });
  final String text;
  final int? maxLines;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  final Color? color;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.tr,
      textAlign: textAlign ?? TextAlign.start,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 1,
      style: GoogleFonts.poppins(
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: fontSize ?? 14.sp,
          fontWeight: fontWeight ?? FontWeight.w400,
          height: height,
        ),
      ),
    );
  }
}
