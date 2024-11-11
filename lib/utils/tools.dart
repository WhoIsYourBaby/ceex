import 'package:flutter/material.dart';

/// [nowWidth] 在本分辨率中显示的真正的宽度
/// 返回根据现在宽度等比缩放的Size
Size scaleSizeFromWidth(
  Size originSize,
  double nowWidth,
) {
  return Size(nowWidth, originSize.height * nowWidth / originSize.width);
}
