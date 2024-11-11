import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_model.freezed.dart';
part 'verify_model.g.dart';
@freezed
class VerifyModel with _$VerifyModel {
  const factory VerifyModel({String? orderId,String? index}) = _VerifyModel;

  factory VerifyModel.fromJson(Map<String, Object?> json) =>
      _$VerifyModelFromJson(json);
}