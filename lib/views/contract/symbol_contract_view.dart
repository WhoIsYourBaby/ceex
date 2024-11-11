import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SymbolContractView extends StatefulWidget {
  const SymbolContractView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: ((context) => SymbolContractView()));

  @override
  State<SymbolContractView> createState() => _SymbolContractViewState();
}

class _SymbolContractViewState extends State<SymbolContractView> {
  List<SymbolModel> list = const [];
  @override
  void initState() {
    super.initState();
    setState(() {
      list = context.read<BasicConfigCubit>().state.configModel!.symbol!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: const AppBarCenterText(
          title: "币对选择",
        ),
      ),
      body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.pop(context, list[index]);
                },
                child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 1,
                                color: appTheme.colorSet.colorLight))),
                    padding: const EdgeInsets.symmetric(
                        vertical: 12, horizontal: 15),
                    child: Text(
                      "${list[index].baseTokenName!} / ${list[index].quoteTokenName!}",
                      style: appTheme.colorSet.textBlack.style(),
                    )),
              )),
    );
  }
}
