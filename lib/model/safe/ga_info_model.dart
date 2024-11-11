import 'package:freezed_annotation/freezed_annotation.dart';

part 'ga_info_model.freezed.dart';
part 'ga_info_model.g.dart';

@freezed
class GAInfoModel with _$GAInfoModel {
  const factory GAInfoModel(
      {String? secretKey, String? authUrl, String? qrcode}) = _GAInfoModel;

  factory GAInfoModel.fromJson(Map<String, Object?> json) =>
      _$GAInfoModelFromJson(json);
}
