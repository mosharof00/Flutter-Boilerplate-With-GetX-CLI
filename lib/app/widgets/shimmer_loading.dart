import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../core/theme/app_colors.dart';


Widget shimmerLoadingWidget({
  double? height,
  double? width,
  double? borderRadius,
  EdgeInsetsGeometry? padding,
}) {
  return Shimmer.fromColors(
    baseColor: AppColors.primary.withAlpha(2),
    highlightColor: Colors.white54,
    period: const Duration(milliseconds: 2500),
    child: Container(
      width: width ?? Get.width,
      height: height ?? Get.height,
      margin: padding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(borderRadius ?? 10.0),
      ),
    ),
  );
}

Widget shimmerLoadingListVerticalWidget(
    {double? height,
    double? width,
    double? borderRadius,
    EdgeInsetsGeometry? padding}) {
  return Shimmer.fromColors(
    baseColor: AppColors.primary.withAlpha(2),
    highlightColor: Colors.white54,
    period: const Duration(milliseconds: 2500),
    child: ListView.builder(
      itemBuilder: (_, __) => Padding(
        padding: padding ?? EdgeInsets.only(bottom: 8.r),
        child: Container(
            height: height ?? 100,
            width: width ?? Get.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius ?? 15.r),
            )),
      ),
      itemCount: 6,
    ),
  );
}

Widget shimmerLoadingListHorizontalWidget(
    {double? height,
    double? width,
    double? borderRadius,
    EdgeInsetsGeometry? padding}) {
  return SizedBox(
    height: height ?? 270.h,
    child: ListView.builder(
      itemCount: 6,
      scrollDirection: Axis.horizontal,
      itemBuilder: (_, index) => Padding(
        padding: padding ?? EdgeInsets.all(10.r),
        child: shimmerLoadingWidget(
            width: width ?? Get.width / 2.2.w,
            height: height ?? 270.h,
            borderRadius: borderRadius ?? 20.r),
      ),
    ),
  );
}

Widget shimmerLoadingGreedViewWidget({
  double? height,
  EdgeInsetsGeometry? padding,
}) {
  return MasonryGridView.count(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    padding: EdgeInsets.zero,
    crossAxisCount: 2,
    mainAxisSpacing: 10.h,
    crossAxisSpacing: 10.w,
    itemCount: 6,
    itemBuilder: (context, index) {
      return shimmerLoadingWidget(height: height ?? 230.h);
    },
  );
}
