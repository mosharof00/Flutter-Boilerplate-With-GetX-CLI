import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_text_style.dart';

Widget leadingText({required String text, Color? color}) {
  return AppTextStyle(
    text: text,
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: 14.sp,
  );
}
