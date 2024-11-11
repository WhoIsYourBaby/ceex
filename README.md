# ceex_flutter

A new Flutter app project for ceex.

## Getting Started

For help getting started with Flutter development, view the online
[documentation](https://flutter.dev/).


### l10n使用
[参考](https://flutter.cn/docs/accessibility-and-localization/internationalization#messages-with-numbers-and-currencies)
```
flutter gen-l10n
```


### JSON序列化
[参考](https://flutter.cn/docs/data-and-backend/serialization/json)
```
一次性代码生成
flutter pub run build_runner build --delete-conflicting-outputs
持续生成代码
flutter pub run build_runner watch
```

### 安卓集成方式aar
```
flutter build aar
```

### iOS打包
```
flutter build ipa --export-method app-store
```

### 关于路由

每个页面都定义自己的 static Route route(param)方法，返回自己页面的Route
```
static Route route({param}) =>
      MaterialPageRoute(builder: (context) => const XXXView(param));
```


### assets静态资源序列化

使用：https://pub-web.flutter-io.cn/packages/flutter_asset_generator

### 上线交易所ceex.com的flutter源代码

学习flutter和交易所业务的入门资源，欢迎使用