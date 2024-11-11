import 'dart:async';

import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/repository/assets_repository.dart';
import 'package:ceex_flutter/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

/// 针对requestId发起验证
/// 使用场景：提币验证
class VerifyRequestWidget extends StatefulWidget {
  final String requestId;
  final String title;
  const VerifyRequestWidget({
    required this.title,
    required this.requestId,
    super.key,
  });

  @override
  State<VerifyRequestWidget> createState() => VerifyRequestWidgetState();
}

class VerifyRequestWidgetState extends State<VerifyRequestWidget> {
  final TextEditingController _controller = TextEditingController();
  final focusNode = FocusNode();
  Timer? _timer;
  final int limitSeconds = 60;
  String get verifyCode => _controller.text;
  @override
  void initState() {
    focusNode.requestFocus();
    // startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Text(widget.title),
          TextField(
            focusNode: focusNode,
            controller: _controller,
            decoration: InputDecoration(
              // suffix: TextButton(
              //   onPressed: sendVerifyCode,
              //   child: Text(
              //     _timer == null
              //         ? "发送验证码"
              //         : "${limitSeconds - (_timer?.tick ?? 0)}",
              //     style: context
              //         .read<AppconfCubit>()
              //         .state
              //         .appTheme
              //         .colorSet
              //         .textBlack
              //         .style(),
              //   ),
              // ),
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
    final repo = GetIt.I.get<AssetsRepository>();
    await repo.withdrawVerifyCode(widget.requestId);
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
