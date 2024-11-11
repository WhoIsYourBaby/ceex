import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/order/order_cubit.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 订单
class OrderItem extends StatelessWidget {
  final OrderType orderType;
  final OrderModel orderModel;
  final Function(OrderModel) cancelOrder;
  const OrderItem(
      {required this.orderType,
      required this.cancelOrder,
      this.orderModel = const OrderModel(),
      super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Container(
      margin: const EdgeInsets.fromLTRB(15, 10, 15, 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: appTheme.colorSet.colorLight),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                orderModel.symbolName!,
                style: appTheme.colorSet.textBlack.style(fontSize: 16),
              ),
              Text(
                dataTimeTran(orderModel.time!),
                style: appTheme.colorSet.textGrey.style(fontSize: 12),
              ),
            ],
          ),
          const SizedBox(
            height: 6,
          ),
          Row(
            children: [
              _bgText(
                  bgColor: orderModel.side! == "BUY"
                      ? appTheme.colorSet.colorPrimary
                      : appTheme.colorSet.colorAuxiliary2,
                  style: appTheme.colorSet.textWhite.style(fontSize: 12),
                  text: orderModel.side! == "BUY" ? "买" : "卖"),
              _bgText(
                  bgColor: appTheme.colorSet.colorLight,
                  style: appTheme.colorSet.textBlack.style(fontSize: 12),
                  text: "普通委托"),
              _bgText(
                  bgColor: appTheme.colorSet.colorLight,
                  style: appTheme.colorSet.textBlack.style(fontSize: 12),
                  text: orderModel.type! == "LIMIT" ? "限价" : "市价"),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          _priceTitle(
              priceType: "价格(${orderModel.quoteTokenName})",
              entrustType: "委托总量(${orderModel.baseTokenName})",
              text: orderType == OrderType.now ? "状态" : "成交额",
              style: appTheme.colorSet.textGrey.style(fontSize: 12)),
          const SizedBox(
            height: 6,
          ),
          _rowThreeWidget(
              leftWidget: _priceBlackNum("${orderModel.price}", appTheme),
              centerWidget: _priceBlackNum("${orderModel.origQty}", appTheme),
              rightWidget: const SizedBox()
              // _transactionType(
              //     orderType == OrderType.now ?"等待委托":"${orderModel.executedAmount}",
              //     orderType == OrderType.now ?appTheme.colorSet.colorAuxiliary4.style():appTheme.colorSet.textBlack.style()),
              ),
          orderType == OrderType.history
              ? const SizedBox(
                  height: 20,
                )
              : const SizedBox(),
          orderType == OrderType.history
              ? _priceTitle(
                  priceType: "成交均价(${orderModel.quoteTokenName})",
                  entrustType: "成交总量",
                  text: "",
                  style: appTheme.colorSet.textGrey.style(fontSize: 12))
              : const SizedBox(),
          orderType == OrderType.history
              ? const SizedBox(
                  height: 6,
                )
              : const SizedBox(),
          orderType == OrderType.history
              ? _rowThreeWidget(
                  leftWidget:
                      _priceBlackNum("${orderModel.avgPrice}", appTheme),
                  centerWidget:
                      _priceBlackNum("${orderModel.executedQty}", appTheme),
                  rightWidget: Text(
                    getStatusText(orderModel.status ?? ""),
                    style: appTheme.colorSet.textGrey.style(fontSize: 12),
                  ),
                )
              : const SizedBox(),
          orderType == OrderType.transaction
              ? const SizedBox(
                  height: 20,
                )
              : const SizedBox(),
          orderType == OrderType.transaction
              ? _priceTitle(
                  priceType: "手续费(USDT)",
                  entrustType: "成交总量(EOS)",
                  text: "",
                  style: appTheme.colorSet.textGrey.style(fontSize: 12))
              : const SizedBox(),
          orderType == OrderType.transaction
              ? const SizedBox(
                  height: 6,
                )
              : const SizedBox(),
          orderType == OrderType.transaction
              ? _rowThreeWidget(
                  leftWidget: _priceBlackNum("5,000", appTheme),
                  centerWidget: Row(
                    children: [
                      _priceBlackNum("0198656565", appTheme),
                      Image.asset(R.ASSETS_IMAGES_COPY_2_LINE_PNG)
                    ],
                  ),
                  rightWidget: const SizedBox(),
                )
              : const SizedBox(),
          orderType == OrderType.now
              ? const SizedBox(
                  height: 20,
                )
              : const SizedBox(),
          orderType == OrderType.now
              ? _cancleOrder(appTheme)
              : const SizedBox(),
        ],
      ),
    );
  }

  //订单状态 (NEW 订单已创建 PARTIALLY_FILLED 部分成交FILLED 完全成交 CANCELED 已取消 REJECTED 已拒绝)
  String getStatusText(String status) {
    if (status == "NEW") {
      return "订单已创建";
    } else if (status == "PARTIALLY_FILLED") {
      return "部分成交";
    } else if (status == "FILLED") {
      return "完全成交";
    } else if (status == "CANCELED") {
      return "已取消";
    } else if (status == "REJECTED") {
      return "已拒绝";
    } else {
      return "";
    }
  }

  // 带背景的文字
  Widget _bgText({
    required Color bgColor,
    required TextStyle style,
    required String text,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 6),
      decoration:
          BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(1)),
      padding: const EdgeInsets.all(5),
      child: Text(
        text,
        style: style,
      ),
    );
  }

  // 价格类型说明
  Widget _priceTitle({
    required TextStyle style,
    required String priceType, // 价格类型
    required String entrustType, // 委托类型
    required String text,
  }) {
    return Row(
      children: [
        Expanded(
            flex: 102,
            child: Text(
              priceType,
              style: style,
            )),
        Expanded(
            flex: 155,
            child: Text(
              entrustType,
              style: style,
            )),
        Expanded(
          flex: 56,
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
              text,
              style: style,
            ),
          ),
        )
      ],
    );
  }

  // 价格展示
  Widget _rowThreeWidget({
    required Widget leftWidget,
    required Widget rightWidget,
    required Widget centerWidget,
  }) {
    return Row(
      children: [
        Expanded(flex: 102, child: leftWidget),
        Expanded(flex: 155, child: centerWidget),
        Expanded(
          flex: 56,
          child: Container(
            alignment: Alignment.centerRight,
            child: rightWidget,
          ),
        )
      ],
    );
  }

  // 黑色价格
  Widget _priceBlackNum(String text, AppTheme appTheme) {
    return Text(
      text,
      style: appTheme.colorSet.textBlack.style(),
    );
  }

  // 成交状态
  Widget _transactionType(String text, TextStyle style) {
    return Text(
      text,
      style: style,
    );
  }

  // 撤单按钮
  Widget _cancleOrder(AppTheme appTheme) {
    return GestureDetector(
        onTap: () {
          cancelOrder(orderModel);
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 24),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: appTheme.colorSet.colorLight),
          child: Text(
            "撤单",
            style: appTheme.colorSet.textBlack.style(fontSize: 12),
          ),
        ));
  }
}
