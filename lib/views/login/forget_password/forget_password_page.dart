import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/utils/touch_up_keyboard.dart';
import 'package:ceex_flutter/views/login/components/login_app_bar.dart';
import 'package:ceex_flutter/views/login/forget_password/forget_password_email.dart';
import 'package:ceex_flutter/views/login/forget_password/forget_password_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

/**
 * 忘记密码
 */
class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const ForgetPasswordPage());

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
  late TabController _tabController;
  final List _tabs = [0, 1];
  List<Widget> tabView = [
    ForgetPasswordEmail(),
    ForgetPasswordPhone(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: _tabs.length);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    super.build(context); //保存状态有效
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return WillPopScope(
        onWillPop: () async {
          context.read<LoginViewCubit>().dispose();
          return true;
        },
        child: TouchUpKeyboard(
          context: context,
          child: Scaffold(
          appBar: LoginAppBar(
            type: AppLocalizations.of(context)!.accountRegister,
            needLoginSign: false,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 8, left: 15, bottom: 6),
                  child: Text(
                    AppLocalizations.of(context)!.forgetYourPassword,
                    style: appTheme.colorSet.textBlack.style(fontSize: 24),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 0, left: 15, bottom: 48),
                  child: Text(
                    AppLocalizations.of(context)!.forgetYourPasswordTextTwo,
                    style: appTheme.colorSet.textBlack.style(fontSize: 12),
                  )),
              TabBar(
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  labelPadding: EdgeInsets.only(right: 32, bottom: 10),
                  labelColor: context.read<AppconfCubit>().state.appTheme.colorSet.textBlack,
                  unselectedLabelColor: context.read<AppconfCubit>().state.appTheme.colorSet.textGrey,
                  controller: _tabController,
                  padding: EdgeInsets.only(left: 15),
                  unselectedLabelStyle: appTheme.colorSet.textBlack.style(fontSize: 16, fontWeight: FontWeight.w600),
                  labelStyle: appTheme.colorSet.textGrey2.style(fontSize: 16, fontWeight: FontWeight.w600),
                  indicatorColor: appTheme.colorSet.colorDark,
                  indicatorSize:TabBarIndicatorSize.label,
                  tabs: [
                    Text(AppLocalizations.of(context)!.loginSignViewEmail),
                    Text(AppLocalizations.of(context)!.loginSignViewPhone)
                  ]),
              Expanded(
                  child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: tabView,
              ))
            ],
          ),
        ))) ;
  }
}
