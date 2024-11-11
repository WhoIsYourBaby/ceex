import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/search/search_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/login/login_view_page.dart';
import 'package:ceex_flutter/views/search/components/search_coin_cell.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:oktoast/oktoast.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  static String path = "/search";
  static Route route() {
    return MaterialPageRoute(
      builder: (context) => SearchView(),
      settings: RouteSettings(name: SearchView.path),
    );
  }

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final cubit = SearchCubit();
  final TextEditingController _searchController = TextEditingController();
  late FocusNode focusNode = FocusNode()..requestFocus();

  @override
  void initState() {
    super.initState();
    cubit.setFullSymbols(
        context.read<BasicConfigCubit>().state.configModel?.symbol ?? []);
    if (UserInfoManager.shared.isLogin) {
      showLoading();
      cubit.requestFavoriteList().then((value) {
        dismissAllToast();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBarWrapper(
            statusBarColor: appTheme.colorSet.colorWhite,
            child: _buildAppBar(context, appTheme),
          ),
          body: _buildListView(context, appTheme),
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context, AppTheme appTheme) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15, bottom: 2),
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: appTheme.colorSet.colorLight,
              ),
              child: TextField(
                focusNode: focusNode,
                controller: _searchController,
                onChanged: cubit.updateKeywords,
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

  Widget _buildListView(BuildContext context, AppTheme appTheme) {
    return ListView(
      children: (cubit.state.searchResults ?? [])
          .map(
            (e) => SearchCoinCell(
              coin: "${e.baseTokenId} / ${e.quoteTokenId}",
              isStar: cubit.isSymbolStar(e.symbolId ?? ""),
              onStarTap: () {
                onStarTap(e);
              },
            ),
          )
          .toList(),
    );
  }

  onStarTap(SymbolModel symbol) {
    if (UserInfoManager.shared.isLogin) {
      if (cubit.isSymbolStar(symbol.symbolId ?? "")) {
        cubit.cancelFavorite(symbol.exchangeId ?? "", symbol.symbolId ?? "");
      } else {
        cubit.createFavorite(symbol.exchangeId ?? "", symbol.symbolId ?? "");
      }
    } else {
      Navigator.push(
        context,
        LoginViewPage.route(
          didLogin: () {
            Navigator.popUntil(context, (route) {
              return route.settings.name == SearchView.path;
            });
            showLoading();
            cubit.requestFavoriteList().then((value) {
              dismissAllToast();
            });
          },
        ),
      );
    }
  }
}
