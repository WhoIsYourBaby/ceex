import 'package:flutter/material.dart';

/// 使用图片制作icon
class IconWidget extends StatelessWidget {
  final Size size;
  final Image icon;
  final VoidCallback? onTap;
  const IconWidget({
    required this.icon,
    this.size = const Size(24, 24),
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: icon,
      ),
    );
  }
}
