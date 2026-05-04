import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/data/models/products_model.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/widgets/fetch_mixins.dart';
import 'package:get/get.dart';

import '../../../core/network/handle_exceptions.dart';
import '../../../data/repositories/product_repository.dart';

class ProductsController extends GetxController with PaginatedFetchMixin {
  final IProductRepository _repo = Get.find<IProductRepository>();

  final productList = <Product>[].obs;

  @override
  Future<void> fetchPage(int page) async {
    final response = await _repo.getProducts(
      limit: pagination,
      skip: page * pagination,
    );

    final products = response.products ?? [];

    if (page == pageBase) {
      productList.value = products;
    } else {
      productList.addAll(products);
    }

    if (products.length < pagination) isEndPage = true;
  }

  @override
  void onFetchError(dynamic e) => handleException(e);
}
