import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_version_config_model.freezed.dart';
part 'app_version_config_model.g.dart';

@freezed
class AppVersionCongfigModel with _$AppVersionCongfigModel{
  const factory AppVersionCongfigModel({
    bool? needUpdate, 
    bool? needForceUpdate,
    String? downloadUrl,
    String? newVersion,
  }) = _AppVersionCongfigModel;

  factory AppVersionCongfigModel.fromJson(Map<String, Object?> json) =>
      _$AppVersionCongfigModelFromJson(json);
}