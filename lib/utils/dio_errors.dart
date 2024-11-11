import 'dart:io';

import 'package:dio/dio.dart';

class ExceptionHandle {
  static NetError handleException(DioException error) {
    String msg;
    switch (error.type) {
      case DioExceptionType.sendTimeout:
        msg = "请求超时";
        break;
      case DioExceptionType.connectionTimeout:
        msg = "连接超时";
        break;
      case DioExceptionType.receiveTimeout:
        msg = "响应超时";
        break;
      case DioExceptionType.badResponse:
        String message = "";
        try {
          if (error.response != null) {
            message = error.response!.data["msg"].toString();
          }
        } catch (e) {
          message = "响应错误";
        }
        msg = message;
        break;
      case DioExceptionType.cancel:
        msg = "请求取消";
        break;
      case DioExceptionType.connectionError:
        msg = "连接失败";
        break;
      case DioExceptionType.badCertificate:
        msg = "证书错误";
        break;
      default:
        msg = otherError(error);
        break;
    }
    return NetError(msg);
  }
}

otherError(dynamic error) {
  String msg;
  dynamic e = error.error;
  switch (e) {
    case SocketException:
      msg = "网络异常，请检查网络";
      break;
    case HttpException:
      msg = "服务器异常";
      break;
    default:
      msg = "网络异常";
      break;
  }
  return msg;
}

class NetError {
  String msg;

  NetError(this.msg);
}
