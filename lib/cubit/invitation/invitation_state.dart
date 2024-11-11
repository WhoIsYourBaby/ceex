part of 'invitation_cubit.dart';


@freezed
class InvitationState with  _$InvitationState{
  const factory InvitationState.initial({
    InvitationInfoModel? infoModel,
    InvitationBonusModel? bonusModel,
    InvitationFeebackModel? feebackModel,
    InvitationRelationModel? relationModel,
    InvitationTempModel? tempModel,
  }) = _Initial;
}