import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    this.isDisabled = false,
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
  final bool isDisabled;

  Color _resolveColor() {
    if (isDisabled) return AppColors.primaryDisable;
    return color ?? AppColors.primary;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: isDisabled ? null : onTap,
      padding: padding ?? EdgeInsets.zero,
      child: Container(
        height: height ?? 45.h,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: gradient == null ? _resolveColor() : null,
          gradient: isDisabled ? null : gradient,
          borderRadius: borderRadius ?? BorderRadius.circular(12.r),
          border: Border.all(color: borderColor ?? Colors.transparent),
          boxShadow: isDisabled ? null : boxShadow,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ?prefixWidget,
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
