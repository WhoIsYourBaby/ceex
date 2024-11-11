import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_model.freezed.dart';
part 'authentication_model.g.dart';

@freezed
class AuthenticationModel with _$AuthenticationModel {
  const factory AuthenticationModel({
    String? nationality,
    String? firstName,
    String? secondName,
    int? gender,
    String? cardType,
    String? cardNo,
    String? cardFrontUrl,
    String? cardHandUrl,
    int? verifyStatus,
    String? refusedReason,// 拒绝原因
    int? refusedReasonId,
  }) = _AuthenticationModel;

  factory AuthenticationModel.fromJson(Map<String, Object?> json) =>
      _$AuthenticationModelFromJson(json);
}
