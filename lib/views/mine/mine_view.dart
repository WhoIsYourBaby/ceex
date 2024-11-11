import 'package:ceex_flutter/model/user/user_model.dart';
import 'package:ceex_flutter/model/websocket/ws_model.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/dio_manager.dart';
import 'package:ceex_flutter/utils/enums.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/utils/ws_manager.dart';
import 'package:ceex_flutter/views/login/login_view_page.dart';
import 'package:ceex_flutter/views/login/sign_in_view_page.dart';
import 'package:ceex_flutter/views/mine/mine_page_view.dart';
import 'package:ceex_flutter/views/mine/my_invitation_view.dart';
import 'package:ceex_flutter/views/mine/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class MineView extends StatefulWidget {
  const MineView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const MineView());

  @override
  State<MineView> createState() => _MineViewState();
}

class _MineViewState extends State<MineView> {
  late WebSocketChannel channel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.mineViewTitle),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(AppLocalizations.of(context)!.changeLanguage),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  onPressed: () {
                    context
                        .read<AppconfCubit>()
                        .updateLocale(const Locale("zh"));
                  },
                  child: const Text("中文"),
                ),
                MaterialButton(
                  onPressed: () {
                    context
                        .read<AppconfCubit>()
                        .updateLocale(const Locale("en"));
                  },
                  child: const Text("English"),
                )
              ],
            ),
          ),
          ListTile(
            title: Text("换肤"),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                MaterialButton(
                  onPressed: () {
                    context
                        .read<AppconfCubit>()
                        .updateTheme(AppThemeType.light);
                  },
                  child: const Text("明亮"),
                ),
                MaterialButton(
                  onPressed: () {
                    context.read<AppconfCubit>().updateTheme(AppThemeType.dark);
                  },
                  child: const Text("黑暗"),
                )
              ],
            ),
          ),
          ListTile(
            title: Text(AppLocalizations.of(context)!.logout),
            onTap: () async {
              // TODO: 实现退出登录
              UserInfoManager.shared.clearUserInfoAndCookie();
              await DioManager.shared.clearCookie();
              context.read<AuthCubit>().requestUserBaseInfo();
              // UserCookie userCookie =
              // getCookie(value.response.headers['set-cookie'].toString());
              // await UserInfoManager.shared.saveUserInfo(value.data);
              // await UserInfoManager.shared.saveUserCookie(userCookie);
              // emit(state.copyWith(loginSuccess: true));
              // getUserInfo();
            },
          ),
        ],
      ),
    );
  }
}
