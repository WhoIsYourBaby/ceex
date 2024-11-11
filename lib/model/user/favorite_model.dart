import 'package:freezed_annotation/freezed_annotation.dart';

part 'favorite_model.freezed.dart';
part 'favorite_model.g.dart';

/// An annotation for the code generator to know that this class needs the
/// JSON serialization logic to be generated.
@freezed
class FavoriteModel with _$FavoriteModel {
  const factory FavoriteModel({
    String? id,
    String? exchangeId,
    String? symbolId,
  }) = _FavoriteModel;

  factory FavoriteModel.fromJson(Map<String, Object?> json) =>
      _$FavoriteModelFromJson(json);
}
