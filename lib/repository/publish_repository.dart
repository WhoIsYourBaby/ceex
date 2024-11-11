import 'package:ceex_flutter/model/publish/app_version_config_model.dart';
import 'package:ceex_flutter/model/publish/countries_model.dart';
import 'package:ceex_flutter/model/publish/geev_register_model.dart';
import 'package:ceex_flutter/model/publish/rates_model.dart';
import 'package:ceex_flutter/model/quote_tokens/quote_tokens_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'publish_repository.g.dart';

/// 公共接口
@RestApi()
abstract class PublishRepository{
  factory PublishRepository(Dio dio, {String baseUrl}) = _PublishRepository;

  /// 手机区号列表
  @GET("/ms_api/basic/countries")
  Future<HttpResponse< List<CountriesModel>?>> countries();

  // 汇率
  @POST("/api/quote/v1/rates")
  Future<HttpResponse<RatesModel>> quoteV1Rates(
    @Body() FormData body,
  );

  // token列表
  @GET("/ms_api/basic/tokens")
  Future<HttpResponse<List<QuoteTokensModel>>> basicTokens();

  // 版本
  @POST("/ms_api/basic/version_config")
  Future<HttpResponse<AppVersionCongfigModel>> versionConfig(
    @Body() FormData body,
  );

  // 极验challenge获取
  @POST("/mapi/basic/geev3/register")
  Future<HttpResponse<GeevRegisterModel>> geev3Register(
    @Body() FormData body,
  );
}