import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'google_ver_state.dart';
part 'google_ver_cubit.freezed.dart';

class GoogleVerCubit extends Cubit<GoogleVerState> {
  GoogleVerCubit() : super(const GoogleVerState.initial());

  // 获取绑定GA数据
  void getBeforeBindGa() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.beforeBindGa();
    resp.then((value) {
      emit(state.copyWith(
          qrcode: value.data.qrcode,
          authUrl: value.data.authUrl,
          secretKey: value.data.secretKey));
      dismissAllToast();
    });
  }

  // 绑定GA
  void bindGa() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final formData = FormData.fromMap({
      "ga_code": "15", // GA验证码
      "order_id": "15", // 请求验证码返回的orderId
      "verify_code": "15", // 二次验证码
    });
    final resp = repo.bindGa(formData);
    resp.then((value) {
      dismissAllToast();
    });
  }

  // 获取换绑GA数据
  void getBeforeAlterGa() {
    showLoading();
    final repo = GetIt.I.get<UserRepository>();
    final resp = repo.beforeAlterGa();
    resp.then((value) {
      emit(state.copyWith(
          qrcode: value.data.qrcode,
          authUrl: value.data.authUrl,
          secretKey: value.data.secretKey));
      dismissAllToast();
    });
  }
}
