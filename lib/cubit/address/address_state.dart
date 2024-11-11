part of 'address_cubit.dart';


@freezed
class AddressState with  _$AddressState{
  const factory AddressState.initial({
    String? netAddress,
    List<AddAddressModel>? addressList,
    List<QuoteTokensModel>? bbTypeList,
    String? bbType,
    List<ChainTypesModel>? netAddressList,

  }) = _Initial;
}