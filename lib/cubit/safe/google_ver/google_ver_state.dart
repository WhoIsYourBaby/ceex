part of 'google_ver_cubit.dart';

@freezed
class GoogleVerState with _$GoogleVerState {
  const factory GoogleVerState.initial({
    String? secretKey,
    String? authUrl,
    String? qrcode,
  }) = _Initial;
}
