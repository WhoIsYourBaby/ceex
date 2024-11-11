import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/websocket/ws_diff_depth_model.dart';
import 'package:ceex_flutter/model/websocket/ws_model.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contract_diffdepth_state.dart';
part 'contract_diffdepth_cubit.freezed.dart';

class ContractDiffdepthCubit extends Cubit<ContractDiffdepthiState>
    with WsResponseMixin {
  ContractDiffdepthCubit() : super(ContractDiffdepthiState.initial());

  @override
  void subscribe() {
    WsManager.shared.openConnect().then((value) {
      final model = WsRequestModel(
        event: WsEventType.sub.value,
        topic: WsTopicType.diffDepth.value,
        symbol: "301.DOGEUSDT",
        params: WsRequestParamsModel(
          binary: "false",
          org: kOrgId,
          limit: "100",
          realtimeInterval: "24h"
        ),
      );
      final req = WsRequestAdapter(
        model: model,
        responseCallback: onWebsocketResponse,
        errorCallback: onWebsocketError,
      );
      addSubscriptionId(WsManager.shared.subscribe(req));
    });
  }

  @override
  void onWebsocketError(WsError error) {
    // TODO: implement onWebsocketError
  }

  @override
  void onWebsocketResponse(Map<String, dynamic> json) {
    // print(json);
    final res = WsResponseModel.fromJson(
      json,
      (p0) {
        if (p0 is List) {
          final list =
              (p0 as List).map((e) => WsDiffDepthModel.fromJson(e)).toList();
          return list;
        }
        return null;
      },
    );
    final depthList = res.data;
    if (depthList == null) {
      return;
    }
    // 最多保持20个交易记录
    const countLimit = 10;
    List<List<String>?> newA = state.a ?? [];
    List<List<String>?> newB = state.a ?? [];
    for (var depthModel in depthList) {
      final remoteA = depthModel.a ?? [];
      newA = remoteA + newA;
      final remoteB = depthModel.b ?? [];
      newB = remoteB + newB;
    }
    if (newA.length - countLimit > 0) {
      newA = newA.sublist(0, countLimit);
    }
    if (newB.length - countLimit > 0) {
      newB = newB.sublist(0, countLimit);
    }
    double maxA = 0.0;
    newA.forEach((element) {
      final ea = double.tryParse(element![1]) ?? 0.0;
      maxA = max(maxA, ea);
    });
    double maxB = 0.0;
    newB.forEach((element) {
      final eb = double.tryParse(element![1]) ?? 0.0;
      maxB = max(maxB, eb);
    });
    emit(state.copyWith(
      a: newA,
      aMax: maxA,
      b: newB,
      bMax: maxB,
    ));
  }

  @override
  Future<void> close() {
    cancelSubscriptions();
    return super.close();
  }
}
