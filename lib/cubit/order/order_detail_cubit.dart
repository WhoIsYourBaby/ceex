import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'order_detail_state.dart';
part 'order_detail_cubit.freezed.dart';

class OrderDetailCubit extends Cubit<OrderDetailState> {
  final repo = GetIt.I.get<UserRepository>();
  OrderDetailCubit() : super(const OrderDetailState.initial());

  getOrderDetail(String orderId) {
    showLoading();
    final formData = FormData.fromMap({"order_id": orderId});
    final resp = repo.orderMatchInfo(formData);
    resp.then((value) {
      dismissAllToast();
      print("orderdetail${value.data}");
      if (value.data.isNotEmpty) {
        emit(state.copyWith(orderModel: value.data[0]));
        emit(state.copyWith(showItem: true));
      } else {
        emit(state.copyWith(showItem: false));
      }
    });
  }
}
