import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'symbol_ticker_state.dart';
part 'symbol_ticker_cubit.freezed.dart';

class SymbolTickerCubit extends Cubit<SymbolTickerState> {
  final String exchangeId;
  final String symbol;
  Timer? tickerTimer;
  final _repo = GetIt.I.get<QuoteRepository>();

  SymbolTickerCubit({
    required this.exchangeId,
    required this.symbol,
  }) : super(SymbolTickerState.initial());

  startTickerTimer() {
    stopTickerTimer();
    tickerTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      schedule();
    });
    schedule(); // 立刻调用
  }

  schedule() async {
    final resp = await _repo.getTicker("24h", "${exchangeId}.${symbol}");
    final tickerModel = (resp.data.data ?? []).firstOrNull;
    if (tickerModel != null && !isClosed) {
      emit(state.copyWith(model: tickerModel));
    }
  }

  stopTickerTimer() {
    tickerTimer?.cancel();
    tickerTimer = null;
  }

  @override
  Future<void> close() {
    stopTickerTimer();
    return super.close();
  }
}
