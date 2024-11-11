import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/getit_init.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'kline_diffdepth_state.dart';
part 'kline_diffdepth_cubit.freezed.dart';

/**
 * 订阅--->{"id":"14","symbol":"301.JUPUSDT","topic":"diffMergedDepth","event":"sub","params":{"dumpScale":"18","binary":true}}
 */
class KlineDiffDepthCubit extends Cubit<KlineDiffDepthState>
    with WsResponseMixin {
  final String exchangeId;
  final String symbolId;
  Timer? _timer;
  KlineDiffDepthCubit({
    required this.exchangeId,
    required this.symbolId,
  }) : super(KlineDiffDepthState.initial());

  @override
  void subscribe() {
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      scheduleDepth();
    });
  }

  @override
  void onWebsocketResponse(Map<String, dynamic> json) {
  }

  scheduleDepth() async {
    final repo = GetIt.I.get<QuoteRepository>();
    final resp = await repo.getDepth("18", 20, "${exchangeId}.${symbolId}",);
    if ((resp.data.data?.length ?? 0) == 0) {
      return;
    }
    final depthModel = resp.data.data![0];
    const countLimit = 20;
    List<List<String>?> newA = depthModel.a ?? [];
    List<List<String>?> newB = depthModel.b ?? [];
    newA = newA.sublist(0, min(countLimit, newA.length));
    newB = newB.sublist(0, min(countLimit, newB.length));

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
  void onWebsocketError(WsError error) {
    // TODO: implement onWebsocketError
  }

  @override
  cancelSubscriptions() {
    _timer?.cancel();
    _timer = null;
    return super.cancelSubscriptions();
  }

  @override
  Future<void> close() {
    cancelSubscriptions();
    return super.close();
  }
}
