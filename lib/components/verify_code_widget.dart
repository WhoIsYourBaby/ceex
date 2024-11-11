import 'dart:async';

import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class VerifyCode2FAModel {
  // 3-google验证、1-邮箱、2-手机
  int? authType;
  String? orderId;
  String? verifyCode;
  VerifyCode2FAModel({
    this.authType,
    this.orderId,
    this.verifyCode,
  });
}

/// 针对requestId发起验证
/// 使用场景：提币验证
/// [receiverType]
class VerifyCodeWidget extends StatefulWidget {
  final int type;
  final int receiverType;
  const VerifyCodeWidget({
    required this.type,
    required this.receiverType,
    super.key,
  });

  @override
  State<VerifyCodeWidget> createState() => VerifyCodeWidgetState();
}

class VerifyCodeWidgetState extends State<VerifyCodeWidget> {
  final TextEditingController _controller = TextEditingController();
  final focusNode = FocusNode();
  Timer? _timer;
  final int limitSeconds = 60;
  String get verifyCode => _controller.text;
  VerifyCode2FAModel model2fa = VerifyCode2FAModel();
  @override
  void initState() {
    if (widget.receiverType == 1) {
      model2fa.authType = 1;
    } else if (widget.receiverType == 2) {
      model2fa.authType = 2;
    } else {
      model2fa.authType = 3;
    }
    focusNode.requestFocus();
    sendVerifyCode();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            onChanged: (value) {
              model2fa.verifyCode = value;
            },
            focusNode: focusNode,
            controller: _controller,
            decoration: InputDecoration(
              suffix: TextButton(
                onPressed: sendVerifyCode,
                child: Text(
                  _timer == null
                      ? "发送验证码"
                      : "${limitSeconds - (_timer?.tick ?? 0)}",
                  style: context
                      .read<AppconfCubit>()
                      .state
                      .appTheme
                      .colorSet
                      .textBlack
                      .style(),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  sendVerifyCode() async {
    if (_timer != null) {
      return;
    }
    startTimer();
    setState(() {});
    final repo = GetIt.I.get<UserRepository>();
    final resp = await repo.sendVerfyCode(widget.receiverType, widget.type);
    model2fa.orderId = resp.data.orderId;
  }

  startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (timer.tick >= limitSeconds) {
        _timer?.cancel();
        _timer = null;
      }
      setState(() {});
    });
  }

  @override
  void deactivate() {
    super.deactivate();
  }
}
