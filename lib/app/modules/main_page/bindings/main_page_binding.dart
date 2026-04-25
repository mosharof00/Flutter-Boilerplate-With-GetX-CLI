import 'package:flutter_boilerplate_with_getx_cli/app/modules/products/controllers/products_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_page_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
    Get.lazyPut<ProductsController>(() => ProductsController());
  }
}
