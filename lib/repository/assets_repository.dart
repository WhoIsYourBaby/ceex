import "package:ceex_flutter/model/assets/account_assets_model.dart";
import "package:ceex_flutter/model/assets/address_check_model.dart";
import "package:ceex_flutter/model/assets/assets_balance_flow_model.dart";
import "package:ceex_flutter/model/assets/order_list_model.dart";
import "package:ceex_flutter/model/assets/recharge_qr_code_model.dart";
import "package:ceex_flutter/model/assets/sub_account_query_model.dart";
import "package:ceex_flutter/model/assets/transfer_available_model.dart";
import "package:ceex_flutter/model/assets/withdraw_create_model.dart";
import "package:ceex_flutter/model/model.dart";
import "package:ceex_flutter/model/user/level_money_model.dart";
import "package:ceex_flutter/model/user/user_account_money_model.dart";
import "package:dio/dio.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:retrofit/retrofit.dart";

part "assets_repository.g.dart";

@RestApi()
abstract class AssetsRepository {
  factory AssetsRepository(Dio dio, {String baseUrl}) = _AssetsRepository;

  /// 获取用户资产信息
  @POST("/mapi/account/get")
  Future<HttpResponse<AccountAssetsModel>> accountGet(
    @Body() FormData body,
  );

  /// 获取杠杆账户资产信息
  @GET("/mapi/v1/margin/asset/get")
  Future<HttpResponse<List<LevelMoneyModel>>> marginAssetsGet();

  @GET('/mapi/asset/info')
  Future<HttpResponse<AssetsInfoModel>> assetsInfo(
    @Query('unit') String unit,
  );

  /// 获取用户资产信息
  @POST("/mapi/asset/get")
  Future<HttpResponse<List<UserAccountMoneyModel>>> assetGet();

  //子账户可划转资产查询
  @POST("/mapi/account/sub_account/transfer/available")
  Future<HttpResponse<TransferAvailableModel>> transferAvailable(
    @Body() FormData body,
  );

  /// 资产流水信息/提币的其他历史记录
  @POST("/mapi/asset/balance_flow")
  Future<HttpResponse<List<AssetsBalanceFlowModel>>> assetsBalanceFlow(
    @Body() FormData body,
  );

  // 账户列表
  @POST("/mapi/account/sub_account/query")
  Future<HttpResponse<List<SubAccountQueryModel>>> subAccountQuery();

  // 子账户转账
  @POST("/mapi/account/sub_account/transfer")
  Future<HttpResponse<dynamic>> subAccountTransfer(
    @Body() FormData body,
  );

  @GET("/mapi/asset/withdrawal/quota_info")
  Future<HttpResponse<QuotaInfoModel>> getQuotaInfo(
    @Query("token_id") String? tokenId,
    @Query("chain_type") String? chainType,
  );

  // 获取充币地址
  @GET("/mapi/asset/deposit/address")
  Future<HttpResponse<RechargeQrCodeModel>> depositAddress(
    @Query("token_id") String? tokenId,
    @Query("chain_type") String? chainType,
  );

  /// 充币历史记录
  @GET("/mapi/asset/deposit/order_list")
  Future<HttpResponse<List<OrderListModel>>> depositOrderList(
    @Query("limit") @Default(20) int limit,
    @Query("token_id") String tokenId,
    @Query("from_order_id") String? fromOrderId,
  );

  /// 提币历史记录
  @GET("/mapi/asset/withdrawal/order_list")
  Future<HttpResponse<List<OrderListModel>>> withdrawOrderList(
    @Query("limit") @Default(20) int limit,
    @Query("token_id") String tokenId,
    @Query("from_order_id") String? fromOrderId,
  );

  /// 提币的其他历史记录
  @POST("/mapi/asset/balance_flow")
  Future<HttpResponse<List<AssetsBalanceFlowModel>>> otherOrderList(
    @Query("limit") @Default(20) int limit,
    @Query("token_id") String tokenId,
    @Query("from_order_id") String? fromOrderId,
  );

  /// 提币地址检查
  @GET("/mapi/asset/withdrawal/address/check")
  Future<HttpResponse<AddressCheckModel>> withdrawAddressCheck(
    @Query("token_id") String tokenId,
    @Query("chain_type") String chainType,
    @Query("address") String address,
  );

  /// 提币
  @POST("/mapi/asset/withdrawal/create")
  @FormUrlEncoded()
  Future<HttpResponse<WithdrawCreateModel>> withdrawCreate(
    @Body() Map<String, dynamic> body,
  );

  /// 提币验证码
  /// [request_id] 需要验证的request_id
  @POST('/mapi/asset/withdrawal/verify_code')
  @FormUrlEncoded()
  Future<HttpResponse<VerifyModel>> withdrawVerifyCode(
    // @Body() Map<String, dynamic> body,
    @Field("request_id") String requestId,
  );

  /// 使用验证码验证提币
  @POST('/mapi/asset/withdrawal/verify')
  @FormUrlEncoded()
  Future<HttpResponse<VerifyModel>> verifyWithdraw(
    /// 时间戳
    @Field("client_order_id") String clientOrderId,
    @Field("code_order_id") String codeOrderId,
    @Field("request_id") String requestId,
    @Field("token_id") String tokenId,
    @Field("verify_code") String verifyCode,
  );
}
