import 'package:flutter/material.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const LoginView());

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final sSize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (() async {
        return false;
      }),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(AppLocalizations.of(context)!.loginViewTitle),
        ),
        body: Container(
          height: sSize.height / 2,
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const TextField(),
              const TextField(),
              MaterialButton(
                  onPressed: () {
                    // TODO: 这个页面没用了
                  },
                  child: const Text('Login')),
            ],
          ),
        ),
      ),
    );
  }
}
