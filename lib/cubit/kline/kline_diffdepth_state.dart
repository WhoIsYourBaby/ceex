part of 'kline_diffdepth_cubit.dart';

@freezed
class KlineDiffDepthState with _$KlineDiffDepthState {
  const factory KlineDiffDepthState.initial({
    List<List<String>?>? a,
    double? aMax,
    List<List<String>?>? b,
    double? bMax,
  }) = _Initial;
}
