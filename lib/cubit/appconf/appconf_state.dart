part of 'appconf_cubit.dart';

const String _kLocaleKey = "_kLocaleKey";

const String _kThemeKey = "_kThemeKey";

const String _kThemeValueLight = "_kThemeValueLight";
const String _kThemeValueDark = "_kThemeValueDark";

class AppconfState {
  Locale? locale;
  AppTheme appTheme;
  AppconfState({
    this.locale,
    required this.appTheme,
  });

  static Future<AppconfState> load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final localeStr = prefs.getString(_kLocaleKey);
    final themeTypeIndex = prefs.getInt(_kThemeKey) ?? AppThemeType.light.index;
    return AppconfState(
      locale: localeStr != null ? Locale(localeStr) : null,
      appTheme: AppTheme.themeOfType(AppThemeType.values[themeTypeIndex]),
    );
  }

  AppconfState copy({
    Locale? locale,
    AppTheme? appTheme,
  }) {
    return AppconfState(
      locale: locale ?? this.locale,
      appTheme: appTheme ?? this.appTheme,
    );
  }
}

/// 皮肤种类枚举
/// 暂支持light、dark
enum AppThemeType {
  light,
  dark,
}

class AppTheme {
  final AppColorSet colorSet;

  AppTheme({
    required this.colorSet,
  });

  factory AppTheme.themeOfType(AppThemeType themeType) {
    if (themeType == AppThemeType.light) {
      return AppTheme.light();
    } else {
      return AppTheme.dark();
    }
  }

  factory AppTheme.light() {
    final colorSet = AppColorSet(
      colorPrimary: const Color(0xFF1CD3BA),
      colorPrimary1: const Color(0xFF1C9CD3),
      colorPrimary2: const Color(0xFF18B49F),
      colorPrimary3:  const Color(0x801CD3BA),
      colorAuxiliary1: const Color(0xFF70ECAB),
      colorAuxiliary2: const Color(0xFFF26666),
      colorAuxiliary3: const Color(0xFFF288F4),
      colorAuxiliary4: const Color(0xFFEFBE24),
      colorAuxiliary5: const Color(0xFFE05143),
      colorGrey: const Color(0xFFABABAB),
      colorGrey1: const Color(0xFFEDEDED),
      colorGrey2: const Color(0xFFD9D9D9),
      colorWhite: const Color(0xFFFFFFFF),
      colorDark: const Color(0xFF000023),
      colorLight: const Color(0xFFF7F7F7),
      textBlack: const Color(0xFF000023),
      textGrey: const Color(0xFF5D5C5D),
      textGrey2: const Color(0xFFBEBEBE),
      textGrey3: const Color(0xFFB6B6B6),
      textWhite: const Color(0xFFFFFFFF),
    );

    return AppTheme(
      colorSet: colorSet,
    );
  }

  /// TODO: 暗色模式
  factory AppTheme.dark() {
    return AppTheme.light();
  }
}

class AppColorSet {
  /// light色卡颜色
  /// rgb(28, 211, 186)
  final Color colorPrimary;

  /// rgb(28, 156, 211)
  final Color colorPrimary1;

  /// rgb(24, 180, 159)
  final Color colorPrimary2;

  /// rgb(28, 211, 186,0.5)
  final Color colorPrimary3;

  /// rgb(112, 236, 171)
  final Color colorAuxiliary1;

  /// rgb(242, 102, 102)
  final Color colorAuxiliary2;

  /// rgb(242, 136, 244)
  final Color colorAuxiliary3;

  /// rgb(239, 190, 36)
  final Color colorAuxiliary4;

  /// rgb(224, 81, 67)
  final Color colorAuxiliary5;

  /// rgb(171, 171, 171)
  final Color colorGrey;

  final Color colorGrey1;

  /// 0xD9D9D9
  final Color colorGrey2;

  /// rgb(255, 255, 255)
  final Color colorWhite;

  /// rgb(0, 0, 35)
  final Color colorDark;

  /// rgb(247, 247, 247)
  final Color colorLight;

  /// rgb(0, 0, 35)
  final Color textBlack;

  /// rgb(93, 92, 93)
  final Color textGrey;

  /// rgb(190, 190, 190)
  final Color textGrey2;

  /// rgb(182, 182, 182)
  final Color textGrey3;

  /// rgb(255, 255, 255)
  final Color textWhite;

  AppColorSet({
    required this.colorPrimary,
    required this.colorAuxiliary1,
    required this.colorAuxiliary2,
    required this.colorAuxiliary3,
    required this.colorAuxiliary4,
    required this.colorAuxiliary5,
    required this.colorGrey,
    required this.colorGrey1,
    required this.colorGrey2,
    required this.colorWhite,
    required this.colorDark,
    required this.colorLight,
    required this.textBlack,
    required this.textGrey,
    required this.textGrey2,
    required this.textGrey3,
    required this.textWhite,
    required this.colorPrimary1,
    required this.colorPrimary2,
    required this.colorPrimary3,
    
  });

  AppColorSet copyWith({
    Color? colorPrimary,
    Color? colorPrimary1,
    Color? colorPrimary2,
    Color? colorAuxiliary1,
    Color? colorAuxiliary2,
    Color? colorAuxiliary3,
    Color? colorAuxiliary4,
    Color? colorAuxiliary5,
    Color? colorGrey,
    Color? colorGrey1,
    Color? colorGrey2,
    Color? colorWhite,
    Color? colorDark,
    Color? colorLight,
    Color? textBlack,
    Color? textGrey,
    Color? textGrey2,
    Color? textGrey3,
    Color? textWhite,
    Color? colorPrimary3,
  }) {
    return AppColorSet(
        colorPrimary: colorPrimary ?? this.colorPrimary,
        colorAuxiliary1: colorAuxiliary1 ?? this.colorAuxiliary1,
        colorAuxiliary2: colorAuxiliary2 ?? this.colorAuxiliary2,
        colorAuxiliary3: colorAuxiliary3 ?? this.colorAuxiliary3,
        colorAuxiliary4: colorAuxiliary4 ?? this.colorAuxiliary4,
        colorAuxiliary5: colorAuxiliary5 ?? this.colorAuxiliary5,
        colorGrey: colorGrey ?? this.colorGrey,
        colorGrey1: colorGrey1 ?? this.colorGrey1,
        colorGrey2: colorGrey2 ?? this.colorGrey2,
        colorWhite: colorWhite ?? this.colorWhite,
        colorDark: colorDark ?? this.colorDark,
        colorLight: colorLight ?? this.colorLight,
        textBlack: textBlack ?? this.textBlack,
        textGrey: textGrey ?? this.textGrey,
        textGrey2: textGrey2 ?? this.textGrey2,
        textGrey3: textGrey3 ?? this.textGrey3,
        textWhite: textWhite ?? this.textWhite,
        colorPrimary1: colorPrimary1 ?? this.colorPrimary1,
        colorPrimary2: colorPrimary2 ?? this.colorPrimary2,
        colorPrimary3: colorPrimary3 ?? this.colorPrimary3,);
  }
}

extension ColorStyle on Color {
  TextStyle style({double fontSize = 14, FontWeight fontWeight = FontWeight.w400}) =>
      TextStyle(color: this, fontSize: fontSize, fontWeight: fontWeight);
}