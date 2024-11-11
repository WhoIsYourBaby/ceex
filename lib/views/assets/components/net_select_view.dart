import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// 网络选择
class NetSelectView extends StatefulWidget {
  final List<ChainTypesModel> chainTypes;
  const NetSelectView({
    required this.chainTypes,
    super.key,
  });

  static Route<ChainTypesModel?> route(List<ChainTypesModel> chainTypes) =>
      ModalBottomSheetRoute(
        builder: (context) => NetSelectView(
          chainTypes: chainTypes,
        ),
        isScrollControlled: false,
      );

  @override
  State<NetSelectView> createState() => _NetSelectViewState();
}

class _NetSelectViewState extends State<NetSelectView> {
  late AppTheme appTheme;
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "选择网络",
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(R.ASSETS_IMAGES_CLOSE_LINE_PNG),
          )
        ],
      ),
      body: Container(
        constraints: BoxConstraints(minHeight: screenSize.height * 0.85),
        child: ListView(
          children: widget.chainTypes
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    Navigator.pop(context, e);
                  },
                  child: NetCard(
                    chainType: e,
                  ),
                ),
              )
              .toList(),
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: mediaQuery.viewPadding.bottom),
        child: Container(
          decoration: BoxDecoration(
            color: appTheme.colorSet.colorLight,
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          padding: EdgeInsets.all(12),
          child: Text(
            "当您充值该币种时，请仅限于通过下方支持的网络充值，如您通过其他网络充值会造成资金丢失",
            style: appTheme.colorSet.textGrey.style(fontSize: 12),
          ),
        ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}

class NetCard extends StatelessWidget {
  final ChainTypesModel chainType;
  const NetCard({required this.chainType, super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(chainType.chainType ?? "",
                style: appTheme.colorSet.textBlack.style(fontSize: 14)),
            Text("N次区块确认", style: appTheme.colorSet.textGrey.style(fontSize: 12)),
            Text("最低充值> N USDT", style: appTheme.colorSet.textGrey.style(fontSize: 12)),
            Text("预计到账时间 N 分钟", style: appTheme.colorSet.textGrey.style(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
