import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_style.dart';
import 'custom_svg_image.dart';

class CustomDialog extends StatelessWidget {
  final String iconPath;
  final String title;
  final String subtitle;
  final Widget? bottomWidget;
  final double? iconWidth;
  final double? iconHeight;

  const CustomDialog({
    super.key,
    required this.iconPath,
    required this.title,
    required this.subtitle,
    this.bottomWidget,
    this.iconWidth,
    this.iconHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: 24.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
      child: Padding(
        padding: EdgeInsets.fromLTRB(20.w, 28.h, 20.w, 24.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ── Icon / Sticker ─────────────────────────────
            customSvgImage(
              imagePath: iconPath,
              width: iconWidth,
              height: iconHeight,
            ),
            20.verticalSpace,

            // ── Title ──────────────────────────────────────
            AppTextStyle(
              text: title,
              fontSize: 17.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              textAlign: TextAlign.center,
            ),
            8.verticalSpace,

            // ── Subtitle ───────────────────────────────────
            AppTextStyle(
              text: subtitle,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400,
              color: Colors.grey,
              textAlign: TextAlign.center,
              height: 1.5,
            ),

            // ── Bottom widget ──────────────────────────────
            if (bottomWidget != null) ...[20.verticalSpace, bottomWidget!],
          ],
        ),
      ),
    );
  }
}
