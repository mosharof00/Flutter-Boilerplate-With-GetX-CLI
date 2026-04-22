import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_boilerplate_with_getx_cli/app/widgets/shimmer_loading.dart';
import 'package:flutter_svg/svg.dart';
import '../../../gen/assets.gen.dart';

Widget cachedImageWidget({
  required String imgUrl,
  double? height,
  double? width,
  BoxFit? fit,
  double? borderRadius,
  BorderRadiusGeometry? specificBorderRadius,
}) {
  final isSvg = imgUrl.toLowerCase().endsWith('.svg');

  return ClipRRect(
    borderRadius:
        specificBorderRadius ?? BorderRadius.circular(borderRadius ?? 0),
    child: isSvg
        ? SvgPicture.network(
            imgUrl,
            height: height,
            width: width,
            fit: fit ?? BoxFit.contain,
            placeholderBuilder: (_) => shimmerLoadingWidget(
              borderRadius: borderRadius ?? 0,
              height: height,
              width: width,
            ),
          )
        : CachedNetworkImage(
            imageUrl: imgUrl,
            width: width,
            height: height,
            fit: fit ?? BoxFit.cover,
            placeholder: (context, url) => shimmerLoadingWidget(
              borderRadius: borderRadius ?? 0,
              height: height,
              width: width,
            ),
            errorWidget: (context, url, error) => Image.asset(
              Assets.images.placeholderImage.path,
              height: height,
              width: width,
              fit: BoxFit.cover,
            ),
          ),
  );
}
