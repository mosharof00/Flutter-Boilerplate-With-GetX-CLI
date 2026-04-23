import 'package:flutter_boilerplate_with_getx_cli/app/core/network/api_service.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/data/models/products_model.dart';
import 'package:get/get.dart';

import '../../../core/network/handle_exceptions.dart';

class ProductsController extends GetxController {
  //TODO: Implement ProductsController
  final IApiService _apiService = Get.find<IApiService>();

  final menuWithRestaurantList = <Product>[].obs;
  bool isInit = false;
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

      final response = await _apiService.getProducts(
        // pagination: pagination,
        // page: currentPage.value,
      );

      if (currentPage.value == 0) {
        menuWithRestaurantList.value = response.products!;
      } else {
        menuWithRestaurantList.addAll(response.products!);
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
