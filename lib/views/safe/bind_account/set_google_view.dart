import 'dart:convert';

import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/google_ver/google_ver_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_center_view_cubit.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/views/safe/bind_account/bind_google_ver.dart';
import 'package:ceex_flutter/views/safe/components/safe_input_text_widget.dart';
import 'package:ceex_flutter/views/safe/replace_account/replace_google_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 设置Google
class SetGoogleView extends StatefulWidget {
  final SafeVerType safeVerType;
  final bool isBind;
  final VoidCallback didLogin;
  const SetGoogleView(
      {required this.safeVerType,
      required this.isBind,
      required this.didLogin,
      super.key});
  static Route route(
          {required SafeVerType safeVerType,
          bool isBind = true,
          VoidCallback? didLogin}) =>
      MaterialPageRoute(
          builder: (context) => SetGoogleView(
                safeVerType: safeVerType,
                isBind: isBind,
                didLogin: didLogin ?? () {},
              ));

  @override
  State<SetGoogleView> createState() => _SetGoogleViewState();
}

class _SetGoogleViewState extends State<SetGoogleView> {
  late AppTheme appTheme;
  late SafeInputTextWidget safeInputTextWidget;
  String title = "";
  final cubit = GoogleVerCubit();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    if (widget.isBind) {
      cubit.getBeforeBindGa();
    } else {
      cubit.getBeforeAlterGa();
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.colorSet.textWhite,
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: const AppBarCenterText(
            title: "设置密钥",
          ),
        ),
        body: SafeArea(
            bottom: true,
            child: BlocBuilder<GoogleVerCubit, GoogleVerState>(
                bloc: cubit,
                builder: (context, state) {
                  return CustomScrollView(slivers: [
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 20,
                    )),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "为了您的账户安全，请将16位密钥记录在纸上，并保存在安全的地方，如遇手机丢失，请通过该密钥恢复你的谷歌验证",
                              textAlign: TextAlign.center,
                              style: appTheme.colorSet.textBlack.style(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 20,
                    )),
                    SliverToBoxAdapter(
                        child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                              color: appTheme.colorSet.colorLight,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(state.secretKey ?? "--",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: appTheme.colorSet.textBlack
                                          .style(fontSize: 12))),
                              GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(ClipboardData(
                                      text: state.secretKey ?? "--",
                                    ));
                                    showMsg("复制成功");
                                  },
                                  child: Text("复制",
                                      style: appTheme.colorSet.textBlack
                                          .style(fontSize: 12)))
                            ],
                          )),
                    )),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 20,
                    )),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                                "您需要在Google Authenticator 添加一个Ceex账户，并编入16位密钥",
                                textAlign: TextAlign.center,
                                style: appTheme.colorSet.textBlack
                                    .style(fontSize: 12)))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 20,
                    )),
                    SliverToBoxAdapter(
                        child: state.qrcode == null
                            ? const SizedBox()
                            : Image.memory(
                                base64.decode(state.qrcode ?? ""),
                                height: 174,
                                width: 174,
                                fit: BoxFit.contain,
                              )),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 20,
                    )),
                    SliverToBoxAdapter(
                      child: GestureDetector(
                          onTap: () {
                            if (state.secretKey == null ||
                                state.secretKey == "") {
                              return;
                            }
                            if (widget.isBind) {
                              Navigator.push(
                                  context,
                                  BindGoogleVer.route(
                                      safeVerType: widget.safeVerType,
                                      didLogin: widget.didLogin));
                            } else {
                              Navigator.push(
                                  context,
                                  ReplaceGoogleView.route(
                                      safeVerType: widget.safeVerType,
                                      didLogin: widget.didLogin));
                            }
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
                                  color: state.secretKey == null ||
                                          state.secretKey == ""
                                      ? appTheme.colorSet.colorGrey
                                      : appTheme.colorSet.colorDark),
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              padding: const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              child: Text("下一步",
                                  style: appTheme.colorSet.textWhite.style(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)))),
                    )
                  ]);
                })));
  }
}
