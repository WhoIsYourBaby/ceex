import 'dart:convert';

import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/model/user/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 用户信息单例模式全局访问

// ignore: slash_for_doc_comments
/**
 * {
    "bindMobile": false,
    "bindEmail": false,
    "bindGA": false,
    "need2FA": false,
    "authType": "",
    "userId": "1632466488253249792",
    "defaultAccountId": "1632466488253249793",
    "registerType": 1,
    "nationalCode": "86",
    "mobile": "188****2487",
    "email": "",
    "user": {
        "userId": "1632466488253249792",
        "registerType": 1,
        "mobile": "188****2487",
        "nationalCode": "86",
        "email": "",
        "bindGA": false,
        "bindTradePwd": false,
        "bindPassword": true,
        "userType": 1,
        "verifyStatus": 0,
        "kycLevel": 0,
        "kycVerifyStatus": 0,
        "displayLevel": "",
        "accounts": [

        ],
        "defaultAccountId": "1632466488253249793",
        "registerDate": "1709341170406",
        "source": "Enterprice",
        "inviteUserId": "0",
        "secondLevelInviteUserId": "0",
        "isAgent": 0,
        "customLabelList": [

        ],
        "antiPhishingCode": "",
        "isComplianceVerify": false,
        "lastLoginDate": "1710473336810",
        "lastLoginIp": "111.252.174.141",
        "platfrom": "MOBILE"
    }
}
 */

/// 在widget中获取用户信息使用AuthCubit
/// 非widget中(e.g DioManager)获取用户信息使用UserInfoManager
class UserInfoManager {
  UserInfoManager._();

  static final UserInfoManager _shared = UserInfoManager._();

  static UserInfoManager get shared => _shared;

  static const String _user_info_key = 'user_info';

  static const String _user_info_cookie = 'user_info_cookie';

  static const String _user_base_info = 'user_base_info';

  String? token;
  String? userId;
  UserModel? userInfo;
  UserCookie? userCookie;
  UserBaseInfoModel? userBaseInfoModel;
  // ...

  /// 持久化存储cookie
  void save() async {
    print("保存cookie");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final jsonString = prefs.getString(_user_info_key);
    print("保存成功");
  }

  /// 持久化存储用户cookie信息，同时更新内存和磁盘
  Future<void> saveUserCookie(UserCookie? userCookie) async {
    this.userCookie = userCookie;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userCookie == null) {
      prefs.remove(_user_info_cookie);
    } else {
      final jsonString = jsonEncode(userCookie.toJson());
      prefs.setString(_user_info_cookie, jsonString);
    }
  }

  /// 从本地加载Cookie
  Future<UserCookie?> loadCookie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_user_info_cookie);
    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      userCookie = UserCookie.fromJson(jsonData);
      return userCookie;
    }
    return null;
  }

  /// 持久化存储用户信息，同时更新内存和磁盘
  Future<void> saveUserInfo(UserModel? userInfo) async {
    this.userInfo = userInfo;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userInfo == null) {
      prefs.remove(_user_info_key);
    } else {
      final jsonString = jsonEncode(userInfo.toJson());
      prefs.setString(_user_info_key, jsonString);
    }
  }

  /// 从本地加载
  Future<UserModel?> loadUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_user_info_key);
    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      userInfo = UserModel.fromJson(jsonData);
      return userInfo;
    }
    return null;
  }

  /// 持久化存储用户个人信息，同时更新内存和磁盘
  Future<void> saveUserBaseInfo(UserBaseInfoModel? userBaseInfoModel) async {
    this.userBaseInfoModel = userBaseInfoModel;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    if (userBaseInfoModel == null) {
      prefs.remove(_user_base_info);
    } else {
      final jsonString = jsonEncode(userBaseInfoModel.toJson());
      prefs.setString(_user_base_info, jsonString);
    }
  }

  /// 从本地加载用户个人信息
  Future<UserBaseInfoModel?> loadUserBaseInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_user_base_info);
    if (jsonString != null) {
      final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
      userBaseInfoModel = UserBaseInfoModel.fromJson(jsonData);
      return userBaseInfoModel;
    }
    return null;
  }

  clearUserInfoAndCookie() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final baseInfo = prefs.getString(_user_base_info);
    final infoKey = prefs.getString(_user_info_key);
    final infoCookie = prefs.getString(_user_info_cookie);
    userCookie = const UserCookie();
    userBaseInfoModel = const UserBaseInfoModel();
    userInfo = const UserModel();
    token = '';
    userId = '';
    await prefs.remove(_user_info_cookie);
    await prefs.remove(_user_info_key);
    await prefs.remove(_user_base_info);
    // prefs.setString(_user_info_cookie,"");
    // prefs.setString(_user_info_key,"");
    // prefs.setString(_user_base_info,"");
    loadUserInfo();
    loadUserBaseInfo();
    loadCookie();
  }

  bool get isLogin {
    final cToken = userCookie?.c_token;
    return cToken != null;
  }
}
