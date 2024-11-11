import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TokenSelectView extends StatefulWidget {
  final List<TokenModel> tokenList;
  const TokenSelectView({
    required this.tokenList,
    super.key,
  });

  static Route<TokenModel?> route(List<TokenModel> tokenList) =>
      ModalBottomSheetRoute<TokenModel?>(
        builder: (context) => TokenSelectView(
          tokenList: tokenList,
        ),
        isScrollControlled: false,
      );

  @override
  State<TokenSelectView> createState() => _TokenSelectViewState();
}

class _TokenSelectViewState extends State<TokenSelectView> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "选择币种",
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
        child: ListView.builder(
          itemCount: widget.tokenList.length,
          itemBuilder: (context, index) {
            final token = widget.tokenList[index];
            final wgt = ListTile(
              title: Text(token.tokenName ?? ""),
            );
            return GestureDetector(
              onTap: () {
                Navigator.pop(context, token);
              },
              child: wgt,
            );
          },
        ),
      ),
    );
  }
}
