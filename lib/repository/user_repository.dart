import 'package:ceex_flutter/model/assets/account_assets_model.dart';
import 'package:ceex_flutter/model/assets/assets_balance_flow_model.dart';
import 'package:ceex_flutter/model/assets/assets_info_model.dart';
import 'package:ceex_flutter/model/authentication/authentication_model.dart';
import 'package:ceex_flutter/model/authentication/kyc_authentication_information_model.dart';
import 'package:ceex_flutter/model/authentication/kyc_photo_verify_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_bonus_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_feeback_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_info_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_relation_model.dart';
import 'package:ceex_flutter/model/invitation/invitation_temp_model.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/model/publish/return_success_status_model.dart';
import 'package:ceex_flutter/model/safe/ga_info_model.dart';
import 'package:ceex_flutter/model/uploadimage/up_load_image_model.dart';
import 'package:ceex_flutter/model/user/user_account_money_change_model.dart';
import 'package:ceex_flutter/model/user/user_account_money_model.dart';
import 'package:ceex_flutter/model/verify_check/verify_check_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_repository.g.dart';

/// 用户API
/// 参考文档URL：https://gitlab.ceex666.live/bhpc/docs/broker-api/-/blob/master/UserAPI/3%20%E7%94%A8%E6%88%B7%E6%8E%A5%E5%8F%A3.md

@RestApi()
abstract class UserRepository {
  factory UserRepository(Dio dio, {String baseUrl}) = _UserRepository;

  /// 快捷登录 - 创建认证身份
  @POST('/api/user/quick_authorize')
  Future<HttpResponse<Map<String, List<KlineModel>?>>> userQuickAuthorize(
    @Body() UserAuthorizeBody body,
  );

  /// 测试登录
  @POST('/api/user/testLogin')
  Future<HttpResponse<UserModel>> login(
    @Body() Map<String, dynamic> body,
  );

  /// 发送验证码
  /// [receiverType] 1手机验证，2邮箱验证
  /// [type] 验证场景：1注册、2登录二次验证、3找回密码、22快捷登录、14提币安全验证
  @POST('/mapi/user/send_verify_code')
  @FormUrlEncoded()
  Future<HttpResponse<VerifyModel>> sendVerfyCode(
    @Field("receiver_type") int receiverType,
    @Field("type") int type,
  );

  /**
   * 不需要登录
   */

  ///  发送验证码
  @POST('/mapi/common/send_verify_code')
  Future<HttpResponse<VerifyModel>> commonSendVerfyCode(
    @Body() FormData body,
  );

  /// 发送邮箱验证码
  @POST('/mapi/common/send_email_verify_code')
  Future<HttpResponse<VerifyModel>> sendCommonEmailVerfyCode(
    @Body() FormData body,
  );

  /// 发送手机验证码
  @POST('/mapi/common/send_sms_verify_code')
  Future<HttpResponse<VerifyModel>> sendCommonSmsVerfyCode(
    @Body() FormData body,
  );

  /// 验证邮箱验证码
  @POST('/mapi/user/email_find_pwd_check1')
  Future<HttpResponse<VerifyCheckModel>> checkEmailVerfyCode(
    @Body() FormData body,
  );

  /// 验证手机验证码
  @POST('/mapi/user/mobile_find_pwd_check1')
  Future<HttpResponse<VerifyCheckModel>> checkMobileVerfyCode(
    @Body() FormData body,
  );

  /// 邮箱注册
  @POST('/mapi/user/email_sign_up')
  Future<HttpResponse<UserModel>> emailSignUp(
    @Body() FormData body,
  );

  /// 手机号注册
  @POST('/mapi/user/mobile_sign_up')
  Future<HttpResponse<UserModel>> mobileSignUp(
    @Body() FormData body,
  );

  /// 账号密码登录
  @POST('/mapi/user/authorize')
  Future<HttpResponse<UserModel>> userAuthorize(
    @Body() FormData body,
  );

  /// 邮箱登录
  @POST('/mapi/user/email_authorize')
  Future<HttpResponse<UserModel>> emailAuthorize(
    @Body() FormData body,
  );

  /// 手机登录
  @POST('/mapi/user/mobile_authorize')
  Future<HttpResponse<UserModel>> mobileAuthorize(
    @Body() FormData body,
  );

