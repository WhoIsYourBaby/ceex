import 'package:flutter/services.dart';


/// 金额输入限制
class AmountInputFormatter extends FilteringTextInputFormatter {
  final int digit;
  String _oldText = '';

  AmountInputFormatter({
    this.digit = 2,
    bool allow = true,
  }) : super(RegExp('[0-9.]'), allow: allow);
  
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final handlerValue = super.formatEditUpdate(oldValue, newValue);
    String value = handlerValue.text;
    int selectionIndex = handlerValue.selection.end;

    ///如果输入框内容为.直接将输入框赋值为0.
    if (value == '.') {
      value = '0.';
      selectionIndex++;
    }
    ///判断小数位数
    if (_getValueDigit(value) > digit || _pointCount(value) > 1) {
      value = oldValue.text;
      selectionIndex = oldValue.text.length;
    }
    // _oldText = value;
    return TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: selectionIndex),
    );
  }

  ///输入多个小数点的情况
  int _pointCount(String value) {
    int count = 0;
    value.split('').forEach((e) {
      if (e == '.') {
        count++;
      }
    });
    return count;
  }

  ///获取目前的小数位数
  int _getValueDigit(String value) {
    if (value.contains('.')) {
      return value.split('.')[1].length;
    } else {
      return -1;
    }
  }
}
