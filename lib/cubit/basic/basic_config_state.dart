part of 'basic_config_cubit.dart';

class BasicConfigState {
  AppConfigModel? configModel;
  Map<String, dynamic>? tokenIconMap;
  Map<String, dynamic>? symbolIconMap;
  BasicConfigState({
    this.configModel,
    this.tokenIconMap,
    this.symbolIconMap,
  });

  copyWith({
    AppConfigModel? configModel,
    Map<String, dynamic>? tokenIconMap,
    Map<String, dynamic>? symbolIconMap,
  }) {
    return BasicConfigState(
      configModel: configModel ?? this.configModel,
      tokenIconMap: tokenIconMap ?? this.tokenIconMap,
      symbolIconMap: symbolIconMap ?? this.symbolIconMap,
    );
  }
}
