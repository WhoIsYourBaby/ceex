import 'package:ceex_flutter/components/primary_button.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/model/user/user_account_money_model.dart';
import 'package:ceex_flutter/repository/assets_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/views/assets/transfer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

class TokenDetailView extends StatefulWidget {
  final String tokenId;
  const TokenDetailView({required this.tokenId, super.key});

  @override
  State<TokenDetailView> createState() => _TokenDetailViewState();

  static Route route(String tokenId) => MaterialPageRoute(
        builder: (context) => TokenDetailView(
          tokenId: tokenId,
        ),
      );
}

class _TokenDetailViewState extends State<TokenDetailView> {
  late AppTheme appTheme;
  TokenModel? tokenModel;
  UserAccountMoneyModel? moneyModel;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 17)).then((value) {
      final tokenList =
          context.read<BasicConfigCubit>().state.configModel?.token ?? [];
      final index = tokenList.indexWhere(
        (element) => element.tokenId == widget.tokenId,
      );
      if (index >= 0) {
        setState(() {
          tokenModel = tokenList[index];
        });
        requestTokenDetail();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appTheme.colorSet.textBlack,
        ),
      ),
      body: ListView(
        children: [
          // 余额
          Container(
            child: Column(
              children: [
                Text(
                  widget.tokenId,
                  style: appTheme.colorSet.textBlack.style(fontSize: 18),
                ),
                Text(moneyModel?.total ?? "0.0000",
                    style: appTheme.colorSet.textBlack.style(fontSize: 28)),
                Text(
                  "≈￥ 0.00",
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                ),
              ],
            ),
          ),
          // 划转
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: appTheme.colorSet.colorLight),
            ),
            child: Column(
              children: [
                _buildBoxCell("钱包余额", "${moneyModel?.total ?? '0.0000'}"),
                _buildBoxCell("体验金", "0.00000"),
                _buildBoxCell("已借贷金额", "0.00000"),
                _buildBoxCell("可转数量", "${moneyModel?.free ?? '0.0000'}"),
                SizedBox(
                  height: 12,
                ),
                PrimaryButton(
                  size: Size(double.infinity, 44),
                  onTap: onTransferTap,
                  child: Text(
                    "划转",
                    style: appTheme.colorSet.colorWhite.style(fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBoxCell(String leading, String trailing) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Text(leading),
          Spacer(),
          Text(trailing),
        ],
      ),
    );
  }

  requestTokenDetail() async {
    try {
      showLoading();
      final repo = GetIt.I.get<AssetsRepository>();
      final resp = await repo.assetGet();
      final index =
          resp.data.indexWhere((element) => element.tokenId == widget.tokenId);
      if (index >= 0) {
        setState(() {
          moneyModel = resp.data[index];
        });
      }
      dismissAllToast();
    } catch (e) {
      showMsg(e.toString());
    }
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }

  onTransferTap() {
    Navigator.push(context, TransferView.route());
  }
}
