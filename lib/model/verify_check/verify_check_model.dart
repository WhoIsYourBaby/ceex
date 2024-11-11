import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_check_model.freezed.dart';
part 'verify_check_model.g.dart';
@freezed
class VerifyCheckModel with _$VerifyCheckModel {
  const factory VerifyCheckModel({String? requestId,bool? need2FA,String? authType}) = _VerifyCheckModel;

  factory VerifyCheckModel.fromJson(Map<String, Object?> json) =>
      _$VerifyCheckModelFromJson(json);
}