import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// 必要的：关联 `main.dart` 到 Freezed 代码生成器
part 'kline_model.freezed.dart';
// 可选的：因为 Person 类是可序列化的，所以我们必须添加这一行。
// 但是如果 Person 不是可序列化的，我们可以跳过它。
part 'kline_model.g.dart';

/// k线相关接口关联的model都定义在这个文件中
/// 以此类推

/// 聚合k线返回model
@freezed
class KlineModel with _$KlineModel {
  const KlineModel._();
  const factory KlineModel({
    /// time
    num? t,
    /// symbol
    String? s,
    /// close price
    String? c,
    /// high price
    String? h,
    /// low price
    String? l,
    /// open price
    String? o,
    /// volume
    String? v,
    /// quote * volume
    String? qv,
    /// margin 涨跌幅
    String? m,
    /// exchangeId
    int? e,
  }) = _KlineModel;

  factory KlineModel.fromJson(Map<String, Object?> json) =>
      _$KlineModelFromJson(json);
}




/// 聚合k线查询参数
/// symbol 必填 币对列表，最多20个币对，多余的会截取, ex: BTCUSDT,OKBUSDT
/// exchangeId 必填 交易所ID
/// interval 必填 K线类型(1m,5m,15m,30m,1h,2h,4h,6h,8h,12h,1d,3d,1w,1M)
/// limit 选填 最大为200
@freezed
class MultiKlineQuery with _$MultiKlineQuery {
  const factory MultiKlineQuery({
    String? symbol,
    num? exchangeId,
    String? interval,
    num? limit,
  }) = _MultiKlineQuery;

  factory MultiKlineQuery.fromJson(Map<String, Object?> json) =>
      _$MultiKlineQueryFromJson(json);
}


/// k线查询参数
/// symbol exchangId.symbol
/// interval 必填 K线类型(1m,5m,15m,30m,1h,2h,4h,6h,8h,12h,1d,3d,1w,1M)
/// limit 选填 最大为200
/// to 时间戳
@freezed
class KlineQuery with _$KlineQuery {
  const factory KlineQuery({
    String? symbol,
    String? interval,
    @Default(300) num? limit,
    @Default("24h") String? realtimeInterval,
    //  时间戳
    String? to,
  }) = _KlineQuery;

  factory KlineQuery.fromJson(Map<String, Object?> json) =>
      _$KlineQueryFromJson(json);
}