  /// 找回密码 -> 设置密码
  @POST('/mapi/user/find_pwd')
  Future<HttpResponse<FindPwdModel>> findPwd(
    @Body() FormData body,
  );

  /// 创建收藏
  @POST('/mapi/user/favorite/create')
  @FormUrlEncoded()
  Future<HttpResponse> createFavorite(
    @Field("exchange_id") String exchangeId,
    @Field("symbol_id") String symbolId,
  );

  /// 创建收藏
  /// items: json-arr字符串，可以用来删除币对
  @POST('/mapi/user/favorite/sort')
  @FormUrlEncoded()
  Future<HttpResponse> sortFavorite(
    @Field("items") String items,
  );

  /// 取消收藏
  @POST('/mapi/user/favorite/cancel')
  @FormUrlEncoded()
  Future<HttpResponse> cancelFavorite(
    @Field("exchange_id") String exchangeId,
    @Field("symbol_id") String symbolId,
  );

  /// 收藏列表
  @GET('/mapi/user/favorite/list')
  Future<HttpResponse<List<FavoriteModel>>> favoriteList();

  /// 获取当前用户信息
  @POST('/mapi/user/get_base_info')
  Future<HttpResponse<UserBaseInfoModel>> getBaseInfo();

  /// 获取用户资产信息
  @GET('/mapi/account/get')
  Future<HttpResponse<AccountAssetsModel>> accountGet();

  /// 获取用户资产信息
  @POST('/mapi/account/get')
  Future<HttpResponse<AccountAssetsModel>> accountGetHas(
    @Body() FormData body,
  );

  //   /// 获取用户资产信息
  // @GET('/mapi/account/get')
  // Future<HttpResponse<AccountAssetsModel>> accountGet();

  /// 获取用户资产信息
  @POST('/mapi/asset/get')
  Future<HttpResponse<List<UserAccountMoneyModel>>> assetGet();

  /// 获取用户资产信息
  @POST('/mapi/asset/get')
  Future<HttpResponse<List<UserAccountMoneyChangeModel>>> assetGetChange();

  /// 获取用户委托
  @POST('/mapi/order/open_orders')
  Future<HttpResponse<List<OrderModel>>> orderOpenOrders(
    @Body() FormData body,
  );

  /// 获取用户历史委托
  @POST('/mapi/order/trade_orders')
  Future<HttpResponse<List<OrderModel>>> orderTradeOrders(
    @Body() FormData body,
  );

  /// 获取历史成交记录
  @POST('/mapi/order/my_trades')
  Future<HttpResponse<List<OrderModel>>> orderMyTrades(
    @Body() FormData body,
  );

  /// 获取某个订单的成交信息
  @POST('/mapi/order/match_info')
  Future<HttpResponse<List<OrderModel>>> orderMatchInfo(
    @Body() FormData body,
  );

  /// 发送邮箱验证码-用户登录二次验证
  @POST('/mapi/user/send_email_verify_code/authorize_advance')
  Future<HttpResponse<VerifyModel>> userSendEmailVerifyCode(
    @Body() FormData body,
  );

  /// 发送短信验证码-用户登录二次验证
  @POST('/mapi/user/send_sms_verify_code/authorize_advance')
  Future<HttpResponse<VerifyModel>> userSmsEmailVerifyCode(
    @Body() FormData body,
  );

  /// 登录二次验证
  @POST('/mapi/user/authorize_advance')
  Future<HttpResponse<UserModel>> userAuthorizeAdvance(
    @Body() FormData body,
  );

  /// 发送邮箱验证码
  @POST('/mapi/user/send_email_verify_code')
  Future<HttpResponse<VerifyModel>> userSendEmail(
    @Body() FormData body,
  );

  /// 发送手机验证码
  @POST('/mapi/user/send_sms_verify_code')
  Future<HttpResponse<VerifyModel>> userSendSms(
    @Body() FormData body,
  );

  /// 资产流水信息
  @POST('/mapi/asset/balance_flow')
  Future<HttpResponse<List<AssetsBalanceFlowModel>>> assetsBalanceFlow(
    @Body() FormData body,
  );

