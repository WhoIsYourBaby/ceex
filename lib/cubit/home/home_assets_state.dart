part of 'home_assets_cubit.dart';

@freezed
class HomeAssetsState with _$HomeAssetsState {
  factory HomeAssetsState.initial({
    AssetsInfoModel? assetsInfo,
    RateModel? rate,
  }) = _Initial;
}
