import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/authentication/authentication_cubit.dart';
import 'package:ceex_flutter/model/authentication/kyc_authentication_information_model.dart';
import 'package:ceex_flutter/views/authentication/lv_one_auth_view.dart';
import 'package:ceex_flutter/views/authentication/lv_two_auth_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class AuthenticationView extends StatefulWidget {
  const AuthenticationView({super.key});
  static Route route() =>
      MaterialPageRoute(builder: (context) => const AuthenticationView());

  @override
  State<AuthenticationView> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends State<AuthenticationView> {
  late AppTheme appTheme;
  final cubit = AuthenticationCubit();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    cubit.getVerifyInfo();
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
            title: "身份认证",
          ),
        ),
        body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
            bloc: cubit,
            builder: (context, state) {
              return SafeArea(
                bottom: true,
                child: CustomScrollView(slivers: [
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 20,
                  )),
                  SliverToBoxAdapter(
                      child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        state.name ?? "",
                        style: appTheme.colorSet.textBlack.style(fontSize: 14),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        state.number ?? "",
                        style: appTheme.colorSet.textBlack.style(fontSize: 14),
                      ),
                    ],
                  )),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 6,
                  )),
                  SliverToBoxAdapter(
                    child: Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("完成个人身份认证，可获得以下权限",
                            style: appTheme.colorSet.textGrey3
                                .style(fontSize: 14))),
                  ),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 20,
                  )),
                  SliverToBoxAdapter(
                      child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    height: 1,
                    color: appTheme.colorSet.colorLight,
                  )),
                  SliverToBoxAdapter(
                      child: state.kycInfoList!.isNotEmpty
                          ? Column(
                              children: showStatus(),
                            )
                          : const SizedBox()),
                ]),
              );
            }));
  }

  List<Widget> showStatus() {
    List<Widget> children = [];
    for (var i = 0; i < cubit.state.kycInfoList!.length; i++) {
      KycAuthenticationInformationModel model = cubit.state.kycInfoList![i];
      Widget row = const SizedBox();
      if (model.displayLevel == "1") {
        //一级认证
        row = rowWidget(type: "Lv.1 基础认证", model: model);
        children.add(row);
      } else if (model.displayLevel == "2") {
        //二级认证
        row = rowWidget(type: "Lv.2 高级认证", model: model);
        children.add(row);
      } else if (model.displayLevel == "3") {
        //三级认证
        row = rowWidget(type: "Lv.3 视频认证", model: model);
        children.add(row);
      }
    }
    return children;
  }

  Widget rowWidget({
    required String type,
    required KycAuthenticationInformationModel model,
  }) {
    return GestureDetector(
        onTap: () => authenClick(model),
        child: Container(
            color: appTheme.colorSet.textWhite,
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: Row(
              children: [
                Text(type),
                const Spacer(),
                model.verifyStatus == 2
                    ? Image.asset(R.ASSETS_IMAGES_CHECK_CIRCLE_LINE_P_PNG)
                    : Image.asset(R.ASSETS_IMAGES_WARNING_ICON_PNG),
                const SizedBox(
                  width: 6,
                ),
                widgetStatus(model),
                const SizedBox(
                  width: 6,
                ),
                Image.asset(R.ASSETS_IMAGES_ARROWS_CHEVRON_CHEVRON_RIGHT_PNG)
              ],
            )));
  }

  Widget widgetStatus(KycAuthenticationInformationModel model) {
    Widget text = const SizedBox();
    switch (model.verifyStatus) {
      case 0: // 未提交审核
        text = Text("未提交审核",
            style: appTheme.colorSet.textBlack.style(fontSize: 14));
        break;
      case 1: // 审核中
        text =
            Text("审核中", style: appTheme.colorSet.textBlack.style(fontSize: 14));
        break;
      case 2: // 审核通过
        text = Text("审核通过",
            style: appTheme.colorSet.textBlack.style(fontSize: 14));
        break;
      case 3: // 未通过审核
        text = Text("未通过审核",
            style: appTheme.colorSet.textBlack.style(fontSize: 14));
        break;
      default:
    }
    return text;
  }

  // 认证点击事件
  authenClick(KycAuthenticationInformationModel model) async {
    {
      if (model.verifyStatus == 2) {
        return;
      }
      if (model.allowVerify ?? false) {
        switch (model.displayLevel) {
          case "1":
            var result = await Navigator.push(context, LvOneAuthView.route());
            if (result != null && result) {
              cubit.getVerifyInfo();
            }
            break;
          case "2":
            var result = await Navigator.push(context, LvTwoAuthView.route());
            if (result != null && result) {
              cubit.getVerifyInfo();
            }
            break;
          case "3":
            break;
          default:
        }
      } else {
        showToast("请先完成上一级认证");
      }
    }
  }
}
