import 'package:freezed_annotation/freezed_annotation.dart';
part 'geev_register_model.freezed.dart';
part 'geev_register_model.g.dart';

@freezed
class GeevRegisterModel with _$GeevRegisterModel{
  const factory GeevRegisterModel({
    int? success, 
    bool? new_captcha,
    String? challenge,
    String? gt,
  }) = _GeevRegisterModel;

  factory GeevRegisterModel.fromJson(Map<String, Object?> json) =>
      _$GeevRegisterModelFromJson(json);
}