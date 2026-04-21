
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import '../../../gen/assets.gen.dart';
import '../extensions/sizedbox_extension.dart';

import '../widgets/app_text_style.dart';
import '../widgets/cross_button.dart';
import '../widgets/global_button.dart';


class CustomDialogs {
  // static Future<void> orderOffAlert({
  //   required BuildContext context,
  //   required AlertData alert,
  // }) async {
  //   await showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Stack(
  //         children: [
  //           Dialog(
  //             backgroundColor: Colors.transparent,
  //             child: Stack(
  //               children: [
  //                 SizedBox(
  //                   height: 320.h,
  //                   width: Get.width,
  //                   child: Container(
  //                     height: Get.height,
  //                     width: Get.width,
  //                     margin: EdgeInsets.all(25.r),
  //                     padding: EdgeInsets.symmetric(horizontal: 5.w,vertical: 20.h),
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(10.r),
  //                     ),
  //                     child: Column(
  //                       children: [
  //                         60.height,
  //                         alert.expireTime != null?Padding(
  //                           padding:  EdgeInsets.only(bottom: 10.h),
  //                           child: Align(
  //                             alignment: Alignment.center,
  //                             child: CountdownTimerWidget(
  //                               expireDate: alert.expireTime!,
  //                             ),
  //                           ),
  //                         ):SizedBox.shrink(),
  //
  //                         AppTextStyle(
  //                           text: alert.title!.capitalize!,
  //                           fontSize: 15.sp,
  //                           fontWeight: FontWeight.w500,
  //                         ),
  //                         AppTextStyle(
  //                           text: alert.discount!,
  //                           color: Colors.red,
  //                           fontSize: 50.sp,
  //                           fontWeight: FontWeight.w700,
  //                         ),
  //                         AppTextStyle(
  //                           text: alert.type!,
  //                           fontSize: 14.sp,
  //                           fontWeight: FontWeight.w400,
  //                         ),
  //                         10.height,
  //                         globalButton(
  //                           onTap: () {
  //                             HiveService.setAlertShowed(true);
  //                             Get.back();
  //                             UrlLauncher.url(alert.link ?? '');
  //                           },
  //                           text: 'Get it',
  //                           height: 30.h,
  //                           width: 80.w,
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     ClipRRect(
  //                       borderRadius: BorderRadius.circular(100.r),
  //                       child: Image.asset(
  //                         Assets.images.flashImage.path,
  //                         height: 80.h,
  //                         width: 80.w,
  //                         fit: BoxFit.cover,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Positioned(
  //                   top: 0.h,
  //                   right: 0.w,
  //                   child: crossButton(
  //                     onTap: () {
  //                       Navigator.pop(context);
  //                     },
  //                     iconColor: Colors.black,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }



  // static Future flashSaleAlert({required BuildContext context}) {
  //   return showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return Stack(
  //         children: [
  //           Dialog(
  //             backgroundColor: Colors.transparent,
  //             child: Stack(
  //               // clipBehavior: Clip.none,
  //               children: [
  //                 SizedBox(
  //                   height: 300.h,
  //                   width: Get.width,
  //                   child: Container(
  //                     // clipBehavior: Clip.none,
  //                     height: Get.height,
  //                     width: Get.width,
  //                     margin: EdgeInsets.all(25.r),
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(20.r),
  //                     ),
  //                     child: Container(
  //                       height: Get.height,
  //                       width: Get.width,
  //                       padding: EdgeInsets.all(15.r),
  //                       decoration: BoxDecoration(
  //                         color: AppColors.primary.withAlpha(50),
  //                         borderRadius: BorderRadius.circular(20.r),
  //                       ),
  //                       child: Column(
  //                         children: [
  //                           75.height,
  //                           // Image.asset(),
  //                           Row(
  //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                             children: [
  //                               SvgPicture.asset(
  //                                 Assets.icons.congratsLeftIcon,
  //                                 height: 25.h,
  //                                 width: 25.w,
  //                               ),
  //                               AppTextStyle(
  //                                 text: "Flash Sale Alert!",
  //                                 color: AppColors.primary,
  //                                 fontSize: 18.sp,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                               SvgPicture.asset(
  //                                 Assets.icons.congratsRightIcon,
  //                                 height: 25.h,
  //                                 width: 25.w,
  //                               ),
  //                             ],
  //                           ),
  //                           10.height,
  //
  //                           Row(
  //                             crossAxisAlignment: CrossAxisAlignment.center,
  //                             mainAxisAlignment: MainAxisAlignment.center,
  //                             children: [
  //                               AppTextStyle(
  //                                 text: "Get",
  //                                 fontSize: 14.sp,
  //                                 fontWeight: FontWeight.w500,
  //                               ),
  //                               10.width,
  //                               AppTextStyle(
  //                                 text: "30%",
  //                                 color: Colors.green,
  //                                 fontSize: 18.sp,
  //                                 fontWeight: FontWeight.w600,
  //                               ),
  //                               10.width,
  //                               AppTextStyle(
  //                                 text: "off all time in",
  //                                 fontSize: 14.sp,
  //                                 fontWeight: FontWeight.w500,
  //                               ),
  //                             ],
  //                           ),
  //                           5.height,
  //                           CountdownTimerWidget(
  //                             expireDate: controller.expireDate.value!,
  //                           ),
  //                           20.height,
  //                           globalButton(
  //                             onTap: () {
  //                               Get.back();
  //                             },
  //                             text: 'Get it',
  //                             height: 30.h,
  //                             width: 80.w,
  //                           ),
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Material(
  //                       elevation: 4,
  //                       borderRadius: BorderRadius.circular(100),
  //                       child: ClipRRect(
  //                         borderRadius: BorderRadius.circular(50.r),
  //                         child: Image.asset(
  //                           Assets.images.flashImage.path,
  //                           height: 100.h,
  //                           width: 100.w,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Positioned(
  //                   top: 0.h,
  //                   right: 0.w,
  //                   child: crossButton(
  //                     onTap: () {
  //                       Get.back();
  //                     },
  //                     iconColor: Colors.white,
  //                     bgColor: AppColors.primary.withAlpha(50),
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  static Future customFlashSaleAlert({required BuildContext context}) {
    return customAlertDialog(
      context: context,
      height: 300.h,
      // headerWidget: SizedBox(),
      backgroundImage: DecorationImage(
        fit: BoxFit.cover,
        image: AssetImage(Assets.images.placeholderImage.path),
        // colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)
      ),
      titleWidget: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextStyle(
            text: "Get",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
          10.width,
          AppTextStyle(
            text: "30%",
            color: Colors.yellow,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
          ),
          10.width,
          AppTextStyle(
            text: "off all time in",
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ],
      ),
      crossButton: crossButton(
        onTap: () {
          Get.back();
        },
      ),
    );
  }
}



Future customAlertDialog({
  required BuildContext context,
  required Widget crossButton,
  double? height,
  double? width,
  Color? bgColor,
  DecorationImage? backgroundImage,
  BorderRadius? borderRadius,
  Widget? headerBgImage,
  Widget? headerWidget,
  Widget? titleWidget,
  String? titleText,
  double? titleFontSize,
  FontWeight? titleFontWeight,
  Widget? subTitleWidget,
  VoidCallback? onTap,
  String? buttonText,
}) {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Stack(
          children: [
            Dialog(
              backgroundColor: Colors.transparent,
              child: Stack(
                // clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: height ?? 310.h,
                    width: width ?? Get.width,
                    child: Padding(
                      padding: EdgeInsets.all(20.r),
                      child: Container(
                        height: Get.height,
                        width: Get.width,
                        decoration: BoxDecoration(
                          color: bgColor ?? Colors.white,
                          borderRadius:
                          borderRadius ?? BorderRadius.circular(20.r),
                          image:backgroundImage ?? DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(Assets.images.placeholderImage.path),
                              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn)

                          ),
                        ),
                        child: Container(
                          height: Get.height,
                          width: Get.width,
                          decoration: BoxDecoration(
                            // color: AppColors.primary.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Stack(children: [
                                headerBgImage ??
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(20.r),
                                      child: Image.network(
                                        "https://img.pikbest.com/background/20220119/black-friday-gold-gift-box-e-commerce-background_6225317.jpg!w700wp",
                                        width: Get.width,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                Positioned(
                                  top: 50.h,
                                  bottom: 50.h,
                                  left: 50.w,
                                  right: 50.w,
                                  child: headerWidget ??
                                      AppTextStyle(
                                        text: "Flash Sale Alert!",
                                        color: Colors.white,
                                        textAlign: TextAlign.center,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                )
                              ]),
                              10.height,
                              titleWidget ??
                                  AppTextStyle(
                                    text: titleText ?? "Get 30",
                                    fontSize: titleFontSize ?? 14.sp,
                                    fontWeight:
                                    titleFontWeight ?? FontWeight.w500,
                                  ),
                              10.height,
                              subTitleWidget ??
                                  SizedBox.shrink(),
                              20.height,
                              globalButton(
                                onTap: onTap ??
                                        () {
                                      Get.back();
                                    },
                                text: buttonText ?? 'Get it',
                                fontWeight: FontWeight.w500,
                                fontSize: 15.sp,
                                height: 30.h,
                                width: 80.w,
                                shadowColor: Colors.transparent,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(top: 0.h, right: 0.w, child: crossButton)
                ],
              ),
            ),
          ],
        );
      });
}
