import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/utils/touch_up_keyboard.dart';
import 'package:ceex_flutter/views/login/components/login_app_bar.dart';
import 'package:ceex_flutter/views/login/login_need_fa_view.dart';
import 'package:ceex_flutter/views/login/login_view_email.dart';
import 'package:ceex_flutter/views/login/login_view_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

// ignore: slash_for_doc_comments
/**
 * Navigator.push(context, LoginViewPage.route()).then((value) {
                setState(() {
                  UserInfoManager.shared.load();
                });
              });
 */
// 登录

class LoginViewPage extends StatefulWidget {
  final VoidCallback didLogin;
  const LoginViewPage({required this.didLogin, super.key});

  static Route route({VoidCallback? didLogin}) => MaterialPageRoute(
        builder: (context) => LoginViewPage(
          didLogin: didLogin ?? () {},
        ),
      );

  @override
  State<LoginViewPage> createState() => _LoginViewPageState();
}

class _LoginViewPageState extends State<LoginViewPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late TabController _tabController;
  final List _tabs = [0, 1];
  int tabIndex = 0;
  List<Widget> tabView = [
    const LoginViewEmail(),
    const LoginViewPhone(),
  ];
  bool needJumpVer = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
    _tabController.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleTabChange() {
    tabIndex = _tabController.index;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); //保存状态有效
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocConsumer<LoginViewCubit, LoginViewState>(
      builder: (ctx, state) {
        return TouchUpKeyboard(
          context: context,
          child: Scaffold(
              appBar: LoginAppBar(
                type: AppLocalizations.of(context)!.accountRegister,
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding:
                          const EdgeInsets.only(top: 8, left: 15, bottom: 48),
                      child: Text(
                        AppLocalizations.of(context)!.loginViewWelcomeBack,
                        style: appTheme.colorSet.textBlack.style(fontSize: 24),
                      )),
                  TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelPadding:
                          const EdgeInsets.only(right: 32, bottom: 10),
                      indicatorColor: appTheme.colorSet.colorDark,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: context
                          .read<AppconfCubit>()
                          .state
                          .appTheme
                          .colorSet
                          .textBlack,
                      unselectedLabelColor: context
                          .read<AppconfCubit>()
                          .state
                          .appTheme
                          .colorSet
                          .textGrey,
                      controller: _tabController,
                      padding: const EdgeInsets.only(left: 15),
                      unselectedLabelStyle: appTheme.colorSet.textBlack
                          .style(fontSize: 16, fontWeight: FontWeight.w600),
                      labelStyle: appTheme.colorSet.textGrey2
                          .style(fontSize: 16, fontWeight: FontWeight.w600),
                      tabs: [
                        Text(AppLocalizations.of(context)!.loginSignViewEmail),
                        Text(AppLocalizations.of(context)!.phoneNumber),
                      ]),
                  Expanded(
                      child: TabBarView(
                    physics: const NeverScrollableScrollPhysics(),
                    controller: _tabController,
                    children: tabView,
                  ))
                ],
              )),
        );
      },
      listener: (BuildContext context, LoginViewState state) {
        if (state.need2FA && !needJumpVer) {
          setState(() {
            needJumpVer = true;
          });
          final authCubit = context.read<AuthCubit>();
          Navigator.push(
            context,
            LoginNeedFa.route(
              didLogin: widget.didLogin,
              loginFaType: state.loginFaType,
              cubit: LoginViewCubit(authCubit: authCubit),
            ),
          );
        } else if (state.loginSuccess) {
          // 登录成功直接调用该api会自动刷新路由
          // context.read<LoginViewCubit>().authCubit.requestUserBaseInfo();
          widget.didLogin();
        }
      },
    );
  }
}
