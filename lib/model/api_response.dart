import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

// 必要的：关联 `main.dart` 到 Freezed 代码生成器
part 'api_response.freezed.dart';
// 可选的：因为 Person 类是可序列化的，所以我们必须添加这一行。
// 但是如果 Person 不是可序列化的，我们可以跳过它。
part 'api_response.g.dart';

@Freezed(genericArgumentFactories: true)
sealed class ApiResponse<T> with _$ApiResponse<T> {
  const factory ApiResponse(T data, int code) = _ApiResponse;

  factory ApiResponse.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$ApiResponseFromJson(json, fromJsonT);
}
