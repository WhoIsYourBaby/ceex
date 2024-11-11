import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/publish_repository.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

/// 在widget中获取用户信息使用AuthCubit
/// 非widget中获取用户信息使用UserInfoManager

class AuthCubit extends Cubit<AuthState> {
  UserBaseInfoModel? userBaseInfo;
  AuthCubit({UserBaseInfoModel? userBaseInfo})
      : super(
          AuthState.initial(userBaseInfo: userBaseInfo),
        );

  final _userRepo = GetIt.I<UserRepository>();

  /// 登录/登出基本信息
  Future<void> requestUserBaseInfo() async {
    try {
      final resp = await _userRepo.getBaseInfo();
      UserInfoManager.shared.saveUserBaseInfo(resp.data);
      emit(state.copyWith(userBaseInfo: resp.data));
    } catch (e) {
      emit(state.copyWith(userBaseInfo: null));
    }
  }

  getVersion() {
    final repo = GetIt.I.get<PublishRepository>();
    PackageInfo? packageInfo;
    PackageInfo.fromPlatform().then((value) {
      packageInfo = value;
    final formData = FormData.fromMap({
      "app_id": "com.bc.broker.ios",
      "app_version": "${packageInfo?.version ?? ""}",
      "device_type": "${Platform.operatingSystem}",
    });
    final resp = repo.versionConfig(formData);
    resp.then((value) {
      emit(state.copyWith(needForceUpdate: value.data.needForceUpdate));
    });
    });
  }
}
