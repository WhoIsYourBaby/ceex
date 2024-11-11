import 'package:ceex_flutter/model/address/add_address_model.dart';
import 'package:ceex_flutter/model/publish/return_success_status_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'address_repository.g.dart';

@RestApi()
abstract class AddressRepository {
  factory AddressRepository(Dio dio, {String baseUrl}) = _AddressRepository;

  // 提币常用地址
  @POST("/mapi/asset/withdrawal/address_list")
  Future<HttpResponse<List<AddAddressModel>>> addressAllList();

    // 提币常用地址
  @POST("/mapi/asset/withdrawal/address_list")
  Future<HttpResponse<List<AddAddressModel>>> addressListByToken(
      @Body() FormData body,
  );

  // 添加提币常用地址
  @POST("/mapi/asset/withdrawal/address/add")
  Future<HttpResponse<AddAddressModel>> addAddress(
    @Body() FormData body,
  );
    // 删除提币地址
  @POST("/mapi/asset/withdrawal/address/delete")
  Future<HttpResponse<ReturnSuccessStatusModel>> deleteAddress(
    @Body() FormData body,
  );
}
