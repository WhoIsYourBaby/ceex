import 'package:ceex_flutter/model/model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'basic_repository.g.dart';

@RestApi()
abstract class BasicRepository {
  factory BasicRepository(Dio dio, {String baseUrl}) = _BasicRepository;

  /// 聚合k线
  @GET("/ms_api/basic/app_config")
  Future<HttpResponse<AppConfigModel>> appConfig(
    @Queries() AppConfigQuery queries,
  );

  @GET("/ms_api/basic/token")
  Future<HttpResponse<TokenInfoModel>> tokenInfo(
    @Query('token_id') String tokenId,
  );

  @GET("/ms_api/basic/announcements")
  Future<HttpResponse<List<AnnouncementModel>>> getAnnouncements();
}
