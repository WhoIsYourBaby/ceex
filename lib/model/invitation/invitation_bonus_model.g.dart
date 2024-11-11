// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invitation_bonus_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvitationBonusModelImpl _$$InvitationBonusModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvitationBonusModelImpl(
      totalBonusCoins: (json['totalBonusCoins'] as num?)?.toDouble(),
      totalBonusPoints: (json['totalBonusPoints'] as num?)?.toDouble(),
      recordList: (json['recordList'] as List<dynamic>?)
          ?.map((e) => RecordListModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$InvitationBonusModelImplToJson(
        _$InvitationBonusModelImpl instance) =>
    <String, dynamic>{
      'totalBonusCoins': instance.totalBonusCoins,
      'totalBonusPoints': instance.totalBonusPoints,
      'recordList': instance.recordList,
    };

_$RecordListModelImpl _$$RecordListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordListModelImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      token: json['token'] as String?,
      bonusAmount: json['bonusAmount'] as int?,
      statisticsTime: json['statisticsTime'] as String?,
    );

Map<String, dynamic> _$$RecordListModelImplToJson(
        _$RecordListModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'token': instance.token,
      'bonusAmount': instance.bonusAmount,
      'statisticsTime': instance.statisticsTime,
    };
