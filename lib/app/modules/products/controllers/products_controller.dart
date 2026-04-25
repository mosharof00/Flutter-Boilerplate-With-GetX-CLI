import 'package:flutter_boilerplate_with_getx_cli/app/core/network/api_client.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/data/models/products_model.dart';
import 'package:get/get.dart';

import '../../../core/network/handle_exceptions.dart';
import '../../../data/repositories/product_repository.dart';

class ProductsController extends GetxController {
  //TODO: Implement ProductsController
  final IProductRepository _productRepository = Get.find<IProductRepository>();

  final productList = <Product>[].obs;
  bool isInit = true;
  final isLoading = false.obs;
  bool isEndPage = false;
  int pagination = 10;
  final currentPage = 0.obs;

  Future<void> fetchProducts({bool isRefresh = true}) async {
    try {
      if (isRefresh == true) {
        currentPage.value = 0;
        isEndPage = false;
        isInit = true;
        update(['refresh_product']);
      }
      isLoading.value = true;

      final response = await _productRepository.getProducts(
        // pagination: pagination,
        // page: currentPage.value,
      );

      if (currentPage.value == 0) {
        productList.value = response.products!;
      } else {
        productList.addAll(response.products!);
      }
      currentPage.value++;
      if (response.products!.isEmpty) {
        isEndPage = true;
      }

      if (isInit == true) {
        isInit = false;
        update(['refresh_product']);
      }
    } catch (e) {
      handleException(e);
      if (isInit == true) {
        isInit = false;
        update(['refresh_product']);
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit

    fetchProducts();
    super.onInit();
  }
}
