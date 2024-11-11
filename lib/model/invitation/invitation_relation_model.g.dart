// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_relation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationRelationModelImpl _$$InvitationRelationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationRelationModelImpl(
      status: json['status'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InvitationDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InvitationRelationModelImplToJson(
        _$InvitationRelationModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

_$InvitationDataModelImpl _$$InvitationDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationDataModelImpl(
      inviteId: json['inviteId'] as String?,
      userId: json['userId'] as String?,
      nationalCode: json['nationalCode'] as String?,
      mobile: json['mobile'] as String?,
      email: json['email'] as String?,
      registerType: json['registerType'] as int?,
      verifyStatus: json['verifyStatus'] as int?,
      inviteType: json['inviteType'] as String?,
      registerDate: json['registerDate'] as String?,
    );

Map<String, dynamic> _$$InvitationDataModelImplToJson(
        _$InvitationDataModelImpl instance) =>
    <String, dynamic>{
      'inviteId': instance.inviteId,
      'userId': instance.userId,
      'nationalCode': instance.nationalCode,
      'mobile': instance.mobile,
      'email': instance.email,
      'registerType': instance.registerType,
      'verifyStatus': instance.verifyStatus,
      'inviteType': instance.inviteType,
      'registerDate': instance.registerDate,
    };
