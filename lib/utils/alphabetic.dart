import 'dart:async';

import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///右侧字母索引
class Alphabetic extends StatefulWidget {
  final Map<String, List<TokenModel>> dataSource;
  final List<String> letterContent;
  final ValueChanged<String> valueChanged;
  final ScrollController scrollController;

  const Alphabetic(
      {super.key,
      required this.letterContent,
      required this.dataSource,
      required this.scrollController,
      required this.valueChanged});

  @override
  State<Alphabetic> createState() => _AlphabeticState();
}

class _AlphabeticState extends State<Alphabetic> {
  var selectdefult = 0; //初始化选择
  bool showtype = false;

  late AppTheme appTheme;
  //初始化循环数据
  @override
  void initState() {
    super.initState();
  }

//循环字母容器，添加function
  buildGestureDetector() {
    List<Widget> tiles = []; //循环字母视图容器
    for (var i = 0; i < widget.letterContent.length; i++) {
      tiles.add(Row(
        children: <Widget>[
          GestureDetector(
            onTapDown: (e) {
              setState(() {
                selectdefult = i;
                showtype = true;
              });
              //单个字母分类模块高度为52，单个字母分类下的单个模块高度为20
              if (52 * jumptolist(i - 1).toDouble() + 20 * i + 143 >=
                  widget.scrollController.position.maxScrollExtent) {
                widget.scrollController
                    .jumpTo(widget.scrollController.position.maxScrollExtent);
              } else {
                widget.scrollController.jumpTo(
                    (52 * jumptolist(i - 1).toDouble() + 20 * i + 143)
                        .toDouble());
                widget.valueChanged(widget.letterContent[i].toString());
              }
            },
            onTapUp: (e) {
              setState(() {
                int iq = 1;
                Timer.periodic(Duration(milliseconds: 100), (Timer timer) {
                  iq--;
                  if (iq == 0) {
                    setState(() {
                      showtype = false;
                    });
                    timer.cancel();
                  }
                });
              });
            },
            child: Container(
              width: 20,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: i == selectdefult
                      ? appTheme.colorSet.colorPrimary
                      : appTheme.colorSet.textWhite,
                  borderRadius: BorderRadius.circular(100)),
              child: Text(
                widget.letterContent[i],
                style: i == selectdefult
                    ? appTheme.colorSet.textWhite.style(fontSize: 10)
                    : appTheme.colorSet.textBlack.style(fontSize: 10),
              ),
            ),
          ),
        ],
      ));
    }
    return tiles;
  }

//手势滑动开始按下
  _onDragStart(BuildContext context, DragStartDetails start) {
    setState(() {
      showtype = true;
    });
  }

//手势滑动开始滑动
  _onDragUpdate(BuildContext context, DragUpdateDetails update) {
    RenderBox getBox = context.findRenderObject() as RenderBox;
    var local = getBox.globalToLocal(update.globalPosition);
    var ratio = local.dy / getBox.size.height;
    var index = (ratio * (widget.letterContent.length - 1)).round();
    var scrollIndex = local.dy <= 0 ? 0 : (local.dy / 20.0).round();
    if (scrollIndex <= 0) {
      //当上滑index超过了0 强制初始化
      setState(() {
        selectdefult = 0;
      });
      widget.scrollController
          .jumpTo(widget.scrollController.position.minScrollExtent);
    } else if (scrollIndex >= widget.letterContent.length) {
      //当下滑index超过了widget.letterContent.length 强制初始化
      setState(() {
        selectdefult = widget.letterContent.length - 1;
      });
      widget.scrollController
          .jumpTo(widget.scrollController.position.maxScrollExtent);
    } else {
      setState(() {
        selectdefult = index.clamp(0, widget.letterContent.length - 1).toInt();
      });
      if (52 * jumptolist(scrollIndex - 1).toDouble() +
              20 * scrollIndex +
              143 >=
          widget.scrollController.position.maxScrollExtent) {
        widget.scrollController
            .jumpTo(widget.scrollController.position.maxScrollExtent);
      } else {
        widget.scrollController.jumpTo(
            (52 * jumptolist(scrollIndex - 1).toDouble() +
                    20 * scrollIndex +
                    143)
                .toDouble());
        widget.valueChanged(widget.letterContent[scrollIndex].toString());
      }
    }
  }

  //返回单个字母分类下的模块数量
  jumptolist(int index) {
    num q = 0;
    for (; index >= 0; index--) {
      q = q + (widget.dataSource[widget.letterContent[index]]?.length ?? 0);
    }
    return q;
  }

//手势滑动结束离开
  _onDragEnd(BuildContext context, DragEndDetails update) {
    setState(() {
      int iq = 1;
      Timer.periodic(const Duration(milliseconds: 100), (Timer timer) {
        iq--;
        if (iq == 0) {
          setState(() {
            showtype = false;
          });
          timer.cancel();
        }
      });
    });
  }

//右侧字母索引
  _letter() {
    return GestureDetector(
      onVerticalDragStart: (DragStartDetails start) {
        _onDragStart(context, start);
      },
      onVerticalDragUpdate: (DragUpdateDetails update) =>
          _onDragUpdate(context, update),
      onVerticalDragEnd: (DragEndDetails end) {
        _onDragEnd(context, end);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            margin: const EdgeInsets.only(right: 8),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: buildGestureDetector(),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    return _letter();
  }
}
