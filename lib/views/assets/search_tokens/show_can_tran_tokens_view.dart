import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef TokenSelectCallback = void Function(TokenModel tokenModel);

/// 只展示可交易币种
class ShowCanTranTokensView extends StatefulWidget {
  final TokenSelectCallback onTokenSelect;
  final ShowCanTranTokensType showCanTranTokensType;
  const ShowCanTranTokensView({required this.onTokenSelect, required this.showCanTranTokensType,super.key});

  static Route route(TokenSelectCallback callback,{required ShowCanTranTokensType showCanTranTokensType}) => MaterialPageRoute(
      builder: (context) => ShowCanTranTokensView(
            onTokenSelect: callback,
            showCanTranTokensType:showCanTranTokensType
          ));

  @override
  State<ShowCanTranTokensView> createState() => _ShowCanTranTokensViewState();
}

class _ShowCanTranTokensViewState extends State<ShowCanTranTokensView> {
  late AppTheme appTheme;
  final TextEditingController _searchController = TextEditingController();
  final cubit = SearchTokensCubit();

  List<TokenModel> data = [];

  List<Map<String, List<TokenModel>>> tokensMapList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.read<AppconfCubit>().state.appTheme;
    data = context.read<BasicConfigCubit>().state.configModel?.token ?? [];
    cubit.getCantranTokenList(
      data,widget.showCanTranTokensType
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: _buildAppBar(context, appTheme),
        ),
        body: BlocBuilder<SearchTokensCubit, SearchTokensState>(
            bloc: cubit,
            builder: (context, state) {
              return Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  CustomScrollView(
                    slivers: [
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
                        child: tokenList(),
                      ),
                    ],
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
                onChanged: cubit.upDateSearchView,
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

  Widget tokenList() {
    final list = cubit.state.tokenList ?? [];
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        physics: const NeverScrollableScrollPhysics(),
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
            onTap: () => widget.onTokenSelect(list[index]),
            child: Container(
              color: appTheme.colorSet.textWhite,
              height: 52,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                    "${list[index].tokenName}",
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
              cubit.upDateSearchView("", needClose: true);
              widget.onTokenSelect(state.searchResultList![index]);
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
}
