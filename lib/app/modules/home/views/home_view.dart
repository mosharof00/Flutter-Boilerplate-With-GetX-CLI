import 'package:flutter/material.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/extensions/sizedbox_extension.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/extensions/text_style_extension.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/widgets/app_text.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/widgets/appbar_title.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import '../../../../gen/assets.gen.dart';
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
          Center(child: Assets.logos.appLogo.image(width: 100.w)),

          20.height,
          AppText(
            "Welcome to Flutter Boilerplate with GetX CLI",
            style: context.titleMedium.copyWith(fontSize: 25.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
