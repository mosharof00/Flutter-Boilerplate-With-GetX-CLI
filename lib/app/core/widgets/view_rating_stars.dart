import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../extensions/sizedbox_extension.dart';
import '../theme/app_colors.dart';
import 'app_text_style.dart';

class ViewRatingStars extends StatelessWidget {
  const ViewRatingStars({super.key, required this.rating});
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Static Star Rating
        RatingBarIndicator(
          rating: rating,
          itemBuilder: (context, index) =>
              const Icon(Icons.star, color: Colors.orange),
          itemCount: 5,
          itemSize: 25.sp,
          direction: Axis.horizontal,
        ),
        4.width,
        // Display Rating Value
        AppTextStyle(
          text: '(${rating.toStringAsFixed(1)})',
          fontSize: 16.sp,
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.star, color: AppColors.amber, size: iconSize ?? 14.sp),
        2.width,
        AppTextStyle(
          text: rating.toString(),
          fontSize: fontSize ?? 11.sp,
          fontWeight: fontWeight ?? FontWeight.w500,
          color: textColor,
        ),
      ],
    );
  }
}
