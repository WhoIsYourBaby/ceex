// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_feeback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationFeebackModelImpl _$$InvitationFeebackModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationFeebackModelImpl(
      id: json['id'] as String?,
      actId: json['actId'] as String?,
      level: json['level'] as int?,
      levelTag: json['levelTag'] as String?,
      levelCondition: (json['levelCondition'] as num?)?.toDouble(),
      directRate: (json['directRate'] as num?)?.toDouble(),
      indirectRate: (json['indirectRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$InvitationFeebackModelImplToJson(
        _$InvitationFeebackModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'actId': instance.actId,
      'level': instance.level,
      'levelTag': instance.levelTag,
      'levelCondition': instance.levelCondition,
      'directRate': instance.directRate,
      'indirectRate': instance.indirectRate,
    };
