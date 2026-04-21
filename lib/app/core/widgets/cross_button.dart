import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../gen/assets.gen.dart';

Widget crossButton({
  required VoidCallback onTap,
  String? svgIconPath,
  Color? bgColor,
  BorderRadius? borderRadius,
  Color? iconColor,
  double? height,
  double? width,
  double? iconHeight,
  double? iconWidth,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height:height ?? 25.h,
      width:width ?? 25.w,
      decoration: BoxDecoration(
        color:bgColor ?? Colors.white,
        borderRadius: borderRadius ?? BorderRadius.circular(50.r)
      ),
      child: Center(
        child: SvgPicture.asset(
          svgIconPath ?? Assets.icons.crossIcon,
          height:iconHeight ?? 15.h,
          width:iconWidth ?? 15.w,
          colorFilter:  ColorFilter.mode(iconColor ?? Colors.black, BlendMode.srcIn),
        ),
      ),
    ),
  );
}
