import 'package:ceex_flutter/utils/app_router_observer.dart';
import 'package:ceex_flutter/views/login/login_view_page.dart';
import 'package:ceex_flutter/views/mine/mine_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/views/login/login_entry_view.dart';
import 'package:ceex_flutter/views/page404/notfound_view.dart';
import 'package:ceex_flutter/views/root_tabbar.dart';
import 'package:ceex_flutter/views/splash/splash_view.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:oktoast/oktoast.dart';

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppconfCubit, AppconfState>(builder: (ctx, state) {
      return OKToast(
        child: MaterialApp(
          navigatorKey: _navigatorKey,
          navigatorObservers: [AppRouteObserver().routeObserver],
          // builder: (context, child) {
          //   return BlocListener<AuthCubit, AuthState>(
          //     listenWhen: (previous, current) {
          //       return previous.listenerShouldChange(current);
          //     },
          //     listener: (context, state) {
          //       _navigator.pushAndRemoveUntil<void>(
          //         RootTabBar.route(),
          //         (route) => false,
          //       );
          //     },
          //     child: child,
          //   );
          // },
          home: SplashView(),
          debugShowCheckedModeBanner: false,
          title: 'CEEX',
          theme: ThemeData(
            scaffoldBackgroundColor:
                state.appTheme.colorSet.colorWhite, //修改页面的背景
            //修改AppBar的主体样式
            appBarTheme: AppBarTheme(
              backgroundColor: state.appTheme.colorSet.colorWhite,
              elevation: 0, //隐藏AppBar底部的阴影分割线
              systemOverlayStyle: SystemUiOverlayStyle.dark, //设置状态栏的背景
            ),
            // visualDensity: VisualDensity.standard,
          ),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          onGenerateRoute: (_) => SplashView.route(),
          onUnknownRoute: (settings) => NotFoundView.route(),
          locale: state.locale,
          localeResolutionCallback: (locale, supportedLocales) {
            for (var supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale?.languageCode) {
                return supportedLocale;
              }
            }
            return supportedLocales.first;
          },
        ),
      );
    });
  }
}
