import 'dart:convert';

import 'package:ceex_flutter/components/focus_cell.dart';
import 'package:ceex_flutter/components/primary_button.dart';
import 'package:ceex_flutter/components/qrscan_view.dart';
import 'package:ceex_flutter/components/verify_code_widget.dart';
import 'package:ceex_flutter/components/verify_request_widget.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/model/address/add_address_model.dart';
import 'package:ceex_flutter/model/assets/address_check_model.dart';
import 'package:ceex_flutter/model/assets/order_list_model.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:ceex_flutter/repository/assets_repository.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:ceex_flutter/utils/input_formatter/amount_input_formatter.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/assets/components/address_select_view.dart';
import 'package:ceex_flutter/views/assets/components/net_select_view.dart';
import 'package:ceex_flutter/views/assets/components/token_select_view.dart';
import 'package:ceex_flutter/views/assets/orderlist/order_list_view.dart';
import 'package:ceex_flutter/views/assets/search_tokens/search_tokens_view.dart';
import 'package:ceex_flutter/views/assets/search_tokens/show_can_tran_tokens_view.dart';
import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

class WithdrawView extends StatefulWidget {
  const WithdrawView({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => WithdrawView(),
      );

  @override
  State<WithdrawView> createState() => _WithdrawViewState();
}

class _WithdrawViewState extends State<WithdrawView> {
  late AppTheme appTheme;
  TokenModel? tokenModel;
  ChainTypesModel? chainTypeModel;

  QuotaInfoModel? quotaInfoModel;

  AddAddressModel? selectAddress;

  final TextEditingController amountController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final addressFocusNode = FocusNode();
  bool isInnerAddress = false;

