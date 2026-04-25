import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../layouts/product_layout.dart';
import '../../../widgets/appbar_title.dart';
import '../../../widgets/global_loading.dart';
import '../../../widgets/show_empty_result.dart';
import '../controllers/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.background,
        title: AppBarTitle("Products"),
        centerTitle: true,
      ),
      body: GetBuilder<ProductsController>(
        id: 'refresh_product',
        builder: (controller) {
          if (controller.isInit) {
            return GlobalLoading();
          } else if (controller.productList.isEmpty) {
            return ShowEmptyResult(
              title: "No product found!",
              desc: "Please try again letter",
              refreshOnTap: () {
                controller.fetchProducts();
              },
            );
          } else {
            return RefreshIndicator(
              color: AppColors.primary,
              onRefresh: () async {
                controller.fetchProducts();
              },
              child: NotificationListener(
                onNotification: (ScrollNotification scrollInfo) {
                  if (scrollInfo.metrics.pixels ==
                          scrollInfo.metrics.maxScrollExtent &&
                      controller.isEndPage == false &&
                      controller.isLoading.value == false) {
                    controller.fetchProducts(isRefresh: false);
                  }
                  return false;
                },
                child: Obx(
                  () => MasonryGridView.count(
                    padding: EdgeInsets.only(
                      left: 15.w,
                      right: 15.w,
                      top: 10.h,
                      bottom: 50.h,
                    ),
                    crossAxisCount: 2,
                    mainAxisSpacing: 20.h,
                    crossAxisSpacing: 20.w,
                    itemCount:
                        controller.productList.length +
                        (controller.isLoading.value ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == controller.productList.length &&
                          controller.isLoading.value) {
                        return GlobalLoading();
                      } else {
                        return ProductLayout(
                          product: controller.productList[index],
                        );
                      }
                    },
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
