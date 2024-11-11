import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'input_text_field_state.dart';
part 'input_text_field_cubit.freezed.dart';

class InputTextFieldCubit extends Cubit<InputTextFieldState> {
  InputTextFieldCubit()
      : super(const InputTextFieldState.initial(
            isVerSent: false,
            countdown: 60,
            hasFocus: false,
            showPassword: false));
  int i = 0;
  // 获取焦点
  void focusChanged(bool hasFocus) {
    i++;
    emit(state.copyWith(hasFocus: hasFocus));
  }
}
