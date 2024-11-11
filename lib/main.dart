import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/contract/contract_cubit.dart';
import 'package:ceex_flutter/cubit/contract/contract_diffdepth_cubit.dart';
import 'package:ceex_flutter/cubit/contract/contract_entrust_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/utils/config.dart';
import 'package:ceex_flutter/utils/device_info_manager.dart';
import 'package:ceex_flutter/utils/getit_init.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/app.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:zendesk_helpcenter/zendesk_helpcenter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DeviceInfoManager.shared.init();
  await getItInit();
  await UserInfoManager.shared.loadUserInfo();
  final baseUserInfo = await UserInfoManager.shared.loadUserBaseInfo();
  await UserInfoManager.shared.loadCookie();
  final AppconfState appconfState = await AppconfState.load();
  final authCubit = AuthCubit();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) {
            authCubit.requestUserBaseInfo();
            authCubit.getVersion();
            return authCubit;
          },
        ),
        BlocProvider(
          create: (ctx) {
            final cubit = AppconfCubit(appconfState);
            return cubit;
          },
        ),
        BlocProvider(
          create: (ctx) {
            final cubit = LoginViewCubit(authCubit: authCubit);
            return cubit;
          },
        ),
        // BlocProvider(
        //   create: (ctx) {
        //     final cubit = ContractCubit();
        //     return cubit;
        //   },
        // ),
        BlocProvider(
          create: (ctx) {
            // 获取远程basicAppConfig数据
            final cubit = BasicConfigCubit();
            return cubit;
          },
        ),
        // BlocProvider(
        //   create: (ctx) {
        //     final cubit = ContractDiffdepthCubit();
        //     return cubit;
        //   },
        // ),
        // BlocProvider(
        //   create: (ctx) {
        //     final cubit = ContractEntrustCubit();
        //     return cubit;
        //   },
        // ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    DeviceInfoManager.shared.screenSize = media.size;
    DeviceInfoManager.shared.devicePixelRatio = media.devicePixelRatio;
    return const AppView();
  }
}
