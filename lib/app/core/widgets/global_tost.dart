import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'app_text_style.dart';

void globalToast({
  required String message,
  IconData? icon,
  Color? backgroundColor,
  Color? textColor,
  int? durationInSeconds,
  double? fontSize,
  double? borderRadius,
  EdgeInsets? margin,
  SnackPosition? position,
}) {
  Get.rawSnackbar(
    messageText: Row(
      children: [
        if (icon != null)
          Icon(icon, color: textColor ?? Colors.white, size: 20.sp),
        if (icon != null) SizedBox(width: 8.w),
        Expanded(
          child: AppTextStyle(
            text: message,
            color: textColor ?? Colors.white,
            fontSize: fontSize ?? 12.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
    backgroundColor: backgroundColor ?? Colors.black87,
    borderRadius: borderRadius ?? 12.r,
    margin: margin ?? EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
    snackPosition: position ?? SnackPosition.BOTTOM,
    duration: Duration(seconds: durationInSeconds ?? 2),
    animationDuration: const Duration(milliseconds: 300),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
  );
}
