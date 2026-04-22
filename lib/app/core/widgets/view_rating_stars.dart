import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/sizedbox_extension.dart';
import '../extensions/text_style_extension.dart';
import '../theme/app_colors.dart';
import 'app_text.dart';

class ViewRatingStars extends StatelessWidget {
  const ViewRatingStars({
    super.key,
    required this.rating,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, _) =>
          const Icon(Icons.star, color: Colors.orange),
          itemCount: 5,
          itemSize: 20.sp,
        ),
        4.width,
        AppText(
          '(${rating.toStringAsFixed(1)})',
          style: context.bodyMedium.copyWith(
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class ViewSingleRatingStar extends StatelessWidget {
  const ViewSingleRatingStar({
    super.key,
    required this.rating,
    this.textColor,
    this.fontSize,
    this.iconSize,
    this.fontWeight,
  });

  final double rating;
  final Color? textColor;
  final double? fontSize;
  final double? iconSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star, color: AppColors.amber, size: iconSize ?? 14.sp),
        2.width,
        AppText(
          rating.toString(),
          style: context.labelSmall.copyWith(
            color: textColor,
            fontWeight: fontWeight ?? FontWeight.w500,
            // ✅ fontSize override only when explicitly needed
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}