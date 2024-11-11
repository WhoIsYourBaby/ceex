// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_temp_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationTempModelImpl _$$InvitationTempModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationTempModelImpl(
      brokerLogoUrl: json['brokerLogoUrl'] as String?,
      shareContent: json['shareContent'] as String?,
      posterUrl: json['posterUrl'] as String?,
      shareTitle: json['shareTitle'] as String?,
      inviteCode: json['inviteCode'] as String?,
      shareUrl: json['shareUrl'] as String?,
      brokerName: json['brokerName'] as String?,
      posterUrls: (json['posterUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$InvitationTempModelImplToJson(
        _$InvitationTempModelImpl instance) =>
    <String, dynamic>{
      'brokerLogoUrl': instance.brokerLogoUrl,
      'shareContent': instance.shareContent,
      'posterUrl': instance.posterUrl,
      'shareTitle': instance.shareTitle,
      'inviteCode': instance.inviteCode,
      'shareUrl': instance.shareUrl,
      'brokerName': instance.brokerName,
      'posterUrls': instance.posterUrls,
    };
