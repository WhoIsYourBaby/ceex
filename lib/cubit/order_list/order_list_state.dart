part of 'order_list_cubit.dart';

@freezed
class OrderListState with _$OrderListState {
  const factory OrderListState.initial({
    @Default(OrderListViewType.deposit) OrderListViewType viewType,
    List<OrderListModel>? depositList,
    List<OrderListModel>? withdrawList,
    List<AssetsBalanceFlowModel>? otherList,
  }) = _Initial;
}
