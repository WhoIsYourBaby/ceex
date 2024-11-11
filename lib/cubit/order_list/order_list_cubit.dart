import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/assets/assets_balance_flow_model.dart';
import 'package:ceex_flutter/model/assets/order_list_model.dart';
import 'package:ceex_flutter/repository/assets_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'order_list_state.dart';
part 'order_list_cubit.freezed.dart';

enum OrderListViewType {
  deposit,
  withdraw,
  other,
}

class OrderListCubit extends Cubit<OrderListState> {
  final String tokenId;
  OrderListCubit({
    required this.tokenId,
  }) : super(OrderListState.initial());

  void selectTab(OrderListViewType type) {
    emit(state.copyWith(viewType: type));
    refresh();
  }

  Future refresh() async {
    if (state.viewType == OrderListViewType.withdraw) {
      return await requestWithdraw();
    } else if (state.viewType == OrderListViewType.deposit) {
      return await requestDeposit();
    } else {
      return await requestOther();
    }
  }

  Future loadMore() async {
    if (state.viewType == OrderListViewType.withdraw) {
      final lastId = (state.withdrawList ?? []).last.orderId;
      return await requestWithdraw(lastId);
    } else if (state.viewType == OrderListViewType.deposit) {
      final lastId = (state.depositList ?? []).last.orderId;
      return await requestDeposit(lastId);
    } else {
      final lastId = (state.otherList ?? []).last.id;
      return await requestOther(lastId);
    }
  }

  Future requestWithdraw([String? lastOrderId]) async {
    final repo = GetIt.I.get<AssetsRepository>();
    final resp = await repo.withdrawOrderList(20, tokenId, lastOrderId);
    final dataList = resp.data;
    if (lastOrderId == null) {
      emit(state.copyWith(withdrawList: dataList));
    } else {
      final oldList = state.withdrawList ?? [];
      emit(state.copyWith(withdrawList: oldList + dataList));
    }
    return resp;
  }

  Future requestDeposit([String? lastOrderId]) async {
    final repo = GetIt.I.get<AssetsRepository>();
    final resp = await repo.depositOrderList(20, tokenId, lastOrderId);
    final dataList = resp.data;
    if (lastOrderId == null) {
      emit(state.copyWith(depositList: dataList));
    } else {
      final oldList = state.depositList ?? [];
      emit(state.copyWith(depositList: oldList + dataList));
    }
    return resp;
  }

  Future requestOther([String? lastOrderId]) async {
    final repo = GetIt.I.get<AssetsRepository>();
    final resp = await repo.otherOrderList(20, tokenId, lastOrderId);
    final dataList = resp.data;
    if (lastOrderId == null) {
      emit(state.copyWith(otherList: dataList));
    } else {
      final oldList = state.otherList ?? [];
      emit(state.copyWith(otherList: oldList + dataList));
    }
    return resp;
  }
}
