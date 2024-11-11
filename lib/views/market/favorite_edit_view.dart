import 'package:ceex_flutter/components/primary_button.dart';
import 'package:ceex_flutter/components/secondary_button.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/market_view/market_view_cubit.dart';
import 'package:ceex_flutter/views/search/search_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteEditView extends StatefulWidget {
  final MarketViewCubit cubit;
  const FavoriteEditView({
    required this.cubit,
    super.key,
  });

  @override
  State<FavoriteEditView> createState() => _FavoriteEditViewState();
}

class _FavoriteEditViewState extends State<FavoriteEditView> {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    final screenSize = MediaQuery.of(context).size;
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "编辑自选",
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, SearchView.route());
          },
          child: Image.asset(
            R.ASSETS_IMAGES_ADD_FRAME_PNG,
            width: 24,
            height: 24,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(
              R.ASSETS_IMAGES_CLOSE_LINE_PNG,
              width: 24,
              height: 24,
            ),
          ),
          SizedBox(
            width: 12,
          ),
        ],
      ),
      body: Container(
        constraints: BoxConstraints(minHeight: screenSize.height * 0.85),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: BlocBuilder<MarketViewCubit, MarketViewState>(
          bloc: widget.cubit,
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.starList?.length ?? 0,
              itemBuilder: (context, index) {
                final model = state.starList![index];
                final isSelect = state.selectMap[model.symbol] ?? false;
                return FavoriteEditCell(
                  onTap: () {
                    widget.cubit.selectSymbol(model.symbol ?? "", !isSelect);
                  },
                  quoteTokenId: model.quoteTokenId ?? "",
                  baseTokenId: model.baseTokenId ?? "",
                  isSelect: isSelect,
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        height: 58 + mediaQuery.viewPadding.bottom,
        padding: EdgeInsets.only(
          bottom: mediaQuery.viewPadding.bottom,
          top: 12,
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SecondaryButton(
              size: Size(screenSize.width * 0.4, 44),
              onTap: () {
                widget.cubit.deleteSelectSymbols();
              },
              child: Text(
                "删除",
                style: appTheme.colorSet.textGrey.style(fontSize: 16),
              ),
            ),
            PrimaryButton(
              size: Size(screenSize.width * 0.4, 44),
              onTap: () {
                Navigator.pop(context);
              },
              child: Text(
                "确定",
                style: appTheme.colorSet.textWhite.style(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteEditCell extends StatelessWidget {
  final bool isSelect;
  final String baseTokenId;
  final String quoteTokenId;
  final VoidCallback? onTap;
  const FavoriteEditCell({
    required this.baseTokenId,
    required this.quoteTokenId,
    required this.isSelect,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        height: 48,
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            Image.asset(
              isSelect
                  ? R.ASSETS_IMAGES_GROUP_33_PNG
                  : R.ASSETS_IMAGES_ELLIPSE_2190_PNG,
              width: 16,
              height: 16,
            ),
            SizedBox(
              width: 6,
            ),
            RichText(
              text: TextSpan(
                text: baseTokenId,
                style: appTheme.colorSet.colorDark.style(fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: "/${quoteTokenId}",
                    style: appTheme.colorSet.textGrey.style(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
