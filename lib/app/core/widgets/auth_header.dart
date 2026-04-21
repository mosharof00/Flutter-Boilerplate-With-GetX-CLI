import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../extensions/sizedbox_extension.dart';
import '../theme/app_colors.dart';
import 'app_text_style.dart';
import 'custom_icon_button.dart';

Widget authHeader({
  required String title,
  String? subTitle,
  double? height,
  double? width,
  bool isBackButton = false,
}) {
  return SizedBox(
    height:height?? 100.h,
    width: width ?? Get.width,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          if (isBackButton)
            Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: CustomIconButton(),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppTextStyle(
                  text: title,
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w600,
                ),
                5.height,
                subTitle == null
                    ? SizedBox.shrink()
                    : AppTextStyle(text: subTitle, color: AppColors.hintText),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
