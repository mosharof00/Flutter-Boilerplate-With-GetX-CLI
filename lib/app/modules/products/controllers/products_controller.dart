import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/data/models/products_model.dart';
import 'package:get/get.dart';

import '../../../core/network/handle_exceptions.dart';
import '../../../data/repositories/product_repository.dart';
import '../../../widgets/fetch_mixins.dart';

class ProductsController extends GetxController {
  final IProductRepository _repo = Get.find<IProductRepository>();

  final productList = <Product>[].obs;
  bool isFetching = true;
  final isLoadingMore = false.obs;
  bool isEndPage = false;
  int pagination = 10;
  final currentPage = 0.obs;
  final scrollController = ScrollController();

  Future<void> fetchData({bool isRefresh = true}) async {
    if (isLoadingMore.value) return;

    try {
      if (isRefresh) {
        currentPage.value = 0;
        isEndPage = false;
        isFetching = true;
        update(['refresh']);
      }

      isLoadingMore.value = true;

      final response = await _repo.getProducts(
        limit: pagination,
        skip: currentPage.value * pagination,
      );

      final products = response.products ?? [];

      if (currentPage.value == 0) {
        productList.value = products;
      } else {
        productList.addAll(products);
      }

      if (products.length < pagination) isEndPage = true;
      currentPage.value++;
    } catch (e) {
      handleException(e);
    } finally {
      isLoadingMore.value = false;
      if (isFetching) {
        isFetching = false;
        update(['refresh']);
      }
    }
  }

  void onScrollListener() {
    if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 200 &&
        !isEndPage &&
        !isLoadingMore.value) {
      fetchData(isRefresh: false);
    }
  }

  @override
  void onInit() {
    scrollController.addListener(onScrollListener);
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.removeListener(onScrollListener);
    scrollController.dispose();
    super.onClose();
  }
}
