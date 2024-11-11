import 'package:ceex_flutter/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_diff_depth_model.freezed.dart';
part 'ws_diff_depth_model.g.dart';

/// ws-订单
@freezed
class WsDiffDepthModel with _$WsDiffDepthModel {
  const factory WsDiffDepthModel({
    int? e,
    num? t,
    String? v,
    List<List<String>?>? b,
    List<List<String>?>? a,
    int? o,
  }) = _WsDiffDepthModel;

  factory WsDiffDepthModel.fromJson(Map<String, Object?> json) =>
      _$WsDiffDepthModelFromJson(json);
}
