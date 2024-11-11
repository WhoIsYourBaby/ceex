import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/address/address_cubit.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/model/quote_tokens/quote_tokens_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

addressNetChooseDialog({
  required BuildContext context,
  List<QuoteTokensModel>? bbItem,
  List<ChainTypesModel>? netItem,
  required AddressCubit addressCubit,
  required TopType topType,
}) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return Container(
            height: 338,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.white),
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(right: 15),
                        child: Image.asset(R.ASSETS_IMAGES_CLOSE_LINE_PNG)),
                    Center(
                      child: Text(
                        "全部类型",
                        style: appTheme.colorSet.colorDark.style(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: topType == TopType.bb
                            ? bbItem?.length ?? 0
                            : netItem?.length ?? 0,
                        itemBuilder: ((context, index) => GestureDetector(
                              onTap: () {
                                if (topType == TopType.bb) {
                                  addressCubit.upDataAddressType(
                                      type: bbItem![index].tokenId!,
                                      topType: topType);
                                  addressCubit.upDataAddressList();
                                  final configModel = context
                                      .read<BasicConfigCubit>()
                                      .state
                                      .configModel!
                                      .token!;
                                  addressCubit.upDataNetList(configModel);
                                } else {
                                  addressCubit.upDataAddressType(
                                      type: netItem![index].chainType!,
                                      topType: topType);
                                  addressCubit.upDataAddressList();
                                }

                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 15),
                                decoration: BoxDecoration(
                                    border: Border(
                                        top: BorderSide(
                                            width: 1,
                                            color:
                                                appTheme.colorSet.colorLight))),
                                child: Text(
                                  listText(
                                      topType: topType,
                                      index: index,
                                      bbItem: bbItem,
                                      netItem: netItem),
                                  style: appTheme.colorSet.textBlack.style(),
                                ),
                              ),
                            ))))
              ],
            ));
      });
}

String listText(
    {required TopType topType,
    required int index,
    List<QuoteTokensModel>? bbItem,
    List<ChainTypesModel>? netItem}) {
  if (topType == TopType.bb) {
    return bbItem?[index].tokenName ?? "";
  } else {
    return netItem?[index].chainType ?? "";
  }
}

explainDialog({
  required BuildContext context,
}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        final appTheme = context.watch<AppconfCubit>().state.appTheme;
        return Dialog(
            child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "什么是通用地址",
                style: appTheme.colorSet.textBlack.style(fontSize: 16),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "通用地址是根据提现网络保存的地址。只要\n是支持该网络的币种，就能使用此地址提\n现。",
                style: appTheme.colorSet.textBlack.style(),
              ),
              const SizedBox(
                height: 32,
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: appTheme.colorSet.colorDark),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 119),
                  child: Text(
                    "确定",
                    style: appTheme.colorSet.textWhite.style(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ));
      });
}
