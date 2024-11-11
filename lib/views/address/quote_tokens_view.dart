import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/quote_tokens/quote_tokens_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteTokensView extends StatefulWidget {
  final QuoteType quoteType;
  final String tokenType;
  final List<TokenModel> chainList;
  final cubit = QuoteTokensCubit();
  QuoteTokensView({
    required this.quoteType,
    required this.chainList,
    required this.tokenType,
    super.key,
  }) {
    if (quoteType == QuoteType.net) {
      cubit.geNetList(tokenType: tokenType, chainList: chainList);
    } else {
      cubit.getList();
    }
  }

  static Route route({
    required QuoteType quoteType,
    String tokenType = "",
    List<TokenModel> chainList = const [],
  }) =>
      MaterialPageRoute(
          builder: ((context) => QuoteTokensView(
                quoteType: quoteType,
                tokenType: tokenType,
                chainList: chainList,
              )));

  @override
  State<QuoteTokensView> createState() => _QuoteTokensViewState();
}

class _QuoteTokensViewState extends State<QuoteTokensView> {
  late AppTheme appTheme;
  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: AppBarCenterText(
            title: "提币网络",
          ),
        ),
        body: BlocBuilder<QuoteTokensCubit, QuoteTokensState>(
          bloc: widget.cubit,
          builder: (context, state) {
            return ListView.builder(
                itemCount: widget.quoteType == QuoteType.token
                    ? state.list?.length ?? 0
                    : state.quoteTypeList?.length ?? 0,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        if (widget.quoteType == QuoteType.token) {
                          Navigator.pop(context, state.list![index].tokenName);
                        } else {
                          Navigator.pop(context, state.quoteTypeList![index].chainType);
                        }
                      },
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1,
                                      color: appTheme.colorSet.colorLight))),
                          padding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 15),
                          child: Text(
                            widget.quoteType == QuoteType.token ? "${state.list![index].tokenName}" : "${state.quoteTypeList![index].chainType}",
                            style: appTheme.colorSet.textBlack.style(),
                          )));
                });
          },
        ));
  }
}
