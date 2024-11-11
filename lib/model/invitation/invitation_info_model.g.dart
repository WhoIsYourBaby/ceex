// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationInfoModelImpl _$$InvitationInfoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationInfoModelImpl(
      inviteCode: json['inviteCode'] as String?,
      inviteInfoDTO: json['inviteInfoDTO'] == null
          ? null
          : InvitationInfoDtoModel.fromJson(
              json['inviteInfoDTO'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$InvitationInfoModelImplToJson(
        _$InvitationInfoModelImpl instance) =>
    <String, dynamic>{
      'inviteCode': instance.inviteCode,
      'inviteInfoDTO': instance.inviteInfoDTO,
    };

_$InvitationInfoDtoModelImpl _$$InvitationInfoDtoModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationInfoDtoModelImpl(
      userId: json['userId'] as String?,
      inviteCount: json['inviteCount'] as int?,
      inviteVaildCount: json['inviteVaildCount'] as int?,
      inviteDirectVaildCount: json['inviteDirectVaildCount'] as int?,
      inviteIndirectVaildCount: json['inviteIndirectVaildCount'] as int?,
      inviteLevel: json['inviteLevel'] as int?,
      directRate: (json['directRate'] as num?)?.toDouble(),
      indirectRate: (json['indirectRate'] as num?)?.toDouble(),
      bonusCoin: (json['bonusCoin'] as num?)?.toDouble(),
      bonusPoint: (json['bonusPoint'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$InvitationInfoDtoModelImplToJson(
        _$InvitationInfoDtoModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'inviteCount': instance.inviteCount,
      'inviteVaildCount': instance.inviteVaildCount,
      'inviteDirectVaildCount': instance.inviteDirectVaildCount,
      'inviteIndirectVaildCount': instance.inviteIndirectVaildCount,
      'inviteLevel': instance.inviteLevel,
      'directRate': instance.directRate,
      'indirectRate': instance.indirectRate,
      'bonusCoin': instance.bonusCoin,
      'bonusPoint': instance.bonusPoint,
    };
