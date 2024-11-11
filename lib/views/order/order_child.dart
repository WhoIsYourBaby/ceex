import 'package:ceex_flutter/components/empty_widget.dart';
import 'package:ceex_flutter/cubit/order/order_cubit.dart';
import 'package:ceex_flutter/model/order/order_model.dart';
import 'package:ceex_flutter/views/order/components/order_history_item_widget.dart';
import 'package:ceex_flutter/views/order/components/order_item_widget.dart';
import 'package:ceex_flutter/views/order/components/order_transaction_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderChild extends StatefulWidget {
  final OrderType orderType;
  final cubit = OrderCubit();
  OrderChild({required this.orderType, super.key});

  @override
  State<OrderChild> createState() => _OrderChildState();
}

class _OrderChildState extends State<OrderChild>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    widget.cubit.getOrderList(orderType: widget.orderType);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocBuilder<OrderCubit, OrderState>(
        bloc: widget.cubit,
        builder: (ctx, state) {
          if (itemcount() == 0) {
            return Padding(
              padding: EdgeInsets.only(top: 40),
              child: EmptyWidget(),
            );
          } else {
            return ListView.builder(
                itemCount: itemcount(),
                itemBuilder: (context, index) {
                  return child(index);
                });
          }
        }
        // Padding(
        //           padding: EdgeInsets.only(top: 20),
        //           child: EmptyWidget(),
        //         )

        //  ListView.builder(
        //     itemCount: itemcount(),
        //     itemBuilder: (context, index) {
        //       return child(index);
        //     }),
        );
  }

  Widget child(int index) {
    Widget _child = SizedBox();
    switch (widget.orderType) {
      case OrderType.now:
        _child = OrderItem(
          cancelOrder: (model) {
            widget.cubit.cancelOrder(model);
          },
          orderType: widget.orderType,
          orderModel: _orderModel(index),
        );
        break;
      case OrderType.history:
        _child = OrderHistoryItem(
          orderType: widget.orderType,
          orderModel: _orderModel(index),
        );
        break;
      case OrderType.transaction:
        _child = OrderTransactionItem(
          orderType: widget.orderType,
          orderModel: _orderModel(index),
        );
        break;
      default:
    }
    return _child;
  }

  int itemcount() {
    int count = 0;
    switch (widget.orderType) {
      case OrderType.now:
        count = (widget.cubit.state.nowOrderList ?? []).length;
        break;
      case OrderType.history:
        count = (widget.cubit.state.historyOrderList ?? []).length;
        break;
      case OrderType.transaction:
        count = (widget.cubit.state.historyTransaction ?? []).length;
        break;
      default:
    }
    return count;
  }

  OrderModel _orderModel(index) {
    OrderModel orderModel = OrderModel();
    switch (widget.orderType) {
      case OrderType.now:
        orderModel = widget.cubit.state.nowOrderList![index];
        break;
      case OrderType.history:
        orderModel = widget.cubit.state.historyOrderList![index];
        break;
      case OrderType.transaction:
        orderModel = widget.cubit.state.historyTransaction![index];
        break;
      default:
    }
    return orderModel;
  }
}
