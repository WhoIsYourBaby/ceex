import "dart:io";
import "package:ceex_flutter/utils/config.dart";
import "package:ceex_flutter/utils/device_info_manager.dart";
import "package:ceex_flutter/utils/dio_errors.dart";
import "package:ceex_flutter/utils/toast.dart";
import "package:ceex_flutter/utils/user_info_manager.dart";
import "package:dio/dio.dart";
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import "package:dio/io.dart";
import "package:oktoast/oktoast.dart";

class DioManager {
  late Dio _dio;
  PersistCookieJar? cookieJar;
  DioManager._() {
    _dio = Dio(BaseOptions(
      baseUrl: kApiBaseUrl,
      connectTimeout: Duration(seconds: 60),
      sendTimeout: Duration(seconds: 60),
      receiveTimeout: Duration(seconds: 60),
    ))
      ..interceptors.add(InjectInterceptor())
      // ..interceptors.add(CookieManager(PersistCookieJar(storage: FileStorage(await cookieDir()))))
      ..interceptors.add(TokenInterceptor())
      // ..interceptors.add(ErrorInterceptorsWrapper())
      ..interceptors.add(
        LogInterceptor(
          request: false,
          requestHeader: false,
          requestBody: false,
          responseBody: true,
          responseHeader: false,
        ),
      );
    // _dio.httpClientAdapter = IOHttpClientAdapter(
    //   createHttpClient: () {
    //     final client = HttpClient();
    //     client.findProxy = (uri) {
    //       return 'PROXY 192.168.0.109:8888';
    //       // return 'PROXY 172.20.10.2:8888';
    //     };
    //     return client;
    //   },
    // );
    cookieDir().then((value) {
      cookieJar = PersistCookieJar(
        storage: FileStorage(value),
      );
      _dio.interceptors.add(
        CookieManager(cookieJar!),
      );
      _dio.interceptors.add(
        ErrorInterceptorsWrapper(),
      );
    });
  }

  static final DioManager _shared = DioManager._();

  static DioManager get shared => _shared;

  Dio get dio => _dio;

  Future<String> cookieDir() async {
    // 获取文档目录的路径
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String dir = appDocDir.path + "/.cookies/";
    return dir;
  }

  clearCookie() async {
    cookieJar?.deleteAll();
  }

  /// 生成request的通用header
  Map<String, dynamic> createHeaders() {
    final screenSize = DeviceInfoManager.shared.screenSize;
    return {
      "screensize":
          "${screenSize.width.toStringAsFixed(0)}*${screenSize.height.toStringAsFixed(0)}",
      "app": "bhexApp",
      // 网络类型
      "nett": "unKnow",
      "User-Agent": getUserAgent(),
      "appVersion": DeviceInfoManager.shared.shortVersion,
      "osVersion":
          "${DeviceInfoManager.shared.systemName} ${DeviceInfoManager.shared.systemVersion}",
      "osType": DeviceInfoManager.shared.systemName,
      "appId": DeviceInfoManager.shared.packageName,
      "imei": DeviceInfoManager.shared.deviceUuid,
      // TODO 需要根据实际生成
      "Accept-Language": "zh-CN",
      "channel": kAppChannel,
      "source": kAppChannel,
    };
  }

  /// user-agent
  /// 参考iOS代码
  String getUserAgent() {
    final appName = DeviceInfoManager.shared.appName;
    final shortVersion = DeviceInfoManager.shared.shortVersion;
    final model = DeviceInfoManager.shared.model;
    final systemName = DeviceInfoManager.shared.systemName;
    final systemVersion = DeviceInfoManager.shared.systemVersion;
    final scale = DeviceInfoManager.shared.devicePixelRatio;
    return "${appName}/${shortVersion} (${model}; ${systemName} ${systemVersion}; Scale/${scale.toStringAsFixed(2)})";
  }

  /// 给post或者query接口签名
  Map<String, dynamic> sigParams(Map<String, dynamic>? params) {
    String time = DateTime.now().millisecondsSinceEpoch.toString();
    // String time = "1709364898000";
    final Map<String, dynamic> returnDic = {...(params ?? {})};
    returnDic["time"] = time;
    returnDic["org_id"] = kOrgId;
    // TODO 从cookie中设置c_token字段
    // result["c_token"] = "";
    final keysList = returnDic.keys.toList()
      ..sort((s1, s2) {
        return s1.compareTo(s2);
      });
    String paramsString = "";
    for (var i = 0; i < keysList.length; i++) {
      final key = keysList[i];
      final value = returnDic[key];
      final addStr = "$key=$value";
      paramsString += addStr;
    }
    paramsString += "bhex.com";
    final sigStr = md5.convert(utf8.encode(paramsString)).toString();
    returnDic["sig"] = sigStr;
    return returnDic;
  }
}

class TokenInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = UserInfoManager.shared.token;
    final userId = UserInfoManager.shared.userId;
    final userCookie = UserInfoManager.shared.userCookie;

    if (token != null) {
      options.headers["Authorization"] = "Bearer $token";
    }
    if (userId != null) {
      options.headers["userId"] = userId;
    }
    if (userCookie != null) {
      options.headers["au_token"] = userCookie.au_token;
      options.headers["c_token"] = userCookie.c_token;
    } else {
      print("未登录->");
    }
    super.onRequest(options, handler);
  }
}

class InjectInterceptor extends Interceptor {
  @override

  /// 设置通用header
  /// 对post-params和query-params签名
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final Map<String, dynamic> fullHeaders = {};
    fullHeaders.addAll(options.headers);
    final newHeaders = DioManager.shared.createHeaders();
    fullHeaders.addAll(newHeaders);
    options.headers = fullHeaders;
    final userCookie = UserInfoManager.shared.userCookie;
    final cToken = userCookie?.c_token;
    if ((options.data is Map) && options.data.isNotEmpty) {
      final sigParams = DioManager.shared.sigParams(options.data);
      if (cToken != null) {
        sigParams["c_token"] = cToken;
      }
      options.data = sigParams;
    }
    if (options.queryParameters.isNotEmpty) {
      final sigQuery = DioManager.shared.sigParams(options.queryParameters);
      if (cToken != null) {
        sigQuery["c_token"] = cToken;
      }
      options.queryParameters = sigQuery;
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }
}

class ErrorInterceptorsWrapper extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // TODO: implement onError
    dismissAllToast();
    try {
      final errMap = err.response?.data as Map<String, dynamic>;
      if (errMap["code"] == 30000) {
        // token失效
        // handler.resolve(err.response!);
        await UserInfoManager.shared.clearUserInfoAndCookie();
        await DioManager.shared.clearCookie();
        handler.next(err);
      } else {
        NetError error = NetError(errMap["msg"]);
        showMsg(error.msg);
        handler.next(err);
      }
    } catch (e) {
      NetError error = ExceptionHandle.handleException(err);
      // showMsg(error.msg);
      handler.next(err);
    }
  }
}
