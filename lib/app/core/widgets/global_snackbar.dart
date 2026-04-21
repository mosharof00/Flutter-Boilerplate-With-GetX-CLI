import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app_text_style.dart';

SnackbarController globalSnackBar({
  required String title,
  required String message,
  String? svgImagePath,
  int? durationInSeconds,
  double? iconHeight,
  Color? titleColor,
  Color? backgroundColor,
  SnackPosition? snackPosition,
}) {
  return Get.snackbar(
    '',
    '',
    titleText: AppTextStyle(
      text: title,
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      color: titleColor,
      textAlign: TextAlign.center,
    ),
    messageText: AppTextStyle(
      text: message,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
      textAlign: TextAlign.center,

    ),
    backgroundColor: backgroundColor ?? Colors.transparent,
    duration: Duration(seconds: durationInSeconds ?? 1),
    snackPosition: snackPosition ?? SnackPosition.TOP,
  );
}
