// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthenticationModelImpl _$$AuthenticationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AuthenticationModelImpl(
      nationality: json['nationality'] as String?,
      firstName: json['firstName'] as String?,
      secondName: json['secondName'] as String?,
      gender: json['gender'] as int?,
      cardType: json['cardType'] as String?,
      cardNo: json['cardNo'] as String?,
      cardFrontUrl: json['cardFrontUrl'] as String?,
      cardHandUrl: json['cardHandUrl'] as String?,
      verifyStatus: json['verifyStatus'] as int?,
      refusedReason: json['refusedReason'] as String?,
      refusedReasonId: json['refusedReasonId'] as int?,
    );

Map<String, dynamic> _$$AuthenticationModelImplToJson(
        _$AuthenticationModelImpl instance) =>
    <String, dynamic>{
      'nationality': instance.nationality,
      'firstName': instance.firstName,
      'secondName': instance.secondName,
      'gender': instance.gender,
      'cardType': instance.cardType,
      'cardNo': instance.cardNo,
      'cardFrontUrl': instance.cardFrontUrl,
      'cardHandUrl': instance.cardHandUrl,
      'verifyStatus': instance.verifyStatus,
      'refusedReason': instance.refusedReason,
      'refusedReasonId': instance.refusedReasonId,
    };
