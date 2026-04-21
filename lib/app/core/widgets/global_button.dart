import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../theme/app_colors.dart';
import 'app_text_style.dart';

Widget globalButton(
    {required VoidCallback onTap,
    required String text,
    Color? color,
    Color? shadowColor,
    Color? borderColor,
    Color? textColor,
    double? height,
    double? blurRadius,
    double? width,
    double? fontSize,
    FontWeight? fontWeight,
    BorderRadius? borderRadius,
    LinearGradient? gradient,
    List<BoxShadow>? boxShadow,
    Widget? suffixWidget,
    Widget? prefixWidget,
    EdgeInsetsGeometry? padding}) {
  return CupertinoButton(
    onPressed: onTap,
    padding: padding ?? EdgeInsets.zero,
    child: Container(
        height: height ?? 45.h,
        width: width ?? Get.width,
        decoration: BoxDecoration(
            color: color ?? AppColors.primary,
            gradient: gradient,
            borderRadius: borderRadius ?? BorderRadius.circular(12.r),
            border: Border.all(color: borderColor ?? Colors.transparent),
            boxShadow: boxShadow),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            prefixWidget ?? SizedBox.shrink(),
            Expanded(
              child: AppTextStyle(
                text: text,
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? 15.sp,
                fontWeight: fontWeight ?? FontWeight.w500,
                textAlign: TextAlign.center,
              ),
            ),
            suffixWidget ?? SizedBox.shrink(),
          ],
        )),
  );
}
