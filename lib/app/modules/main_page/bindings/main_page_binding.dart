import 'package:flutter_boilerplate_with_getx_cli/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/modules/products/controllers/products_controller.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/modules/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/main_page_controller.dart';

/// Route-scoped: these controllers live while the main page is in the stack
/// and are disposed when it leaves (e.g. on logout). Use
/// `HelperUtils.backToMain()` instead of `Get.offAllNamed(Routes.MAIN_PAGE)`
/// to return here without recreating them.
class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainPageController>(() => MainPageController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProductsController>(() => ProductsController());
    Get.lazyPut<ProfileController>(() => ProfileController());
  }
}
