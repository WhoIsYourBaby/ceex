import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/contract/contract_view_cubit.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:ceex_flutter/views/assets/components/assets_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContrachRightView extends StatelessWidget {
  final ContractViewCubit contractCubit;
  const ContrachRightView({required this.contractCubit, super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "价格",
                      style: appTheme.colorSet.textGrey.style(fontSize: 11),
                    ),
                    Text(
                      "(USDT)",
                      style: appTheme.colorSet.textGrey.style(fontSize: 11),
                    )
                  ],
                )),
            Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "数量",
                      style: appTheme.colorSet.textGrey.style(fontSize: 11),
                    ),
                    Text(
                      "(${contractCubit.state.baseTokenId})",
                      style: appTheme.colorSet.textGrey.style(fontSize: 11),
                    )
                  ],
                ))
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
            child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: rightPrice(contractCubit.state.a ?? [], appTheme)),
                Expanded(
                    flex: 1,
                    child: rightNumber(contractCubit.state.a ?? [], appTheme))
              ],
            ),
            Row(
              children: [
                GestureDetector(
                    onTap: () {
                      if ((contractCubit.state.a?? []).isEmpty) return;
                      contractCubit.sendPrice(
                          "${contractCubit.state.a?[contractCubit.state.a!.length - 1]?[0] ?? 0}");
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                            contractCubit.roundFormat3(
                                contractCubit.state.marketPrice ?? "",
                                getDecimalCount(
                                    contractCubit.state.digitMergeConn ?? "")),
                            style:
                                appTheme.colorSet.textGrey.style(fontSize: 13)),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          showPrice(contractCubit.state.a ?? [],
                              contractCubit.state.rates ?? 0),
                          style: appTheme.colorSet.textGrey.style(fontSize: 10),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    )),
                const Expanded(child: SizedBox()),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child:
                        rightGreenPrice(contractCubit.state.b ?? [], appTheme)),
                Expanded(
                    flex: 1,
                    child:
                        rightGreenNumber(contractCubit.state.b ?? [], appTheme))
              ],
            ),
          ],
        )),
        const SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            upDataMegeDigitDataDialog(
                context: context,
                title: "选择",
                list: contractCubit.state.digitMergeNameList ?? [],
                onTap: (e) {
                  contractCubit.upDataMegeDigitData(e);
                });
          },
          child: Row(children: [
            Image.asset(R.ASSETS_IMAGES_WEIGHT_PNG),
            const SizedBox(
              width: 6,
            ),
            Expanded(
                child: Container(
              height: 20,
              decoration: BoxDecoration(
                color: appTheme.colorSet.colorLight,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    contractCubit.state.digitMergeConn ?? "--",
                    style: appTheme.colorSet.textBlack.style(fontSize: 12),
                  ),
                  Image.asset(R.ASSETS_IMAGES_AREA_CODE_CHOOSE_PNG)
                ],
              ),
            ))
          ]),
        )
      ],
    );
  }

  String showPrice(List<List<String>?>? b, double? rates) {
    String price = "";
    if (b != null && b.isNotEmpty) {
      price =
          "≈￥${(double.parse(b[b.length - 1]![0]) * rates!).toStringAsFixed(2)}";
    }
    return price;
  }

  Widget rightPrice(
    List<List<String>?> data,
    AppTheme appTheme,
  ) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.isEmpty ? 6 : data.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              contractCubit.sendPrice(data[index]![0]);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                data.isEmpty ? "--" : contractCubit.formatNumber(double.parse(data[index]![0]),contractCubit.numerName(contractCubit.state.digitMergeConn ?? "0")),
                style: appTheme.colorSet.colorAuxiliary5.style(fontSize: 13),
              ),
            )));
  }

  Widget rightNumber(List<List<String>?> data, AppTheme appTheme) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.isEmpty ? 6 : data.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (data.isEmpty) return;
              String i = data[index]![0];
              contractCubit.sendPrice(i);
            },
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                data.isEmpty
                    ? "--"
                    // : contractCubit.roundFormat3(data[index]![1], 2),
                    : contractCubit.handVolumeLength(data[index]![1], 2),
                style: appTheme.colorSet.colorDark.style(fontSize: 13),
              ),
            )));
  }

  Widget rightGreenPrice(List<List<String>?> data, AppTheme appTheme) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.isEmpty ? 6 : data.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (data.isEmpty) return;
              contractCubit.sendPrice(data[index]![0]);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                data.isEmpty ? "--" : contractCubit.formatNumber(double.parse(data[index]![0]),contractCubit.numerName(contractCubit.state.digitMergeConn ?? "0")),
                style: appTheme.colorSet.colorPrimary2.style(fontSize: 13),
              ),
            )));
  }

  Widget rightGreenNumber(List<List<String>?> data, AppTheme appTheme) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: data.isEmpty ? 6 : data.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (data.isEmpty) return;
              contractCubit.sendPrice(data[index]![0]);
            },
            child: Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 4, bottom: 4),
              child: Text(
                data.isEmpty
                    ? "--"
                    // : contractCubit.roundFormat3(data[index]![1], 3),
                    : contractCubit.handVolumeLength(data[index]![1], 2),
                    // : data[index]![1],
                style: appTheme.colorSet.colorDark.style(fontSize: 13),
              ),
            )));
  }
}
