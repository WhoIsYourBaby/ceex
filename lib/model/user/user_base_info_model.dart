import 'package:ceex_flutter/model/user/favorite_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_base_info_model.freezed.dart';
part 'user_base_info_model.g.dart';

@freezed
class UserBaseInfoModel with _$UserBaseInfoModel {
  const factory UserBaseInfoModel({
    /// code和msg在错误发生时候会产生
    int? code,
    String? msg,
    String? userId,
    int? registerType,
    String? mobile,
    String? nationalCode,
    String? email,
    bool? bindGA,
    bool? bindTradePwd,
    bool? bindPassword,
    int? userType,
    int? verifyStatus,
    int? kycLevel,
    int? kycVerifyStatus,
    String? displayLevel,
    List<String>? accountsModel,
    String? defaultAccountId,
    String? registerDate,
    bool? openOption,
    bool? openFuture,
    bool? openMargin,
    bool? learnWithdraw,
    bool? learnDeposit,
    List<FavoriteModel>? favorites,
    String? source,
    int? isAgent,
    List<String>? customLabelList,
    List<String>? levelNames,
    int? leader,
    int? isHobbit,
    String? antiPhishingCode,
    bool? isComplianceVerify,
    String? lastLoginDate,
    String? lastLoginIp,
    String? platfrom,
  }) = _UserBaseInfoModel;
  factory UserBaseInfoModel.fromJson(Map<String, Object?> json) =>
      _$UserBaseInfoModelFromJson(json);
}