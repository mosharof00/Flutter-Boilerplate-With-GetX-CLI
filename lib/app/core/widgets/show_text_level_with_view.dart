import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/app_colors.dart';
import 'app_text_style.dart';

class ShowTextLevelWithView extends StatelessWidget {
  const ShowTextLevelWithView({
    super.key,
    required this.title,
    this.viewAll,
    this.onTap,
    this.topPadding,
    this.btnColor,
    this.viewAllFontSize,
    this.viewAllFontWeight,
    this.titleFontSize,
    this.textAlign,
    this.paddingLeft,
    this.paddingTop, this.isShowViewAll=true,
  });
  final String title;
  final String? viewAll;
  final VoidCallback? onTap;
  final double? topPadding;
  final Color? btnColor;
  final double? viewAllFontSize;
  final double? paddingLeft;
  final double? paddingTop;
  final double? titleFontSize;
  final TextAlign? textAlign;
  final FontWeight? viewAllFontWeight;
  final bool? isShowViewAll;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.only(
            left: paddingLeft ?? 8.0,
            top: paddingTop ?? 8,
          ),
          child: AppTextStyle(
            text: title,
            textAlign: textAlign,
            fontSize: titleFontSize ?? 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        isShowViewAll == false? SizedBox.shrink(): InkWell(
          onTap: onTap,
          child: AppTextStyle(
            text: viewAll ?? "View All",
            fontSize: viewAllFontSize ?? 14.sp,
            fontWeight: viewAllFontWeight ?? FontWeight.w400,
            color: btnColor ?? AppColors.primary,
          ),
        ),
      ],
    );
  }
}
