// lib/app/core/widgets/load_item_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../../data/models/products_model.dart';
import '../extensions/get_currency_extension.dart';
import '../extensions/sizedbox_extension.dart';
import '../theme/app_colors.dart';
import '../widgets/app_text_style.dart';
import '../widgets/cached_image_widget.dart';
import '../widgets/get_image_url.dart';
import '../widgets/view_rating_stars.dart';

class ProductLayout extends StatelessWidget {
  const ProductLayout({
    super.key,
    required this.product,
    this.imgHeight,
    this.imgWidth,
    this.onTap,
  });

  final Product product;
  final VoidCallback? onTap;
  final double? imgHeight;
  final double? imgWidth;

  @override
  Widget build(BuildContext context) {
    double price = product.price ?? 0;
    double discount = product.discountPercentage ?? 0;

    double finalPrice = price * (1 - (discount / 100));

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
                    imgUrl: GetImageUrl.url(product.thumbnail ?? ''),
                    height: imgHeight ?? 130.h,
                    width: imgWidth ?? Get.width,
                    fit: BoxFit.cover,
                  ),
                ),
                product.discountPercentage == null ||
                        product.discountPercentage == 0
                    ? SizedBox.shrink()
                    : Positioned(
                        top: 8.h,
                        left: 0.w,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.r),
                              bottomRight: Radius.circular(5.r),
                            ),
                          ),
                          child: AppTextStyle(
                            text: "${product.discountPercentage}%",
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),

                ///   Wishlist
                // Positioned(
                //   top: 0.h,
                //   right: 0.w,
                //   child: IconButton(
                //     padding: EdgeInsets.zero,
                //
                //     style: ButtonStyle(
                //       backgroundColor: WidgetStatePropertyAll(
                //         Colors.transparent,
                //       ),
                //     ),
                //     onPressed: () {
                //       if (HelperUtils.isLogin) {
                //         homeController.toggleWishlist(productId: product.id!);
                //       } else {
                //         showAuthDialog();
                //       }
                //     },
                //     icon: Obx(
                //           () => Icon(
                //         homeController.wishListedProductId.contains(product.id!)
                //             ? Icons.favorite_sharp
                //             : Icons.favorite_border_sharp,
                //         color:
                //         homeController.wishListedProductId.contains(
                //           product.id!,
                //         )
                //             ? Colors.red.shade800
                //             : Colors.grey.shade400,
                //         size: 20.sp,
                //       ),
                //     ),
                //   ),
                // ),
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
                    text: product.title ?? "N/A",
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                  ),

                  ///  price
                  Row(
                    children: [
                      AppTextStyle(
                        text: finalPrice.getCurrency(),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        maxLines: 1,
                        color: AppColors.primary,
                      ),
                      5.width,
                      product.discountPercentage == null ||
                              product.discountPercentage == 0
                          ? SizedBox.shrink()
                          : AppTextStyle(
                              text: price.getCurrency(),
                              fontSize: 11.sp,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.lineThrough,
                              color: AppColors.grey410,
                            ),
                    ],
                  ),
                  product.rating == 0
                      ? SizedBox.shrink()
                      : ViewSingleRatingStar(
                          rating: product.rating!.toDouble(),
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