  @override
  void initState() {
    super.initState();

    setDefaultToken();
    addressFocusNode.addListener(() {
      if (!addressFocusNode.hasFocus) {
        // checkaddress+计算手续费
        onAddressChanged();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final cellSize = Size(double.infinity, 44);
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appTheme.colorSet.textBlack,
        ),
        title: Text(
          "链上提币",
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        ),
        actions: [
          GestureDetector(
            onTap: onOrderListTap,
            child: Image.asset(R.ASSETS_IMAGES_TASK_2_LINE_PNG),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: CustomScrollView(
          slivers: [
            // 币种选择
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: FocusCell(
                  onTap: () async {
                    Navigator.push(
                      context,
                      ShowCanTranTokensView.route(
                        (tokenSelect) {
                          setSelectToken(tokenSelect);
                          Navigator.pop(context);
                        },
                        showCanTranTokensType: ShowCanTranTokensType.withdraw,
                      ),
                    );
                    // Navigator.push(
                    //   context,
                    //   SearchTokensView.route(
                    //     (tokenSelect) {
                    //       setSelectToken(tokenSelect);
                    //       Navigator.pop(context);
                    //     },
                    //   ),
                    // );
                  },
                  size: cellSize,
                  // leading: Text(
                  //   tokenModel?.tokenId ?? "",
                  //   style: appTheme.colorSet.textBlack.style(),
                  // ),
                  leading: tokenModel == null
                      ? _buildPlaceholderText("选择币种")
                      : _buildBlack14Text(tokenModel?.tokenId ?? ""),
                  trailing: Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG),
                ),
              ),
            ),
            // 提币网络
            if (tokenModel?.chainTypes?.isNotEmpty ?? false)
              SliverToBoxAdapter(
                child: FocusSection(
                  onTap: () {
                    final chainTypes = tokenModel?.chainTypes ?? [];
                    if (chainTypes.isEmpty) {
                      showMsg("无网络可选择");
                    } else {
                      Navigator.push(context, NetSelectView.route(chainTypes))
                          .then((value) async {
                        if (value != null) {
                          final chainType = value as ChainTypesModel;
                          chainTypeModel = chainType;
                          isInnerAddress = false;
                          await refreshQuotaInfo();
                          await onAddressChanged();
                          setState(() {});
                        }
                      });
                    }
                  },
                  cellSize: cellSize,
                  titleLeft: _buildBlack14Text("提币网络"),
                  // 合约地址 无法实现
                  // titleRight: RichText(
                  //   text: TextSpan(
                  //     text: "合约地址 ",
                  //     style: appTheme.colorSet.textBlack.style(),
                  //     children: [
                  //       TextSpan(
                  //         text: "Tr7N...Lj6t",
                  //         style: appTheme.colorSet.colorPrimary.style(fontSize: 14),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  leading: chainTypeModel == null
                      ? _buildPlaceholderText("选择网络")
                      : _buildBlack14Text(chainTypeModel?.chainType ?? ""),
                  trailing: Image.asset(
                    R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG,
                    color: Colors.black,
                  ),
                ),
              ),
            // 提现地址
            SliverToBoxAdapter(
              child: FocusSection(
                cellSize: cellSize,
                titleLeft: _buildBlack14Text("提现地址"),
                leading: Expanded(
                  flex: 100,
                  child: _buildInputAddress(context),
                ),
                trailing: Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final address = await Navigator.push(
                          context,
                          AddressSelectView.route(
                            tokenModel?.tokenId,
                            null,
                            // chainTypeModel?.chainType,
                          ),
                        );
                        if (address != null) {
                          selectAddress = address;
                          addressController.text = address.address ?? "";
                        }
                      },
                      child: Image.asset(R.ASSETS_IMAGES_CONTACTS_2_LINE_PNG),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final scanResult =
                            await Navigator.push(context, QRScanView.route());
                        if (scanResult != null) {
                          addressController.text = scanResult;
                        }
                      },
                      child: Image.asset(R.ASSETS_IMAGES_FRAMESCREEN_PNG),
                    ),
                  ],
                ),
              ),
            ),
            // 提现数量
            SliverToBoxAdapter(
              child: FocusSection(
                cellSize: cellSize,
                titleLeft: _buildBlack14Text("提现数量"),
                // leading: _buildPlaceholderText(
                //     "最小${quotaInfoModel?.minQuantity ?? 0}"),
                leading: Expanded(
                  flex: 100,
                  child: _buildInputAmount(context),
                ),
                trailing: Row(
                  children: [
                    _buildPlaceholderText(tokenModel?.tokenName ?? ""),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 8),
                      height: 20,
                      width: 1,
                      color: appTheme.colorSet.textGrey3,
                    ),
                    GestureDetector(
                      onTap: () {
                        amountController.text =
                            quotaInfoModel?.available ?? "0";
                      },
                      child: _buildBlack14Text("全部"),
                    ),
                  ],
                ),
                bottom: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "可用: ${quotaInfoModel?.available ?? 0} ${tokenModel?.tokenName ?? ""}",
                    style: appTheme.colorSet.textGrey.style(),
                  ),
                ),
              ),
            ),
            // 温馨提示
            SliverToBoxAdapter(
              child: RichText(
                text: TextSpan(
                  style: appTheme.colorSet.textGrey2.style(),
                  text: "温馨提示\n",
                  children: [
                    TextSpan(text: "·请务必核对提币地址正确性，否则资产将不可找回。\n"),
                    TextSpan(
                        text:
                            "·最小提现数量${quotaInfoModel?.minQuantity ?? 0} ${tokenModel?.tokenName}。\n"),
                    TextSpan(
                      text:
                          "·为保障资金安全，当您账户安全策略变更、密码修改、我们会对提币进行人工审核，请耐心等待工作人员电话或邮件联系。\n",
                    ),
                    TextSpan(text: "·请务必确认电脑及浏览器安全，防止信息被算改或泄露。\n"),
                    TextSpan(text: "·法币交易所购买的数字资产若归为风险资产，36小时内禁止提市。\n"),
                    TextSpan(text: "·USDT暂不支持智能合约提币，请您谅解。\n"),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewPadding.bottom,
          left: 20,
          right: 20,
        ),
        alignment: Alignment.center,
        height: MediaQuery.of(context).viewPadding.bottom + 80,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RichText(
              text: TextSpan(
                text: "预计到账\n",
                style: appTheme.colorSet.textGrey.style(),
                children: [
                  TextSpan(
                    text:
                        "${recieveAmount()?.toDigit(2)} ${tokenModel?.tokenName ?? "-"}\n",
                    style: appTheme.colorSet.textBlack.style(fontSize: 18),
                  ),
                  TextSpan(
                    text:
                        "手续费：${totalFee()?.toDigit(2) ?? "--"} ${tokenModel?.tokenName ?? "-"}",
                    style: appTheme.colorSet.textGrey.style(),
                  ),
                ],
              ),
            ),
            Spacer(),
            PrimaryButton(
              size: Size(140, 44),
              onTap: onWithdrawTap,
              child: Text(
                "提现",
                style: appTheme.colorSet.textWhite.style(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlack14Text(String text) {
    return Text(
      text,
      style: appTheme.colorSet.textBlack.style(),
    );
  }

  Widget _buildPlaceholderText(String text) {
    return Text(
      text,
      style: appTheme.colorSet.textGrey3.style(),
    );
  }

  Widget _buildInputAmount(BuildContext context) {
    return TextField(
      onChanged: (value) {
        setState(() {});
      },
      controller: amountController,
      inputFormatters: [
        AmountInputFormatter(),
      ],
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "最小提币数量${quotaInfoModel?.minQuantity ?? 0}",
        hintStyle: appTheme.colorSet.textGrey3.style(),
      ),
    );
  }

  Widget _buildInputAddress(BuildContext context) {
    return TextField(
      focusNode: addressFocusNode,
      controller: addressController,
      inputFormatters: [
        LengthLimitingTextInputFormatter(50),
      ],
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "请输入提现地址",
        hintStyle: appTheme.colorSet.textGrey3.style(),
      ),
    );
  }

  Widget _buildTextGrey(String text) {
    return Text(
      text,
      style: appTheme.colorSet.textGrey.style(fontSize: 12),
    );
  }

  void setDefaultToken() {
    final tokenList =
        context.read<BasicConfigCubit>().state.configModel?.token ?? [];
    final usdtToken = tokenList.firstWhere(
      (element) => element.tokenId?.toUpperCase() == "USDT",
    );
    setSelectToken(usdtToken);
  }

  void setSelectToken(TokenModel? tokenSelect) {
    setState(() {
      tokenModel = tokenSelect;
      if ((tokenModel?.chainTypes?.isNotEmpty ?? false)) {
        chainTypeModel = tokenModel?.chainTypes![0];
      } else {
        chainTypeModel = null;
      }
      addressController.text = "";
      amountController.text = "";
      refreshQuotaInfo();
    });
  }

  void onOrderListTap() {
    if (tokenModel?.tokenId == null) {
      showMsg("请先选择币种");
      return;
    }
    Navigator.push(context, OrderListView.route(tokenModel?.tokenId ?? ""));
  }

  void onWithdrawTap() async {
    if ((quotaInfoModel?.allowWithdraw ?? false) == false) {
      showMsg(quotaInfoModel?.refuseReason ?? "当前币种不支持提币");
      return;
    }
    if (amountController.text == "") {
      showMsg("请输入提币金额");
      return;
    }
    final inputNum = amountController.text.toNum() ?? 0.0;
    final avNum = quotaInfoModel?.available?.toNum() ?? 0.0;
    if (inputNum > avNum) {
      showMsg("超过提币最大限度");
      return;
    }
    if (quotaInfoModel?.minQuantity != null && inputNum < (quotaInfoModel?.minQuantity?.toNum() ?? 0.0)) {
      showMsg("少于最少提币数量");
      return;
    }

    final tokenId = tokenModel?.tokenId;
    if (tokenId == null || quotaInfoModel == null) {
      showMsg("请先选择币种");
      return;
    }
    final chainType = chainTypeModel?.chainType;
    if (chainType == null) {
      showMsg("当前币种没有提币网络");
      return;
    }
    if (addressController.text.isEmpty) {
      showMsg("请输入或选择提币地址");
      return;
    }

    try {
      // 检查地址
      showLoading(dismissOtherOnShow: true);
      final assetsRepo = GetIt.I.get<AssetsRepository>();
      final resp = await assetsRepo.withdrawAddressCheck(
        tokenId,
        chainType,
        addressController.text,
      );
      final respData = resp.data;
      VerifyCode2FAModel? verifyModel2FA;
      if (respData.isIllegal == true || selectAddress?.id == null) {
        // 弹窗输入密码+2FA验证码
        dismissAllToast();
        verifyModel2FA = await showVerifyCode2FA();
        if (verifyModel2FA?.verifyCode?.isEmpty ?? true) {
          return;
        }
      }
      if (respData.isInBlackList == true) {
        showMsg("提币地址属于黑名单地址", dismissOtherOnShow: true);
        return;
      }
      // 输入资金密码
      dismissAllToast();
      final password = await showInputAlert(context, "请输入资金密码");
      if (password == null) {
        return;
      }
      showLoading(dismissOtherOnShow: true);
      final tradePassword = password.toMd5();
      final minerFee = respData.isInnerAddress == true
          ? 0
          : (quotaInfoModel?.minMinerFee?.toNum() ?? 0.0);
      // 创建提币
      final withdrawBody = WithdrawalCreateBody(
        accountId:
            UserInfoManager.shared.userBaseInfoModel?.defaultAccountId ?? "",
        address: addressController.text,
        chainType: chainType,
        clientOrderId: DateTime.now().millisecondsSinceEpoch.toString(),
        convertRate: quotaInfoModel!.convertRate?.toNum() ?? 0.0,
        minerFee: minerFee,
        quantity: inputNum,
        tokenId: tokenId,
        tradePassword: tradePassword,
        addressId: selectAddress?.id,
        verifyCode: verifyModel2FA?.verifyCode,
        orderId: verifyModel2FA?.orderId,
        authType: verifyModel2FA?.authType,
      );
      final body = withdrawBody.toJson()
        ..removeWhere((key, value) => (value == null));
      final withdrawResp = await assetsRepo.withdrawCreate(body);
      final createModel = withdrawResp.data;
      dismissAllToast();
      final verifyCode = await showVerifyRequest(createModel.requestId ?? "");
      if (verifyCode == null) {
        return;
      }
      showLoading();
      await assetsRepo.verifyWithdraw(
        DateTime.now().millisecondsSinceEpoch.toString(),
        createModel.codeOrderId ?? "",
        createModel.requestId ?? "",
        tokenId,
        verifyCode,
      );
      dismissAllToast();
      showMsg("操作成功");
      Navigator.pop(context);
    } catch (e) {
      if (e is DioException) {
        final respData = e.response?.data as Map<String, dynamic>;
        showMsg("${respData["code"]}:${respData["msg"]}",
            dismissOtherOnShow: true);
      } else {
        showMsg("接口错误，请重试", dismissOtherOnShow: true);
      }
    }
  }

  num? totalFee() {
    if (tokenModel == null || quotaInfoModel == null) {
      return null;
    }
    final convertRate = quotaInfoModel?.convertRate?.toNum() ?? 0;
    final fee = quotaInfoModel?.fee?.toNum() ?? 0;
    final convertFee = quotaInfoModel?.convertFee?.toNum() ?? 0;
    final minerFee = quotaInfoModel?.minMinerFee?.toNum() ?? 0.0;
    num sumFee = 0;
    if (tokenModel?.tokenId == quotaInfoModel?.minerFeeTokenId) {
      sumFee = fee + minerFee;
    } else {
      if (tokenModel?.tokenId == quotaInfoModel?.feeTokenId) {
        sumFee = fee + minerFee * convertRate;
      } else {
        sumFee = convertFee + minerFee * convertRate;
      }
    }
    if (isInnerAddress) {
      return quotaInfoModel?.internalWithdrawFee?.toNum();
    } else {
      return sumFee;
    }
  }

  num? recieveAmount() {
    final amount = amountController.text.toNum() ?? 0.0;
    final fee = totalFee() ?? 0;
    return amount - fee > 0 ? amount - fee : 0.0;
  }

  refreshQuotaInfo() async {
    if (tokenModel == null) {
      return;
    }
    showLoading();
    try {
      final repo = GetIt.I.get<AssetsRepository>();
      final resp = await repo.getQuotaInfo(
        tokenModel?.tokenId,
        chainTypeModel?.chainType,
      );
      setState(() {
        quotaInfoModel = resp.data;
      });
      dismissAllToast();
    } catch (e) {
      showRetryAlert(
        context,
        "接口调用失败，请重试！",
        () {
          refreshQuotaInfo();
        },
      );
    }
  }

  // 地址选择后根据是否内部地址 重新计算手续费
  Future<bool> onAddressChanged() async {
    try {
      final tokenId = tokenModel?.tokenId;
      if (tokenId == null || quotaInfoModel == null) {
        return false;
      }
      final chainType = chainTypeModel?.chainType;
      if (chainType == null) {
        return false;
      }
      if (addressController.text.isEmpty) {
        return false;
      }
      final assetsRepo = GetIt.I.get<AssetsRepository>();
      final resp = await assetsRepo.withdrawAddressCheck(
        tokenId,
        chainType,
        addressController.text,
      );
      final respData = resp.data;
      setState(() {
        isInnerAddress = respData.isInnerAddress ?? false;
      });
      return true;
    } catch (e) {
      showRetryAlert(
        context,
        "接口调用失败，请重试！",
        () {
          onAddressChanged();
        },
      );
      return false;
    }
  }

  Future<String?> showVerifyRequest(String requestId) {
    final wgtKey = GlobalKey();
    return showDialog<String?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "输入邮箱验证码",
            style: context
                .read<AppconfCubit>()
                .state
                .appTheme
                .colorSet
                .textBlack
                .style(
                  fontSize: 18,
                ),
          ),
          content: VerifyRequestWidget(
            key: wgtKey,
            title: "376438624@qq.com",
            requestId: requestId,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                final verifyCode =
                    (wgtKey.currentState as VerifyRequestWidgetState)
                        .verifyCode;
                if (verifyCode.isEmpty) {
                  showMsg("请输入正确的验证码");
                } else {
                  Navigator.pop(context, verifyCode);
                }
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
  }

  /// isIllegal地址需要验证码
  Future<VerifyCode2FAModel?> showVerifyCode2FA() {
    final wgtKey = GlobalKey();
    return showDialog<VerifyCode2FAModel?>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "请输入短信验证码",
            style: context
                .read<AppconfCubit>()
                .state
                .appTheme
                .colorSet
                .textBlack
                .style(
                  fontSize: 18,
                ),
          ),
          content: VerifyCodeWidget(
            type: 14,
            receiverType: 1,
            key: wgtKey,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () {
                final model2fa =
                    (wgtKey.currentState as VerifyCodeWidgetState).model2fa;
                if (model2fa.verifyCode?.isEmpty ?? true) {
                  showMsg("请输入正确的验证码");
                } else {
                  Navigator.pop(context, model2fa);
                }
              },
              child: Text("确定"),
            ),
          ],
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}
