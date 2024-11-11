import 'package:freezed_annotation/freezed_annotation.dart';
part 'return_success_status_model.freezed.dart';
part 'return_success_status_model.g.dart';
@freezed
class ReturnSuccessStatusModel with _$ReturnSuccessStatusModel {
  const factory ReturnSuccessStatusModel({
    required bool success,
  }) = _RatesModel;

  factory ReturnSuccessStatusModel.fromJson(Map<String, dynamic> json) =>
      _$ReturnSuccessStatusModelFromJson(json);
}
