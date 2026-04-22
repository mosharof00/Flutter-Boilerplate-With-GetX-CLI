import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../core/extensions/text_style_extension.dart';
import '../core/theme/app_colors.dart';
import 'app_text.dart';

class GlobalButton extends StatelessWidget {
  const GlobalButton({
    super.key,
    required this.onTap,
    required this.text,
    this.color,
    this.borderColor,
    this.textColor,
    this.height,
    this.width,
    this.borderRadius,
    this.gradient,
    this.boxShadow,
    this.suffixWidget,
    this.prefixWidget,
    this.padding,
  });

  final VoidCallback onTap;
  final String text;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final double? width;
  final BorderRadius? borderRadius;
  final LinearGradient? gradient;
  final List<BoxShadow>? boxShadow;
  final Widget? suffixWidget;
  final Widget? prefixWidget;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onTap,
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        height: height ?? 45.h,
        width: width ?? Get.width,
        decoration: BoxDecoration(
          color: gradient == null ? (color ?? AppColors.primary) : null,
          gradient: gradient,
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
          border: Border.all(color: borderColor ?? Colors.transparent),
          boxShadow: boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixWidget != null) prefixWidget!,
            Expanded(
              child: AppText(
                text,
                style: context.titleSmall.copyWith(
                  color: textColor ?? Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            ?suffixWidget,
          ],
        ),
      ),
    );
  }
}
