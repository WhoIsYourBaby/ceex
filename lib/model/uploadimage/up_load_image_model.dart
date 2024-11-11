import 'package:freezed_annotation/freezed_annotation.dart';

part 'up_load_image_model.freezed.dart';
part 'up_load_image_model.g.dart';

@freezed
class UpLoadImageModel with _$UpLoadImageModel {
  const factory UpLoadImageModel({
    String? url,
  }) = _UpLoadImageModel;

  factory UpLoadImageModel.fromJson(Map<String, Object?> json) =>
      _$UpLoadImageModelFromJson(json);
}
