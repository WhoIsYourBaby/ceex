part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial({
    List<OrderModel>? nowOrderList,// 当前订单
    List<OrderModel>? historyOrderList,// 历史订单
    List<OrderModel>? historyTransaction,// 历史成交
  }) = _Initial;
}
enum OrderType{
  now,
  history,
  transaction,
}
