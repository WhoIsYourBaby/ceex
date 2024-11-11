import 'package:ceex_flutter/utils/enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ws_trade_model.freezed.dart';
part 'ws_trade_model.g.dart';

/// ws-订单
@freezed
class WsTradeModel with _$WsTradeModel {
  const factory WsTradeModel({
    /// 时间
    num? t,
    /// 价格
    String? p,
    /// 成交量
    String? q,
    /// 是否卖true is buy, flase is sell
    bool? m,
  }) = _WsTradeModel;

  factory WsTradeModel.fromJson(Map<String, Object?> json) =>
      _$WsTradeModelFromJson(json);
}