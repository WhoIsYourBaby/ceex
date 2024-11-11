import 'package:ceex_flutter/model/place_order/place_order_model.dart';
import 'package:ceex_flutter/model/publish/return_success_status_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'contract_repository.g.dart';

@RestApi()
abstract class ContractRepository{
  factory ContractRepository(Dio dio, {String baseUrl}) = _ContractRepository;

  /// 下单
  @POST("/mapi/order/create")
  Future<HttpResponse<PlaceOrderModel>?> orderCreate(
    @Body() FormData body,
  );

  // 撤单
  @POST('/mapi/order/cancel')
  Future<HttpResponse<PlaceOrderModel>> orderCancel(
    @Body() FormData body,
  );

  // 批量
  @POST('/mapi/order/batch_cancel')
  Future<HttpResponse<ReturnSuccessStatusModel>> orderBatchCancel(
    @Body() FormData body,
  );
}