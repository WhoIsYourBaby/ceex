part of 'contract_diffdepth_cubit.dart';

@freezed
class ContractDiffdepthiState with _$ContractDiffdepthiState{
  const factory ContractDiffdepthiState.initial({
    List<List<String>?>? a,
    double? aMax,
    List<List<String>?>? b,
    double? bMax,
  }) = _Initial;
}

