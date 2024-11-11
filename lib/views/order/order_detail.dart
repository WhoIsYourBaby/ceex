import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/order/order_detail_cubit.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/utils/time_utils.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetail extends StatefulWidget {
  final cubit = OrderDetailCubit();
  final OrderModel orderModel;
  OrderDetail({required this.orderModel, super.key}) {
    cubit.getOrderDetail(orderModel.orderId!);
  }

  static Route route({required OrderModel orderModel}) => MaterialPageRoute(
      builder: ((context) => OrderDetail(
            orderModel: orderModel,
          )));

  @override
  State<OrderDetail> createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  late AppTheme appTheme;
  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: const AppBarCenterText(
            title: "成交详情",
          ),
        ),
        body: BlocBuilder<OrderDetailCubit, OrderDetailState>(
          bloc: widget.cubit,
          builder: (ctx, state) => CustomScrollView(slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 12,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text(
                  "${widget.orderModel.baseTokenName} ${widget.orderModel.quoteTokenName}",
                  style: appTheme.colorSet.textBlack.style(fontSize: 16),
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                _bgText(
                    bgColor: widget.orderModel.side == "BUY"
                        ? appTheme.colorSet.colorPrimary
                        : appTheme.colorSet.colorAuxiliary2,
                    style: appTheme.colorSet.textWhite.style(fontSize: 12),
                    text: widget.orderModel.side == "BUY" ? "买" : "卖"),
                _bgText(
                    bgColor: appTheme.colorSet.colorLight,
                    style: appTheme.colorSet.textBlack.style(fontSize: 12),
                    text: "普通委托"),
                _bgText(
                    bgColor: appTheme.colorSet.colorLight,
                    style: appTheme.colorSet.textBlack.style(fontSize: 12),
                    text: widget.orderModel.type == "LIMIT" ? "限价" : "市价"),
              ],
            )),
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 8,
              ),
            ),
            // itemText(
            //     text1: "价格",
            //     text2: widget.orderModel.type == "LIMIT" ? "限价" : "市价"),
            itemText(
                text1: "价格",
                text2: "${(widget.orderModel.price ?? "")} ${widget.orderModel.quoteTokenId}"),
            itemText(text1: "成交均价", text2: "${widget.orderModel.avgPrice??""} ${widget.orderModel.quoteTokenId}"),
            itemText(text1: "委托总量", text2: "${widget.orderModel.origQty??""} ${widget.orderModel.baseTokenId}"),
            itemText(text1: "成交数量", text2: "${widget.orderModel.executedQty??""} ${widget.orderModel.baseTokenId}"),
            itemText(text1: "总成交额", text2: "${widget.orderModel.executedAmount??""} ${widget.orderModel.quoteTokenId}"),
            itemText(
                text1: "委托单号",
                text2: widget.orderModel.orderId!,
                needCopy: true),
            SliverToBoxAdapter(
              child: Container(
                height: 8,
                color: appTheme.colorSet.colorLight,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 0),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Text(
                  "成交详情",
                  style: appTheme.colorSet.textBlack.style(fontSize: 16),
                ),
              ),
            ),
            detailDell(
                text1: "时间",
                text2: dataTimeTran(state.orderModel?.time ?? ""),
                state: state),
            detailDell(
                text1: "成交价",
                text2: "${state.orderModel?.price ?? "--"} ${state.orderModel?.quoteTokenId ?? ""}",
                state: state),
            detailDell(
                text1: "数量",
                text2: "${state.orderModel?.quantity ?? "--"} ${state.orderModel?.baseTokenId ?? ""}",
                state: state),
            detailDell(
                text1: "成交额",
                text2: "${widget.orderModel.executedAmount ?? ""} ${state.orderModel?.quoteTokenId ?? ""}",
                state: state),
            detailDell(
                text1: "手续费",
                text2: state.orderModel?.fee ?? "--",
                state: state),
            detailDell(
                text1: "成交单号",
                text2: state.orderModel?.tradeId ?? "--",
                needCopy: true,
                state: state),
          ]),
        ));
  }

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

  Widget detailDell({
    bool needCopy = false,
    required String text1,
    required String text2,
    required OrderDetailState state,
  }) {
    return state.showItem ?? false
        ? itemText(text1: text1, text2: text2, needCopy: needCopy)
        : const SliverToBoxAdapter(child: SizedBox());
  }

  Widget itemText({
    bool needCopy = false,
    required String text1,
    required String text2,
  }) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  text1,
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                ),
                needCopy
                    ? needCopyText(text2)
                    : Text(
                        text2,
                        style: appTheme.colorSet.textBlack.style(fontSize: 12),
                      )
              ],
            )));
  }

  Widget needCopyText(String text) {
    return GestureDetector(
        onTap: () {
          Clipboard.setData(ClipboardData(text: text));
          showMsg("复制成功");
        },
        child: Row(
          children: [
            Text(text, style: appTheme.colorSet.textBlack.style(fontSize: 12)),
            const SizedBox(
              width: 6,
            ),
            Image.asset(R.ASSETS_IMAGES_COPY_2_LINE_PNG)
          ],
        ));
  }
}
