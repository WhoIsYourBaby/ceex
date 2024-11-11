// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnnouncementModelImpl _$$AnnouncementModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AnnouncementModelImpl(
      title: json['title'] as String?,
      detail: json['detail'] as String?,
      isDirect: json['isDirect'] as bool?,
      directUrl: json['directUrl'] as String?,
      publishTime: json['publishTime'] as String?,
      sort: json['sort'] as int?,
    );

Map<String, dynamic> _$$AnnouncementModelImplToJson(
        _$AnnouncementModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'detail': instance.detail,
      'isDirect': instance.isDirect,
      'directUrl': instance.directUrl,
      'publishTime': instance.publishTime,
      'sort': instance.sort,
    };
