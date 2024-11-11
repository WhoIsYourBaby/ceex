import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/utils/Alphabetic.dart';
import 'package:ceex_flutter/views/assets/components/net_select_view.dart';
import 'package:ceex_flutter/views/assets/recharge/recharge_view.dart';
import 'package:ceex_flutter/views/contract/common/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef TokenSelectCallback = void Function(TokenModel tokenModel);

class SearchTokensView extends StatefulWidget {
  final cubit = SearchTokensCubit();
  final TokenSelectCallback? onTokenSelect;
  SearchTokensView({this.onTokenSelect, super.key});

  static Route route([TokenSelectCallback? callback]) => MaterialPageRoute(
      builder: (context) => SearchTokensView(
            onTokenSelect: callback,
          ));

  @override
  State<SearchTokensView> createState() => _SearchTokensViewState();
}

class _SearchTokensViewState extends State<SearchTokensView> {
  ScrollController scrollController = ScrollController(); //链接字母表与列表的联动
  late AppTheme appTheme;
  final TextEditingController _searchController = TextEditingController();

  List<TokenModel> data = [];
  List<TokenModel> hotDataList = [];

  List<Map<String, List<TokenModel>>> tokensMapList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.read<AppconfCubit>().state.appTheme;
    data = context.read<BasicConfigCubit>().state.configModel?.token ?? [];
    widget.cubit.getList(data);
  }

  var hot = [
    'BTC',
    'ETH',
    'USDT',
    'XRP',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: _buildAppBar(context, appTheme),
        ),
        body: BlocBuilder<SearchTokensCubit, SearchTokensState>(
            bloc: widget.cubit,
            builder: (context, state) {
              return Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  CustomScrollView(
                    controller: scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Container(
                            alignment: Alignment.bottomLeft,
                            height: 49,
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "热门币种",
                              style: appTheme.colorSet.textGrey
                                  .style(fontSize: 12),
                            )),
                      ),
                      const SliverToBoxAdapter(
                          child: SizedBox(
                        height: 16,
                      )),
                      SliverToBoxAdapter(child: hotList(state)),
                      const SliverToBoxAdapter(
                          child: SizedBox(
                        height: 26,
                      )),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 36,
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "币种列表",
                            style:
                                appTheme.colorSet.textGrey.style(fontSize: 12),
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: latterList(),
                      ),
                    ],
                  ),
                  Alphabetic(
                    scrollController: scrollController,
                    dataSource: widget.cubit.state.tokensMap ?? {},
                    letterContent: widget.cubit.state.letterList ?? [],
                    valueChanged: (value) {},
                  ),
                  state.showSearchResult!
                      ? Container(
                          width: double.infinity,
                          height: double.infinity,
                          color: appTheme.colorSet.textWhite,
                          child: buildSearchResult(state),
                        )
                      : const SizedBox()
                ],
              );
            }));
  }

  Widget _buildAppBar(BuildContext context, AppTheme appTheme) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 15, bottom: 2),
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: appTheme.colorSet.colorLight,
              ),
              child: TextField(
                controller: _searchController,
                onChanged: widget.cubit.upDateSearchView,
                decoration: InputDecoration(
                  suffixIcon: Image.asset(R.ASSETS_IMAGES_SEARCH_LINE_PNG),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              AppLocalizations.of(context)!.cancel,
              style: appTheme.colorSet.textBlack.style(),
            ),
          ),
        ],
      ),
    );
  }

  Widget hotList(SearchTokensState state) {
    return SizedBox(
        height: 25,
        child: ListView.builder(
            // itemCount: hot.length,
            itemCount: (state.hotList ?? []).length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 15),
            itemBuilder: ((context, index) => GestureDetector(
                onTap: () {
                  if (widget.onTokenSelect == null) {
                    onTokenTap(state.hotList![index]);
                  } else {
                    widget.onTokenSelect!(state.hotList![index]);
                  }
                },
                child: Container(
                    height: 25,
                    width: 46,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: appTheme.colorSet.colorLight,
                      borderRadius: const BorderRadius.all(Radius.circular(2)),
                    ),
                    child: Text(
                      state.hotList?[index].tokenName ?? "",
                      style: appTheme.colorSet.textBlack.style(fontSize: 10),
                    ))))));
  }

  Widget latterList() {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.cubit.state.letterList?.length ?? 0,
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, index) => Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                  child: Text(widget.cubit.state.letterList?[index] ?? "--"),
                ),
                tokenList(
                    tokens: widget.cubit.state.tokensMap?[
                            widget.cubit.state.letterList?[index]] ??
                        []),
              ],
            )));
  }

  Widget tokenList({required List<TokenModel> tokens}) {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: tokens.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              if (widget.onTokenSelect == null) {
                onTokenTap(tokens[index]);
              } else {
                widget.onTokenSelect!(tokens[index]);
              }
            },
            child: Container(
              color: appTheme.colorSet.textWhite,
              height: 52,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Image.asset(
                  //   R.ASSETS_IMAGES_GROUP_16_PNG,
                  //   width: 20,
                  //   height: 20,
                  // ),
                  NetworkImageWidget(
                    url: tokens[index].iconUrl ?? "",
                    width: 20,
                    height: 20,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${tokens[index].tokenName}",
                    style: appTheme.colorSet.textGrey.style(fontSize: 12),
                  )
                ],
              ),
            )));
  }

  Widget buildSearchResult(SearchTokensState state) {
    return ListView.builder(
        itemCount: (state.searchResultList ?? []).length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              widget.cubit.upDateSearchView("", needClose: true);
              if (widget.onTokenSelect == null) {
                onTokenTap(state.searchResultList![index]);
              } else {
                widget.onTokenSelect!(state.searchResultList![index]);
              }
            },
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Row(
                  children: [
                    Image.asset(
                      R.ASSETS_IMAGES_GROUP_16_PNG,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      state.searchResultList?[index].tokenName ?? "",
                      style: appTheme.colorSet.textBlack.style(),
                    ),
                  ],
                ))));
  }

  onTokenTap(TokenModel token) {
    if ((token.chainTypes ?? []).isEmpty) {
      jumpRechargeView(token, const ChainTypesModel());
    } else {
      Navigator.push(context, NetSelectView.route(token.chainTypes!))
          .then((value) {
        if (value != null) {
          jumpRechargeView(token, value);
        }
      });
    }
  }

  // 跳转充币页面
  jumpRechargeView(TokenModel token, ChainTypesModel chainType) {
    Navigator.push(
        context,
        RechargeView.route(
            tokenId: token.tokenId ?? "",
            chainType: chainType,
            chainTypes: token.chainTypes ?? []));
  }
}
