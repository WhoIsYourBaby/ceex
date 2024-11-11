import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/home/home_assets_cubit.dart';
import 'package:ceex_flutter/views/assets/search_tokens/search_tokens_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// 首页登录成功后的资产显示sliver

class HomeAssetsSliver extends StatefulWidget {
  const HomeAssetsSliver({super.key});

  @override
  State<HomeAssetsSliver> createState() => _HomeAssetsSliverState();
}

class _HomeAssetsSliverState extends State<HomeAssetsSliver> {
  late AppTheme appTheme;
  bool isSecret = false;

  @override
  void initState() {
    super.initState();
    loadSecret();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      width: double.infinity,
      height: 150,
      child: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_PNG,
            fit: BoxFit.fill,
            width: double.infinity,
            height: 150,
          ),
          Positioned.fill(
            top: 16,
            bottom: 16,
            left: 20,
            right: 20,
            child: BlocBuilder<HomeAssetsCubit, HomeAssetsState>(
              builder: (context, state) {
                // if (state.assetsInfo == null) {
                //   return Container();
                // }

                final assetsInfo = state.assetsInfo;
                final num totalAssets =
                    num.tryParse(assetsInfo?.totalAsset ?? "0.0") ?? 0;
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 资产title
                        RichText(
                          text: TextSpan(
                            text: "总资产估值(${assetsInfo?.unit ?? "USDT"})",
                            style:
                                appTheme.colorSet.textBlack.style(fontSize: 12),
                            children: [
                              WidgetSpan(
                                alignment: PlaceholderAlignment.middle,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isSecret = !isSecret;
                                      saveSecret();
                                    });
                                  },
                                  child: Image.asset(
                                    R.ASSETS_IMAGES_EYE_OPEN_LINE_PNG,
                                    width: 20,
                                    height: 20,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        // 资产数
                        RichText(
                          text: TextSpan(
                            text: isSecret
                                ? "****"
                                : "${assetsInfo?.totalAsset ?? 0}",
                            style:
                                appTheme.colorSet.textBlack.style(fontSize: 24),
                            children: [
                              TextSpan(
                                text: "${assetsInfo?.unit ?? "USDT"}",
                                style: appTheme.colorSet.textBlack
                                    .style(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Text(
                            "≈￥${isSecret ? "****" : (state.rate?.equalTo(totalAssets, "CNY") ?? 0).toStringAsFixed(2)}"),
                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, SearchTokensView.route());
                      },
                      child: Container(
                        width: 104,
                        height: 38,
                        decoration: BoxDecoration(
                          color: appTheme.colorSet.textBlack,
                          borderRadius: BorderRadius.circular(19),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          "充币",
                          style: appTheme.colorSet.textWhite
                              .style(fontSize: 16, fontWeight: FontWeight.w600)
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  saveSecret() {
    SharedPreferences.getInstance().then((sp) {
      sp.setBool(runtimeType.toString(), isSecret);
    });
  }

  loadSecret() {
    SharedPreferences.getInstance().then((sp) {
      setState(() {
        isSecret = sp.getBool(runtimeType.toString()) ?? false;
      });
    });
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}
