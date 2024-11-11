import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/utils/touch_up_keyboard.dart';
import 'package:ceex_flutter/views/login/components/login_app_bar.dart';
import 'package:ceex_flutter/views/login/sign_in_view_email.dart';
import 'package:ceex_flutter/views/login/sign_in_view_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

// 注册
class SignInViewPage extends StatefulWidget {
  const SignInViewPage({super.key});

  static Route route() => MaterialPageRoute(builder: (context) {
        context.read<LoginViewCubit>().dispose();
        return const SignInViewPage();
      });

  @override
  State<SignInViewPage> createState() => _SignInViewPageState();
}

class _SignInViewPageState extends State<SignInViewPage>
    with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  late TabController _tabController;
  final List _tabs = [0, 1];
  List<Widget> tabView = [
    const SignInViewEmail(),
    const SignInViewPhone(),
  ];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: _tabs.length);
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
            child: BlocConsumer<LoginViewCubit, LoginViewState>(
              builder: (ctx, state) {
                return Scaffold(
                  appBar: LoginAppBar(
                    type: AppLocalizations.of(context)!.loginViewTitle,
                  ),
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 15, bottom: 48),
                        child: Text(
                          AppLocalizations.of(context)!.loginSignViewWelCome,
                          style:
                              appTheme.colorSet.textBlack.style(fontSize: 24),
                        ),
                      ),
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
                            Text(AppLocalizations.of(context)!
                                .loginSignViewEmail),
                            Text(AppLocalizations.of(context)!.phoneNumber)
                          ]),
                      Expanded(
                          child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: tabView,
                      ))
                    ],
                  ),
                );
              },
              listener: (BuildContext context, LoginViewState state) {
                if (state.signSuccess) {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                }
              },
            )));
  }
}
