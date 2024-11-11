import 'package:ceex_flutter/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_model.freezed.dart';
part 'ws_model.g.dart';

@freezed
class WsRequestModel with _$WsRequestModel {
  const factory WsRequestModel({
    @Default("1") String id,
    required String event,
    required String topic,
    String? symbol,
    required WsRequestParamsModel params,
  }) = _WsRequestModel;

  factory WsRequestModel.fromJson(Map<String, Object?> json) =>
      _$WsRequestModelFromJson(json);
}

extension WsRequestCancel on WsRequestModel {
  WsRequestModel cancel() {
    return copyWith(
      event: WsEventType.cancel.value,
    );
  }
}

@freezed
class WsRequestParamsModel with _$WsRequestParamsModel {
  const factory WsRequestParamsModel({
    /// 是否开启zip压缩 true/false
    String? binary,
    String? limit,
    String? org,

    /// 1m, 5m, 15m, 30m, 1h, 2h, 4h, 6h, 12h, 1d, 1d+8, 1w, 1w+8, 1M, 1M+8
    String? realtimeInterval,

    /// mergedDepth, diffMergedDepth; 合并的档位
    @JsonKey(name: "dump_scale") String? dumpScale,
  }) = _WsRequestParamsModel;

  factory WsRequestParamsModel.fromJson(Map<String, Object?> json) =>
      _$WsRequestParamsModelFromJson(json);
}

@Freezed(genericArgumentFactories: true)
sealed class WsResponseModel<T> with _$WsResponseModel<T> {
  const factory WsResponseModel({
    String? id,
    String? topic,
    num? sendTime,
    T? data,
  }) = _WsResponseModel;

  factory WsResponseModel.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$WsResponseModelFromJson(json, fromJsonT);
}
