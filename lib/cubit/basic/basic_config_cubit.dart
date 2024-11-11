import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/basic_repository.dart';
import 'package:ceex_flutter/repository/publish_repository.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:retrofit/retrofit.dart';

part 'basic_config_state.dart';

class BasicConfigCubit extends Cubit<BasicConfigState> {
  final _repo = GetIt.I.get<BasicRepository>();
  BasicConfigCubit() : super(BasicConfigState());

  Future<HttpResponse> fetchBasicConfig() async {
    final query = AppConfigQuery(
      appId: "com.bc.broker.ios",
      appVersion: "1.1.0",
      deviceType: "iOS",
      deviceVersion: "iOS 17.2",
      lightModel: 1,
    );
    final resp = await _repo.appConfig(query);
    final model = resp.data;
    final iconMap = model.createTokenIconMap();
    final symbolIconMap = model.createSymbolIconMap();
    emit(state.copyWith(
      configModel: model,
      tokenIconMap: iconMap,
      symbolIconMap: symbolIconMap,
    ));
    return resp;
  }
}
