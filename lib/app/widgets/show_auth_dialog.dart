import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';

import '../core/utils/dialog_utils.dart';
import '../core/utils/helper_utils.dart';
import '../routes/app_pages.dart';


void showAuthDialog() {
  return DialogUtils.showDialog(
    dialogType: DialogType.info,
    dismissOnBackKeyPress: false,
    dismissOnTouchOutside: true,
    context: Get.context!,
    title: 'You are Unauthenticated!',
    description: 'Please Login / Signup',
    okOnPress: () {
      Get.offAllNamed(Routes.LOGIN);
      HelperUtils.deleteMainControllers();
    },
  );
}
