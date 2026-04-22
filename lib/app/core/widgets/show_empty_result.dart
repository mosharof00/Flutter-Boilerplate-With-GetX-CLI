import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../gen/assets.gen.dart';
import '../extensions/sizedbox_extension.dart';
import 'app_text_style.dart';
import 'global_button.dart';

class ShowEmptyResult extends StatelessWidget {
  const ShowEmptyResult({
    super.key,
    this.height,
    this.width,
    this.title,
    this.desc,
    this.widget,
    this.refreshOnTap,
  });
  final double? height;
  final double? width;

  final String? title;
  final String? desc;
  final Widget? widget;
  final VoidCallback? refreshOnTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              Assets.images.emptyBox.path,
              height: 100.h,
              width: 100.w,
            ),
            20.height,
            AppTextStyle(
              text: title ?? 'No response found!',
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
            ),
            5.height,
            if (desc != null)
              AppTextStyle(
                text: desc!,
                fontSize: 14,
                fontWeight: FontWeight.w400,
                textAlign: TextAlign.center,
              ),
            if (refreshOnTap != null)
              Padding(
                padding: EdgeInsets.only(top: 10.h),
                child: globalButton(
                  height: 35.h,
                  width: 150.w,
                  onTap: refreshOnTap ?? () {},
                  text: "Refresh",
                ),
              ),
            widget != null ? 30.height : 0.width,
            widget ?? 0.width,
          ],
        ),
      ),
    );
  }
}
