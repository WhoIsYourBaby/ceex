import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'verify_second_state.dart';
part 'verify_second_cubit.freezed.dart';

class VerifySecondCubit extends Cubit<VerifySecondState> {
  VerifySecondCubit() : super(VerifySecondState.initial());

    // 输入框焦点
  void focusChanged(bool hasFocus) {
    // emit(state.copyWith(hasFocus: hasFocus));
  }


}
