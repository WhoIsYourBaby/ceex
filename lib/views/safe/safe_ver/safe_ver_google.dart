import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/replace_account/replace_email_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_ver_view_cubit.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SafeVerGoogle extends StatefulWidget {
  final SafeVerViewCubit cubit;
  final String newAccount;
  final String newAccountVer;
  final String newOrderId;
  final SafeNeedVerType safeNeedVerType;
  final String areaCode;
  final bool isUseGA;
  const SafeVerGoogle({required this.newAccount,
      required this.newAccountVer,
      required this.newOrderId,
      required this.safeNeedVerType,
      required this.cubit,
      this.areaCode = "",
      required this.isUseGA,super.key});

  @override
  State<SafeVerGoogle> createState() => _SafeVerGoogleState();
}

class _SafeVerGoogleState extends State<SafeVerGoogle> {
  late SafeInputTextWidget safeInputTextWidget;
  late AppTheme appTheme;
  TextEditingController googleController = TextEditingController();
  FocusNode googleFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    googleController.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    safeInputTextWidget =
        SafeInputTextWidget(buildContext: context, appTheme: appTheme);
  }

  @override
  void dispose() {
    super.dispose();
    googleController.dispose();
    googleFocusNode.dispose();
    widget.cubit.close();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SafeVerViewCubit, SafeVerViewState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return CustomScrollView(slivers: [
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
            SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "谷歌验证",
                      style: appTheme.colorSet.textBlack.style(),
                    ))),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 12,
            )),
            SliverToBoxAdapter(
              child: safeInputTextWidget.inputTextField(
                  googleController, googleFocusNode,onChanged: (value) {
              widget.cubit.upDataGaVerCode(value);
            },
                  hintText: "谷歌验证码"),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 100,
            )),
            SliverToBoxAdapter(
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: safeInputTextWidget.loginSignButton(
                      text: "提交",
                      onTap: () => verify())),
            ),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 32,
            )),
          ]);
        });
  }
  // 验证
  void verify() {
    switch (widget.safeNeedVerType) {
      case SafeNeedVerType.bindPhone:
        // 绑定手机号 
        break;
      case SafeNeedVerType.bindEmail:
        // 绑定邮箱
        break;
      case SafeNeedVerType.moneyPassword:
        // 资金密码
        break;
      case SafeNeedVerType.replaceEmail:
        // 更换邮箱 完成
        widget.cubit.changeEmail(
          newEmail: widget.newAccount,
          newEmailVerCode: widget.newAccountVer,
          newOrderId: widget.newOrderId,
          isUseGA:widget.isUseGA,
        );
        break;
      case SafeNeedVerType.replacePhone:
        // 更换手机 完成
        widget.cubit.changePhone(
            newMobile: widget.newAccount,
            newMobileVerCode: widget.newAccountVer,
            newOrderId: widget.newOrderId,
            nationalCode: widget.areaCode,
            isUseGA: widget.isUseGA);
        break;
      default:
    }
  }
}