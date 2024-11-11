import 'package:cached_network_image/cached_network_image.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:flutter/material.dart';

/// 网络图片组件
class NetworkImageWidget extends StatelessWidget {
  final String url;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String assetImage;

  const NetworkImageWidget({
    Key? key,
    required this.url,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
    this.assetImage = R.ASSETS_IMAGES_ELLIPSE_2232_PNG,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit,
      imageUrl: url,
      height: height,
      width: width,
      placeholder: (context, url) => _buildPlaceholder(),
      errorWidget: (context, url, error) => _buildErrorWidget(),
    );
  }

  Widget _buildPlaceholder() {
    return Image.asset(
      assetImage,
      height: height,
      width: width,
    );
  }

  Widget _buildErrorWidget() {
    return Image.asset(
      assetImage,
      height: height,
      width: width,
    );
  }
}