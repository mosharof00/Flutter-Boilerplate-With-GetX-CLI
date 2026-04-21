// lib/app/core/widgets/load_item_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:reedsexpressllc_flutter/app/core/theme/app_colors.dart';
import 'package:reedsexpressllc_flutter/app/core/widgets/app_text_style.dart';
import 'package:reedsexpressllc_flutter/app/core/widgets/custom_svg_image.dart';
import 'package:reedsexpressllc_flutter/app/data/models/load_model.dart';
import 'package:reedsexpressllc_flutter/gen/assets.gen.dart';

import '../constants/enums.dart';
import '../theme/app_colors.dart';
import '../widgets/app_text_style.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({
    super.key,
    required this.product,
    this.imgHeight,
    this.imgWidth,
    this.onTap,
  });

  final ProductModel product;
  final VoidCallback? onTap;
  final double? imgHeight;
  final double? imgWidth;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap:
      onTap ??
              () {
            Get.back();
          },
      child: Container(
        width: imgWidth,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 2.r,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.r),
                    topRight: Radius.circular(15.r),
                  ),
                  child: cachedImageWidget(
                    imgUrl: GetImageUrl.url(product.image!),
                    height: imgHeight ?? 130.h,
                    width: imgWidth ?? Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
                product.discountType == null || product.discountType == "flat"
                    ? SizedBox.shrink()
                    : Positioned(
                  top: 8.h,
                  left: 0.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    decoration: BoxDecoration(
                      color: ColorName.primaryColor,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5.r),
                        bottomRight: Radius.circular(5.r),
                      ),
                    ),
                    child: AppTextStyle(
                      text: "${product.discountValue}%",
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  top: 0.h,
                  right: 0.w,
                  child: IconButton(
                    padding: EdgeInsets.zero,

                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.transparent,
                      ),
                    ),
                    onPressed: () {
                      if (HelperUtils.isLogin) {
                        homeController.toggleWishlist(productId: product.id!);
                      } else {
                        showAuthDialog();
                      }
                    },
                    icon: Obx(
                          () => Icon(
                        homeController.wishListedProductId.contains(product.id!)
                            ? Icons.favorite_sharp
                            : Icons.favorite_border_sharp,
                        color:
                        homeController.wishListedProductId.contains(
                          product.id!,
                        )
                            ? Colors.red.shade800
                            : Colors.grey.shade400,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            5.height,
            Padding(
              padding: EdgeInsets.all(5.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                spacing: 5.h,
                children: [
                  AppTextStyleOverFlow(
                    text: product.productName!,
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),
                  Row(
                    children: [
                      AppTextStyle(
                        text:
                        product.defaultPrice == product.discountPrice
                            ? product.defaultPrice!.getCurrency()
                            : product.discountPrice!.getCurrency(),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        color: ColorName.primaryColor,
                      ),
                      5.width,
                      product.defaultPrice == product.discountPrice
                          ? SizedBox.shrink()
                          : AppTextStyle(
                        text: product.defaultPrice!.getCurrency(),
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.lineThrough,
                        color: ColorName.gray410,
                      ),
                    ],
                  ),
                  product.reviewsAvgRating == 0
                      ? SizedBox.shrink()
                      : ViewSingleRatingStar(
                    rating: product.reviewsAvgRating!.toDouble(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}