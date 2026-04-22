import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/extensions/sizedbox_extension.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/extensions/text_style_extension.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
import '../../../widgets/app_text.dart';
import '../../../widgets/appbar_title.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: AppBarTitle("Home"), centerTitle: true),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Assets.logos.appLogo.image(width: 200.w,)),

          20.height,
          AppText(
            "Welcome to Flutter Boilerplate with GetX CLI\n by Mosharof Khan",
            style: context.titleMedium.copyWith(fontSize: 25.sp,color: AppColors.primary),
            textAlign: TextAlign.center,

          ),
        ],
      ),
    );
  }
}
