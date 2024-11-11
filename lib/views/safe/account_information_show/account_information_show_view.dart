import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_center_view_cubit.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/safe/bind_account/bind_email.dart';
import 'package:ceex_flutter/views/safe/bind_account/bind_google_ver.dart';
import 'package:ceex_flutter/views/safe/bind_account/bind_phone.dart';
import 'package:ceex_flutter/views/safe/bind_account/set_google_view.dart';
import 'package:ceex_flutter/views/safe/components/safe_dialog.dart';
import 'package:ceex_flutter/views/safe/replace_account/replace_email_view.dart';
import 'package:ceex_flutter/views/safe/replace_account/replace_phone_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountInformationShowView extends StatefulWidget {
  final String account;
  final SafeVerType safeVerType;
  final VoidCallback didLogin;
  const AccountInformationShowView(
      {required this.account,
      required this.safeVerType,
      required this.didLogin,
      super.key});
  static Route route(
          {String? account,
          required SafeVerType safeVerType,
          VoidCallback? didLogin}) =>
      MaterialPageRoute(
          builder: (context) => AccountInformationShowView(
                account: account ?? "",
                safeVerType: safeVerType,
                didLogin: didLogin ?? () {},
              ));
  @override
  State<AccountInformationShowView> createState() =>
      _AccountInformationShowViewState();
}

class _AccountInformationShowViewState
    extends State<AccountInformationShowView> {
  late AppTheme appTheme;
  late BuildContext _buildContext;

  String title = "";
  String accountType = "";
  String changeText = "";

  @override
  void initState() {
    super.initState();
    initValue();
  }

  initValue() {
    switch (widget.safeVerType) {
      case SafeVerType.email:
        title = "邮箱信息";
        accountType = "邮箱";
        changeText = "更换绑定邮箱";
        break;
      case SafeVerType.phone:
        title = "手机号信息";
        accountType = "手机号";
        changeText = "更换绑定手机号";
        break;
      case SafeVerType.google:
        title = "谷歌验证信息";
        accountType = "谷歌验证";
        changeText = "更换绑定谷歌验证";
        break;
      case SafeVerType.finger:
        title = "指纹验证";
        break;
      default:
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _buildContext = context;
    appTheme = context.watch<AppconfCubit>().state.appTheme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.colorSet.textWhite,
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: AppBarCenterText(
            title: title,
          ),
        ),
        body: SafeArea(
            bottom: true,
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      accountType,
                      style: appTheme.colorSet.textBlack.style(fontSize: 15),
                    ),
                    const Spacer(),
                    Text(
                      widget.account,
                      style: appTheme.colorSet.textBlack.style(),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                    onTap: () => clickChange(),
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          changeText,
                          style:
                              appTheme.colorSet.textBlack.style(fontSize: 15),
                        ),
                        const Spacer(),
                        Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ))
              ],
            )));
  }

  clickChange() async {
    bool bindGA = UserInfoManager.shared.userBaseInfoModel?.bindGA ?? false;
    String phone = UserInfoManager.shared.userBaseInfoModel?.mobile ?? "";
    String email = UserInfoManager.shared.userBaseInfoModel?.email ?? "";
    bool bindPhone = phone.isNotEmpty;
    bool bindEmail = email.isNotEmpty;
    if (((bindEmail && bindPhone) ||
        (bindEmail && bindGA) ||
        (bindPhone && bindGA))) {
      switch (widget.safeVerType) {
        case SafeVerType.phone:
          Navigator.push(
              context,
              ReplacePhoneView.route(
                  safeVerType: widget.safeVerType, didLogin: widget.didLogin));
          break;
        case SafeVerType.email:
          Navigator.push(
              context,
              ReplaceEmailView.route(
                  safeVerType: widget.safeVerType, didLogin: widget.didLogin));
          break;
        case SafeVerType.google:
          Navigator.push(
              _buildContext,
              SetGoogleView.route(
                  safeVerType: widget.safeVerType,
                  isBind: false,
                  didLogin: widget.didLogin));
          break;
        default:
      }
      return;
    } else {
      List<String> bindType = [];
      if (!bindGA) {
        bindType.add("谷歌验证");
      }
      if (!bindPhone) {
        bindType.add("手机验证");
      }
      if (!bindEmail) {
        bindType.add("邮箱验证");
      }
      var result =
          await showSafeChangeDialog(context: _buildContext, data: bindType);
      if (result != null) {
        jumpPage(result);
      }
    }
  }

  jumpPage(var result) {
    if (result == "谷歌验证") {
      Navigator.push(
          _buildContext, BindGoogleVer.route(safeVerType: widget.safeVerType,didLogin: widget.didLogin));
    } else if (result == "手机验证") {
      Navigator.push(
          _buildContext,
          BindPhone.route(
              safeVerType: widget.safeVerType,
              isFromSafeCenter: false,
              didLogin: widget.didLogin));
    } else if (result == "邮箱验证") {
      Navigator.push(
          _buildContext,
          BindEmail.route(
              safeVerType: widget.safeVerType, didLogin: widget.didLogin));
    }
  }
}
