import 'package:ceex_flutter/model/contract/contract_entrust_model.dart';

class ContractEntrustState {
  final List<ContractEntrustModel> items;
  ContractEntrustState({this.items = const []});
// 初始化
  factory ContractEntrustState.initialState() {
    return ContractEntrustState(
      items: [],
    );
  }

}
