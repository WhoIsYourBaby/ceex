import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/repository/contract_repository.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'order_state.dart';
part 'order_cubit.freezed.dart';

class OrderCubit extends Cubit<OrderState> {
  List<SymbolModel>? fullSymbols;
  final repo = GetIt.I.get<UserRepository>();
  OrderCubit() : super(const OrderState.initial());

  getOrderList({required OrderType orderType}) {
    switch (orderType) {
      case OrderType.now: // 获取当前委托
        getNowOrderList();
        break;
      case OrderType.history: // 获取历史委托
        getHistoryOrderList();
        break;
      case OrderType.transaction: // 获取历史成交
        getHistoryTransactionList();
        break;
      default:
    }
  }

  // 获取当前委托
  getNowOrderList() {
    showLoading();
    final formData = FormData.fromMap({});
    final resp = repo.orderOpenOrders(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(nowOrderList: value.data));
    });
  }

  // 获取历史委托
  getHistoryOrderList() {
    showLoading();
    final formData = FormData.fromMap({});
    final resp = repo.orderTradeOrders(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(historyOrderList: value.data));
    });
  }

  // 获取历史成交
  getHistoryTransactionList() {
    showLoading();
    final formData = FormData.fromMap({});
    final resp = repo.orderMyTrades(formData);
    resp.then((value) {
      dismissAllToast();
      emit(state.copyWith(historyTransaction: value.data));
    });
  }

  cancelOrder(OrderModel orderModel) {
    showLoading();
    final repo = GetIt.I.get<ContractRepository>();
    final formData = FormData.fromMap({
      "client_order_id": orderModel.clientOrderId,
      "order_id": orderModel.orderId
    });
    final resp = repo.orderCancel(formData);
    resp.then((value) {
      dismissAllToast();
      getNowOrderList();
      getHistoryOrderList();
      getHistoryTransactionList();
    });
  }
}
