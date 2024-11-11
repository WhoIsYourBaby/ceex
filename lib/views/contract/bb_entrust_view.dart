import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/utils/time_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// 币币交易委托

class BbEntrust extends StatelessWidget {
  final OrderModel orderModel;
  final Function(OrderModel) cancelOrder;
  const BbEntrust(
      {required this.orderModel, required this.cancelOrder, super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return GestureDetector(
        onTap: () {
          // Navigator.push(context, OrderDetail.route(orderModel: orderModel));
        },
        child: Container(
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
                  text: "状态",
                  style: appTheme.colorSet.textGrey.style(fontSize: 12)),
              const SizedBox(
                height: 6,
              ),
              _rowThreeWidget(
                leftWidget: _priceBlackNum("${orderModel.price}", appTheme),
                centerWidget: _priceBlackNum("${orderModel.origQty}", appTheme),
                rightWidget: const SizedBox(),
                // rightWidget: _transactionType("等待委托",
                //     appTheme.colorSet.colorAuxiliary2.style(fontSize: 14)),
              ),
              const SizedBox(
                height: 20,
              ),
              _cancleOrder(appTheme)
            ],
          ),
        ));
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
        onTap: () => cancelOrder(orderModel),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
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
