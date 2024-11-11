import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/contract/contract_state.dart';
import 'package:ceex_flutter/cubit/contract/contract_view_cubit.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:ceex_flutter/utils/input_formatter/amount_input_formatter.dart';
import 'package:ceex_flutter/utils/number_utils.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/assets/transfer_view.dart';
import 'package:ceex_flutter/views/login/login_view_page.dart';
import 'package:ceex_flutter/views/root_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class ContractLeftView extends StatefulWidget {
  final ContractViewState state;
  final ContractViewCubit contractCubit;
  const ContractLeftView(this.contractCubit, this.state, {super.key});

  @override
  State<ContractLeftView> createState() => _ContractLeftViewState();
}

class _ContractLeftViewState extends State<ContractLeftView> {
  TextEditingController priceController = TextEditingController();
  FocusNode priceFocusNode = FocusNode();

  TextEditingController numberController = TextEditingController();
  FocusNode numberFocusNode = FocusNode();

  TextEditingController transactionController = TextEditingController();
  FocusNode transactionFocusNode = FocusNode();

  late AppTheme appTheme;

  int dropdownValue = 0;

  double _value = 0;

  @override
  void initState() {
    super.initState();
    priceController.addListener(() {
      setState(() {});
    });
    numberController.addListener(() {
      setState(() {});
    });
    transactionController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    priceController.dispose();
    priceFocusNode.dispose();
    numberController.dispose();
    numberFocusNode.dispose();
    transactionController.dispose();
    transactionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocConsumer<ContractViewCubit, ContractViewState>(
      bloc: widget.contractCubit,
      builder: (ctx, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buyOrSellButton(),
            const SizedBox(height: 10),
            limitOrMarketPrice(),
            const SizedBox(height: 10),
            priceInput(),
            SizedBox(
              height: dropdownValue == 1 ? 0 : 4,
            ),
            dropdownValue == 1
                ? const SizedBox()
                : Text(
                    getPrice(),
                    style: appTheme.colorSet.textGrey.style(fontSize: 12),
                  ),
            const SizedBox(
              height: 9,
            ),
            numberInput(),
            SizedBox(
              height: 83,
              child: sliderWidget(),
            ),
            transactionInput(),
            const SizedBox(
              height: 12,
            ),
            canUseMoney(),
            const Spacer(),
            buyBB(),
          ],
        );
      },
      listener: (BuildContext context, ContractViewState state) {
        if (state.needRefreshData ?? false) {
          priceController.text = "";
          numberController.text = "";
          transactionController.text = "";
          widget.contractCubit.needRefreshData(false);
        }
        if (state.limitType == "limit" && (state.changePrice ?? false)) {
          priceController.text = state.price ?? "";
        }
      },
    );
  }

  // 买卖按钮
  Widget buyOrSellButton() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GestureDetector(
              onTap: () {
                widget.contractCubit.changeBbChooseType(BbChooseType.buy);
                priceController.text = "";
                numberController.text = "";
                transactionController.text = "";
                setState(() {
                  _value = 0;
                });
              },
              child: Container(
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            widget.state.bbChooseType == BbChooseType.buy
                                ? R.ASSETS_IMAGES_RECTANGLE_2090_PNG
                                : R.ASSETS_IMAGES_BUY_UN_PNG),
                        fit: BoxFit.fill)),
                child: Text(
                  "买入",
                  style: widget.state.bbChooseType == BbChooseType.buy
                      ? appTheme.colorSet.textWhite.style(
                          fontSize: 14,
                        )
                      : appTheme.colorSet.textGrey.style(
                          fontSize: 14,
                        ),
                ),
              )),
        ),
        Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () {
                widget.contractCubit.changeBbChooseType(BbChooseType.sell);
                priceController.text = "";
                numberController.text = "";
                transactionController.text = "";
                setState(() {
                  _value = 0;
                });
              },
              child: Container(
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                            widget.state.bbChooseType == BbChooseType.buy
                                ? R.ASSETS_IMAGES_RECTANGLE_2091_PNG
                                : R.ASSETS_IMAGES_SELL_PNG),
                        fit: BoxFit.fill)),
                child: Text(
                  "卖出",
                  style: widget.state.bbChooseType == BbChooseType.sell
                      ? appTheme.colorSet.textWhite.style(
                          fontSize: 14,
                        )
                      : appTheme.colorSet.textGrey.style(
                          fontSize: 14,
                        ),
                ),
              ),
            )),
      ],
    );
  }

  // 市价/限价
  Widget limitOrMarketPrice() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 9),
      height: 28,
      decoration: BoxDecoration(
          color: appTheme.colorSet.colorLight,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_VECTOR_PNG,
            width: 14,
            height: 14,
          ),
          Expanded(
            child: DropdownButton(
              isExpanded: true,
              alignment: Alignment.center,
              underline: Container(
                height: 0,
              ),
              icon: Image.asset(
                R.ASSETS_IMAGES_DOWN_SMALL_LINE_PNG,
                width: 18,
                height: 18,
              ),
              style: appTheme.colorSet.colorDark
                  .style(fontSize: 14, fontWeight: FontWeight.w600),
              value: dropdownValue,
              items: [
                DropdownMenuItem<int>(
                  value: 0,
                  alignment: Alignment.center,
                  child: Text(
                    "限价单",
                    textAlign: TextAlign.center,
                    style: appTheme.colorSet.colorDark
                        .style(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
                DropdownMenuItem<int>(
                  value: 1,
                  alignment: Alignment.center,
                  child: Text(
                    "市价单",
                    style: appTheme.colorSet.colorDark
                        .style(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == dropdownValue) return;
                setState(() {
                  dropdownValue = value!;
                  priceController.text = "";
                  numberController.text = "";
                  _value = 0;
                });
                widget.contractCubit.changeLimit(value!);
                widget.contractCubit.sendPrice("");
                transactionController.text = "";
              },
            ),
          ),
        ],
      ),
    );
  }

  // 价格输入框
  Widget priceInput() {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 1),
      height: 40,
      decoration: BoxDecoration(
          color: appTheme.colorSet.colorLight,
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: Row(
        children: [
          Expanded(
              child: textField(priceController, priceFocusNode,
                  dropdownValue == 1 ? "以当前最优价格交易" : "价格",
                  canUse: !(dropdownValue == 1),
                  onChanged: (e) => priceInputOnChange(e),
                  inputFormatters: [
                AmountInputFormatter(
                    digit:
                        getDecimalCount((widget.state.minPricePrecision ?? "")))
              ])),
          dropdownValue == 1
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    String result = NumberUtils.subtractionString(
                        widget.state.price ?? "0",
                        widget.state.minPricePrecision ?? "0");
                    if (double.parse(result) < 0) {
                      result = "0";
                    } else {}
                    priceController.text = result;
                    widget.contractCubit.sendPrice(priceController.text);
                    upDataNumber();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      color: appTheme.colorSet.colorLight,
                      child: Image.asset(
                        R.ASSETS_IMAGES_LINE_12_PNG,
                        width: 16,
                        height: 16,
                      )),
                ),
          // SizedBox(
          //   width: dropdownValue == 1 ? 0 : 11,
          // ),
          dropdownValue == 1
              ? const SizedBox()
              : Image.asset(R.ASSETS_IMAGES_LINE_13_PNG),
          // const SizedBox(
          //   width: 12,
          // ),
          dropdownValue == 1
              ? const SizedBox()
              : GestureDetector(
                  onTap: () {
                    String result = NumberUtils.addString(
                        widget.state.price ?? "0",
                        widget.state.minPricePrecision ?? "0");
                    priceController.text = result;
                    widget.contractCubit.sendPrice(priceController.text);
                    upDataNumber();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      color: appTheme.colorSet.colorLight,
                      child: Image.asset(
                        R.ASSETS_IMAGES_ADD_PNG,
                        width: 16,
                        height: 16,
                      )),
                )
        ],
      ),
    );
  }

  // 数量输入框
  Widget numberInput() {
    if (widget.state.bbChooseType == BbChooseType.buy) {
      return Container(
        height: 40,
        padding: const EdgeInsets.only(left: 8, right: 15),
        decoration: BoxDecoration(
            color: appTheme.colorSet.colorLight,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: dropdownValue == 1 //市价
            ? Row(
                children: [
                  Expanded(
                      child: textField(numberController, numberFocusNode, "金额",
                          inputFormatters: [
                            AmountInputFormatter(
                                digit: getDecimalCount(
                                    (widget.state.quotePrecision ?? "")))
                          ],
                          onChanged: (e) => numberInputOnChange(e))),
                  Text(
                    "USDT",
                    style: appTheme.colorSet.colorDark
                        .style(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                      child: textField(numberController, numberFocusNode, "数量",
                          inputFormatters: [
                            AmountInputFormatter(
                                digit: getDecimalCount(
                                    (widget.state.basePrecision ?? "")))
                          ],
                          onChanged: (e) => numberInputOnChange(e))),
                  Text(
                    widget.state.baseTokenId ?? "--",
                    style: appTheme.colorSet.colorDark
                        .style(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
      );
    } else {
      return Container(
        height: 40,
        padding: const EdgeInsets.only(left: 8, right: 15),
        decoration: BoxDecoration(
            color: appTheme.colorSet.colorLight,
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: dropdownValue == 1
            ? Row(
                children: [
                  Expanded(
                      child: textField(numberController, numberFocusNode, "数量",
                          inputFormatters: [
                            AmountInputFormatter(
                                digit: getDecimalCount(
                                    (widget.state.basePrecision ?? "")))
                          ],
                          onChanged: (e) => numberInputOnChange(e))),
                  Text(
                    "${widget.state.baseTokenId}",
                    style: appTheme.colorSet.colorDark
                        .style(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ],
              )
            : Row(
                children: [
                  Expanded(
                      child: textField(numberController, numberFocusNode, "数量",
                          inputFormatters: [
                            AmountInputFormatter(
                                digit: getDecimalCount(
                                    (widget.state.basePrecision ?? "")))
                          ],
                          onChanged: (e) => numberInputOnChange(e))),
                  Text(
                    widget.state.baseTokenId ?? "--",
                    style: appTheme.colorSet.colorDark
                        .style(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
      );
    }
  }

  // 交易额输入框
  Widget transactionInput() {
    return dropdownValue == 1
        ? const SizedBox()
        : Container(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            decoration: BoxDecoration(
                color: appTheme.colorSet.colorLight,
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: Row(
              children: [
                Expanded(
                    child: textField(
                        transactionController, transactionFocusNode, "交易额",
                        canUse: false)),
                Text(
                  "USDT",
                  style: appTheme.colorSet.colorDark
                      .style(fontSize: 13, fontWeight: FontWeight.w600),
                ),
              ],
            ),
          );
  }

  // 可用
  Widget canUseMoney() {
    return Container(
      padding: const EdgeInsets.only(),
      child: Row(
        children: [
          Text(
            "可用",
            style: appTheme.colorSet.textGrey.style(fontSize: 12),
          ),
          const Expanded(child: SizedBox()),
          Text(
            widget.state.bbChooseType == BbChooseType.buy
                ? "${NumberUtils.getCountConn(widget.state.usdtNum ?? "0", NumberUtils.getDecimalCount(widget.state.digitMergeConn ?? "") > 5 ? 5 : NumberUtils.getDecimalCount(widget.state.digitMergeConn ?? ""))} USDT"
                : "${NumberUtils.getCountConn(widget.state.baseTokenNum ?? "0", NumberUtils.getDecimalCount(widget.state.minPricePrecision ?? ""))} ${widget.state.baseTokenId ?? ""}",
            style: appTheme.colorSet.textBlack
                .style(fontSize: 12, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            width: 2,
          ),
          GestureDetector(
              onTap: () {
                Navigator.push(context, TransferView.route());
              },
              child: Image.asset(R.ASSETS_IMAGES_ADD_CIRCLE_LINE_PNG)),
        ],
      ),
    );
  }

  /// 购买按钮
  Widget buyBB() {
    return GestureDetector(
      onTap: () async {
        if (!UserInfoManager.shared.isLogin) {
          Navigator.push(context, LoginViewPage.route(
            didLogin: () async {
              if (UserInfoManager.shared.isLogin) {
                if (Navigator.of(context).canPop()) {
                  Navigator.popUntil(context, (route) {
                    return route.settings.name == RootTabBar.path;
                  });
                }
                await context.read<AuthCubit>().requestUserBaseInfo();
              }
            },
          ));
          return;
        }
        if (widget.state.bbChooseType != null) {
          if (priceController.text == "0") {
            showMsg("价格不可为0");
            return;
          }
          widget.contractCubit.buyBB(
            bbChooseType: widget.state.bbChooseType!,
            price: priceController.text,
            number: numberController.text,
          );
        }
      },
      child: Container(
          alignment: Alignment.center,
          height: 40,
          decoration: BoxDecoration(
            color: widget.state.bbChooseType == BbChooseType.buy
                ? appTheme.colorSet.colorPrimary
                : appTheme.colorSet.colorAuxiliary2,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text(
            !(UserInfoManager.shared.isLogin)
                ? "请登录"
                : widget.state.bbChooseType == BbChooseType.buy
                    ? "买入${widget.state.baseTokenId ?? "--"}"
                    : "卖出${widget.state.baseTokenId ?? "--"}",
            style: appTheme.colorSet.textWhite
                .style(fontSize: 14, fontWeight: FontWeight.w600),
          )),
    );
  }

  Widget textField(TextEditingController textEditingController,
      FocusNode focusNode, String hintText,
      {bool canUse = true,
      ValueChanged<String>? onChanged,
      List<TextInputFormatter>? inputFormatters}) {
    return TextField(
      controller: textEditingController,
      focusNode: focusNode,
      keyboardType: const TextInputType.numberWithOptions(),
      inputFormatters: inputFormatters,
      scrollPadding: EdgeInsets.zero,
      enableInteractiveSelection: true,
      enabled: canUse,
      onChanged: onChanged,
      style: appTheme.colorSet.textBlack.style(),
      decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          hintStyle: appTheme.colorSet.textGrey2.style(),
          border: InputBorder.none),
    );
  }

  String getPrice() {
    String text = "0";
    if (priceController.text != "" && widget.state.rates != null) {
      text = NumberUtils.mul(
              widget.state.rates!, double.parse(priceController.text))
          .toStringAsFixed(2)
          .toString();
    }
    return "≈¥$text";
  }

  Widget sliderWidget() {
    return SfSliderTheme(
      data: SfSliderThemeData(
        activeTrackColor: appTheme.colorSet.textBlack,
        inactiveTrackColor: appTheme.colorSet.colorLight,
        thumbColor: Colors.transparent,
        thumbStrokeWidth: 0,
        overlayRadius: 0,
        activeTrackHeight: 6,
        inactiveTrackHeight: 6,
        activeDividerStrokeWidth: 4,
        inactiveDividerStrokeWidth: 4,
        activeDividerRadius: 4,
        inactiveDividerRadius: 4,
        activeDividerStrokeColor: appTheme.colorSet.textBlack,
        inactiveDividerStrokeColor: appTheme.colorSet.textGrey2,
        activeLabelStyle: appTheme.colorSet.textGrey.style(fontSize: 12),
        inactiveLabelStyle: appTheme.colorSet.textGrey.style(fontSize: 12),
      ),
      child: SfSlider(
        thumbIcon: const Image(
          image: AssetImage(R.ASSETS_IMAGES_GROUP_41074_PNG),
          width: 40,
          height: 40,
          fit: BoxFit.contain,
        ),
        min: 0.0,
        max: 100.0,
        showDividers: true,
        value: _value,
        labelFormatterCallback: (dynamic actualValue, String formattedText) {
          return '$formattedText%';
        },
        interval: 25,
        showLabels: true,
        onChanged: (dynamic value) {
          setState(() {
            _value = value;
          });
          upDataSlide();
        },
      ),
    );
  }

  priceInputOnChange(String e) {
    widget.contractCubit.sendPrice(e);
    upDataMoney();
  }

  // 价格输入框计算
  upDataMoney() {
    if (widget.state.bbChooseType == BbChooseType.buy) {
      // 购买
      if (widget.state.limitType == "limit") {
        upDataNumber();
        // 限价
        // String price = widget.priceController.text;
        // String number = numberController.text;
        // String tranNumber = "0";
        // if (price.isEmpty) {
        //   print("价格输入为空 执行市价");
        //   // tranNumber = NumberUtils.mulString(
        //   //     widget.state.marketPrice ?? "0", number.isEmpty ? "0" : number);
        //   upDataNumber();
        // } else {
        //   // tranNumber =
        //   //     NumberUtils.mulString(price, number.isEmpty ? "0" : number);
        //   // transactionController.text = tranNumber;
        //   // upDataNumber(numberController.text);
        //   print("价格输入不为空");
        //   upDataNumber();
        // }
      } else {
        // 市价
      }
    } else {
      if (widget.state.limitType == "limit") {
        upDataNumber();
        // 限价
        // String price = widget.priceController.text;
        // String number = numberController.text;
        // String tranNumber = "0";
        // if (price.isEmpty) {
        //   print("价格输入为空 执行市价");
        //   // tranNumber = NumberUtils.mulString(
        //   //     widget.state.marketPrice ?? "0", number.isEmpty ? "0" : number);
        //   upDataNumber();
        // } else {
        //   // tranNumber =
        //   //     NumberUtils.mulString(price, number.isEmpty ? "0" : number);
        //   // transactionController.text = tranNumber;
        //   // upDataNumber(numberController.text);
        //   print("价格输入不为空");
        //   upDataNumber();
        // }
      } else {
        // 市价
      }
    }
  }

  numberInputOnChange(String e) {
    upDataNumber();
  }

  // 数量输入框计算
  upDataNumber() {
    if (widget.state.bbChooseType == BbChooseType.buy) {
      // 购买
      if (widget.state.limitType == "limit") {
        String price = priceController.text;
        if (price.isEmpty || price == "0") {
          price = widget.state.marketPrice ?? "1";
        }
        // 首先根据市价计算可购买的数量
        String canBuyNumber =
            NumberUtils.divString(widget.state.usdtNum ?? "0", price);
        String result = NumberUtils.getCountConn(canBuyNumber,
            NumberUtils.getDecimalCount(widget.state.basePrecision ?? ""));
        String e = numberController.text;
        if (double.parse(e.isEmpty ? "0" : e) > double.parse(result)) {
          numberController.text = result;
        } else {
          numberController.text = e;
        }
        // 更新进度条
        double resValue = NumberUtils.divPerReverse(
          result,
          numberController.text,
        );
        setState(() {
          _value = resValue;
        });
        // 更新金额
        String needMoney = NumberUtils.mulString(price, numberController.text);
        transactionController.text = needMoney;
      } else {
        // 市价
        String nowNumber =
            numberController.text.isEmpty ? "0" : numberController.text;
        String nowPrice = widget.state.usdtNum ?? "0";
        if (double.parse(nowNumber) > double.parse(nowPrice)) {
          numberController.text = nowPrice;
          nowNumber = nowPrice;
        }
        // 计算百分比 更新进度条
        double resValue = NumberUtils.divPerReverse(nowPrice, nowNumber);
        setState(() {
          _value = resValue;
        });
      }
    } else {
      // 卖出
      if (widget.state.limitType == "limit") {
        String price = priceController.text;
        String baseTokenNum = widget.state.baseTokenNum ?? "0";
        if (price.isEmpty || price == "0") {
          price = widget.state.marketPrice ?? "1";
        }
        String result = NumberUtils.getCountConn(baseTokenNum,
            NumberUtils.getDecimalCount(widget.state.basePrecision ?? ""));
        String e = numberController.text;
        if (double.parse(e.isEmpty ? "0" : e) > double.parse(result)) {
          numberController.text = result;
        } else {
          numberController.text = e;
        }
        // // 更新进度条
        double resValue = NumberUtils.divPerReverse(
          result,
          numberController.text,
        );
        setState(() {
          _value = resValue;
        });
        // // 更新金额
        String needMoney = NumberUtils.mulString(price, numberController.text);
        transactionController.text = needMoney;
      } else {
        // 市价
        String nowNumber =
            numberController.text.isEmpty ? "0" : numberController.text;
        String nowPrice = widget.state.baseTokenNum ?? "0";
        String result = NumberUtils.getCountConn(nowPrice,
            NumberUtils.getDecimalCount(widget.state.basePrecision ?? ""));
        if (double.parse(nowNumber) > double.parse(result)) {
          numberController.text = result;
        } else {
          numberController.text = nowNumber;
        }
        // 计算百分比 更新进度条
        double resValue = NumberUtils.divPerReverse(nowPrice, nowNumber);
        setState(() {
          _value = resValue;
        });
      }
    }
  }

  // 更新进度条数据
  upDataSlide() {
    String value = NumberUtils.getCountConn(_value.toString(), 0);
    if (widget.state.bbChooseType == BbChooseType.buy) {
      // 购买
      if (widget.state.limitType == "limit") {
        // 限价
        String price = priceController.text;
        if (price.isEmpty || price == "0") {
          price = widget.state.marketPrice ?? "1";
        }
        //价格为空
        // 首先根据市价计算可购买的数量
        String canBuyNumber =
            NumberUtils.divString(widget.state.usdtNum ?? "0", price);
        String result = NumberUtils.getCountConn(canBuyNumber,
            NumberUtils.getDecimalCount(widget.state.basePrecision ?? ""));
        String cal = NumberUtils.calPer(value.toString());
        String numberValuePer = NumberUtils.mulString(result, cal);
        String numberValue = NumberUtils.getCountConn(numberValuePer,
            NumberUtils.getDecimalCount(widget.state.basePrecision ?? ""));
        numberController.text = numberValue;
        // 更新金额
        String needMoney = NumberUtils.mulString(price, numberController.text);
        transactionController.text = needMoney;
      } else {
        String nowPrice = widget.state.usdtNum ?? "0";
        String cal = NumberUtils.calPer(value.toString());
        String numberValuePer = NumberUtils.mulString(nowPrice, cal);
        String numberValue = NumberUtils.getCountConn(numberValuePer,
            NumberUtils.getDecimalCount(widget.state.basePrecision ?? ""));
        numberController.text = numberValue;
      }
    } else {
      if (widget.state.limitType == "limit") {
        // 限价
        String price = priceController.text;
        String baseTokenNum = widget.state.baseTokenNum ?? "0";
        if (price.isEmpty || price == "0") {
          price = widget.state.marketPrice ?? "1";
        }
        // 首先获取百分比
        String cal = NumberUtils.calPer(value.toString());
        //根据百分比计算数量
        String number = NumberUtils.mulString(baseTokenNum, cal);
        // 获取小位数的数量
        String numberValue = NumberUtils.getCountConn(number,
            NumberUtils.getDecimalCount(widget.state.basePrecision ?? ""));
        numberController.text = numberValue;
        // // 更新金额
        String needMoney = NumberUtils.mulString(price, numberController.text);
        transactionController.text = needMoney;
      } else {
        String nowPrice = widget.state.baseTokenNum ?? "0";
        String cal = NumberUtils.calPer(value.toString());
        String numberValuePer = NumberUtils.mulString(nowPrice, cal);
        String numberValue = NumberUtils.getCountConn(numberValuePer,
            NumberUtils.getDecimalCount(widget.state.basePrecision ?? ""));
        numberController.text = numberValue;
      }
    }
  }
}
