import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/core/theme/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class GlobalLoading extends StatelessWidget {
  const GlobalLoading({super.key, this.size});

  final double? size;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.threeArchedCircle(
          color: AppColors.primary, size: size ?? 35.sp),
    );
  }
}
