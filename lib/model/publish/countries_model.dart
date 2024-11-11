import 'package:freezed_annotation/freezed_annotation.dart';
part 'countries_model.freezed.dart';
part 'countries_model.g.dart';

@freezed
class CountriesModel with _$CountriesModel{
  const factory CountriesModel({
    String? id, 
    String? nationalCode,
    String? shortName,
    String? countryName,
    String? indexName,
    int? allowRegister,
    int? allowLogin,
    int? allowKyc,
    int? allowBindMobile,
  }) = _CountriesModel;

  factory CountriesModel.fromJson(Map<String, Object?> json) =>
      _$CountriesModelFromJson(json);
}