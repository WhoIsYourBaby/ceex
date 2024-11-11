import 'package:freezed_annotation/freezed_annotation.dart';
part 'rates_model.freezed.dart';
part 'rates_model.g.dart';
@freezed
class RatesModel with _$RatesModel {
  const factory RatesModel({
    required int code,
    required List<DataModel> data,
  }) = _RatesModel;

  factory RatesModel.fromJson(Map<String, dynamic> json) =>
      _$RatesModelFromJson(json);
}

@freezed
class DataModel with _$DataModel {
  const factory DataModel({
    required String token,
    required RatesDataModel rates,
  }) = _DataModel;

  factory DataModel.fromJson(Map<String, dynamic> json) =>
      _$DataModelFromJson(json);
}

@freezed
class RatesDataModel with _$RatesDataModel {
  const factory RatesDataModel({
    required String CNY,
  }) = _RatesDataModel;

  factory RatesDataModel.fromJson(Map<String, dynamic> json) =>
      _$RatesDataModelFromJson(json);
}