  @GET('/mapi/asset/info')
  Future<HttpResponse<AssetsInfoModel>> assetsInfo(
    @Query('unit') String unit,
  );

// 获取邀请信息接口
  @GET('/mapi/invitation/info/get')
  Future<HttpResponse<InvitationInfoModel>> invitationInfoGet();

  // 获取邀请用户列表接口
  @GET('/mapi/invitation/relation/list')
  Future<HttpResponse<InvitationRelationModel>> invitationRelationList();

  // 获取返佣记录列表
  @GET('/mapi/invitation/bonus/list')
  Future<HttpResponse<InvitationBonusModel>> invitationBounsList();

  // 获取返佣活动等级列表
  @GET('/mapi/invitation/feeback/level/list')
  Future<HttpResponse<List<InvitationFeebackModel>>> invitationFeebackLevel();

  // 获取邀请返佣配置模板信息(邀请返佣的模板在PC端或者APP端生成)
  @GET('/mapi/invitation/share/template_info')
  Future<HttpResponse<InvitationTempModel>> invitationTemplateInfo();

  // 换绑邮箱
  @POST('/mapi/user/alter_email')
  Future<HttpResponse<ReturnSuccessStatusModel>> alterEmail(
    @Body() FormData body,
  );

  // 换绑邮箱
  @POST('/mapi/user/alter_mobile')
  Future<HttpResponse<ReturnSuccessStatusModel>> alterMobile(
    @Body() FormData body,
  );

  // 修改密码
  @POST('/mapi/user/update_pwd')
  Future<HttpResponse<ReturnSuccessStatusModel>> updatePwd(
    @Body() FormData body,
  );

  // 设置/修改资金密码 type 1 设置资金密码 2 修改资金密码
  @POST('/mapi/user/trade_pwd/set')
  Future<HttpResponse<ReturnSuccessStatusModel>> tradePwdSet(
    @Body() FormData body,
  );

  // 绑定手机号
  @POST('/mapi/user/bind_mobile')
  Future<HttpResponse<ReturnSuccessStatusModel>> bindMobile(
    @Body() FormData body,
  );

  // 绑定邮箱
  @POST('/mapi/user/bind_email')
  Future<HttpResponse<ReturnSuccessStatusModel>> bindEmail(
    @Body() FormData body,
  );

  // 获取绑定GA数据
  @POST('/mapi/user/before_bind_ga')
  Future<HttpResponse<GAInfoModel>> beforeBindGa();

  // 绑定GA
  @POST('/mapi/user/bind_ga')
  Future<HttpResponse<ReturnSuccessStatusModel>> bindGa(
    @Body() FormData body,
  );

  // 获取换绑GA数据
  @POST('/mapi/user/before_alter_ga')
  Future<HttpResponse<GAInfoModel>> beforeAlterGa();

  // 换绑GA
  @POST('/mapi/user/alter_ga')
  Future<HttpResponse<ReturnSuccessStatusModel>> alterGa(
    @Body() FormData body,
  );

  // 获取实名信息(目前只支持获取个人用户的实名信息)
  @GET('/mapi/user/verify_info')
  Future<HttpResponse<AuthenticationModel>> verifyInfo();

  // 实名认证
  @POST('/mapi/user/verify')
  Future<HttpResponse<AuthenticationModel>> verify(
    @Body() FormData body,
  );

  // 用户KYC基础认证
  @POST('/mapi/user/kyc/basicverify')
  Future<HttpResponse<AuthenticationModel>> kycBasicVerify(
    @Body() FormData body,
  );

  // 获取用户KYC级别信息
  @GET('/mapi/user/kyclevel')
  Future<HttpResponse<List<KycAuthenticationInformationModel>>> userKycLevel();

  // 实名认证上传图片
  @POST('/mapi/user/verify/upload_image')
  Future<HttpResponse<UpLoadImageModel>> verifyUploadImage(
    @Body() FormData body,
  );

  // 上传图片
  @GET('/mapi/user/upload_image')
  Future<HttpResponse<UpLoadImageModel>> uploadImage(
    @Body() FormData body,
  );
  // 用户证件照KYC认证
  @POST('/mapi/user/kyc/photoverify')
  Future<HttpResponse<KycPhotoVerifyModel>> kycPhotoVerify(
    @Body() FormData body,
  );
}
