part of 'recharge_cubit.dart';

@freezed
class RechargeState with _$RechargeState {

  const factory RechargeState.initial({
    RechargeQrCodeModel? model,

  }) = _Initial;
}
