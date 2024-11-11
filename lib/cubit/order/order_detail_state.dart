part of 'order_detail_cubit.dart';

@freezed
class OrderDetailState with _$OrderDetailState {
  const factory OrderDetailState.initial({
    OrderModel? orderModel,
    bool? showItem,
  }) = _Initial;
}