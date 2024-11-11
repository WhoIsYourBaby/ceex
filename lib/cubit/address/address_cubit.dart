import 'package:ceex_flutter/model/address/add_address_model.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/model/quote_tokens/quote_tokens_model.dart';
import 'package:ceex_flutter/repository/address_repository.dart';
import 'package:ceex_flutter/repository/publish_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

part 'address_state.dart';
part 'address_cubit.freezed.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressCubit() : super(AddressState.initial());

  // 默认获取所有地址
  void requiredAddressAllList() async {
    showLoading();
    final repo = GetIt.I.get<AddressRepository>();
    final resp = repo.addressAllList();
    resp.then((value) {
      emit(state.copyWith(addressList: value.data));
      dismissAllToast();
    });
  }

  // 更新地址列表
  upDataAddressList() {
    showLoading();
    final repo = GetIt.I.get<AddressRepository>();
    final formData = FormData.fromMap({
      "token_id": state.bbType,
      "chain_type": state.netAddress,
    });
    final resp = repo.addressListByToken(formData);
    resp.then((value) async {
      dismissAllToast();
      emit(state.copyWith(addressList: value.data));
    });
  }

  // 更新网络列表
  upDataNetList(List<TokenModel> list) {
    for (var element in list) {
      if (element.tokenId == state.bbType) {
        emit(state.copyWith(netAddressList: element.chainTypes!));
        return;
      }
    }
  }

  upDataNetType() {}

  void requiredAllType() async {
    // final repo = GetIt.I.get<AddressRepository>();
    // final resp = repo.addressAllList();
    // resp.then((value) {
    //   emit(state.copyWith(addressList: value.data));
    //   dismissAllToast();
    // });
  }

  // 请求所有币名称列表
  void requiredAllBB() async {
    final repo = GetIt.I.get<PublishRepository>();
    final resp = repo.basicTokens();
    resp.then((value) async {
      dismissAllToast();
      emit(state.copyWith(bbTypeList: value.data));
    });
  }

  // 更新tab类型
  void upDataAddressType({required String type, required TopType topType}) {
    switch (topType) {
      case TopType.bb:
        emit(state.copyWith(bbType: type));
        break;
      case TopType.net:
        emit(state.copyWith(netAddress: type));
        break;
      default:
    }
  }

  addAddress() async {
    final _userRepo = GetIt.I.get<AddressRepository>();
    final formData = FormData.fromMap({
      "token_id": "USDT",
      "order_id": "1232321231313",
      "verify_code": "222222",
      "chain_type": "ERC20",
      "address": "0x3B5dc920218c20266c00902098Fd2622CC82Fbf2",
      "remark": "CNY",
      "auth_type": "1",
    });
    final resp = _userRepo.addAddress(formData);
    resp.then((value) {});
  }

  deleteAddress(int address_id) async {
    showLoading();
    final _userRepo = GetIt.I.get<AddressRepository>();
    final formData = FormData.fromMap({
      "address_id": address_id,
    });
    final resp = _userRepo.deleteAddress(formData);
    resp.then((value) {
      if (value.data.success) {
        requiredAddressAllList();
      } else {
        showMsg("删除失败，请重试");
        dismissAllToast();
      }
    });
  }
}

enum TopType { bb, net }
