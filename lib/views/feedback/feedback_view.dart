import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FeedBackView extends StatefulWidget {
  const FeedBackView({super.key});

  static Route route() => MaterialPageRoute(
        builder: (context) => const FeedBackView(),
      );

  @override
  State<FeedBackView> createState() => _FeedBackViewState();
}

class _FeedBackViewState extends State<FeedBackView> {
  late AppTheme appTheme;

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "意见反馈",
            style: appTheme.colorSet.textBlack.style(fontSize: 18),
          ),
          iconTheme: IconThemeData(
            color: appTheme.colorSet.textBlack,
          ),
        ),
        body: CustomScrollView(slivers: [
          SliverToBoxAdapter(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                child: Text(
                  "描述",
                  style: appTheme.colorSet.textBlack
                      .style(fontSize: 16, fontWeight: FontWeight.w600),
                )),
          ),
          SliverToBoxAdapter(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 0),
            margin: EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: appTheme.colorSet.textBlack, width: 1),
            ),
            height: 300,
            child: TextField(
              maxLines: null,
              scrollPadding: EdgeInsets.zero,
              enableInteractiveSelection: true,
              style: appTheme.colorSet.textBlack.style(),
              decoration: InputDecoration(
                  hintText: "",
                  isDense: true,
                  hintStyle: appTheme.colorSet.textGrey2.style(),
                  border: InputBorder.none),
            ),
          )),
          SliverToBoxAdapter(
              child: GestureDetector(
            onTap: () {
              showMsg("反馈成功，我们会在24小时内处理您的反馈！");
              Navigator.pop(context);
            },
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                padding: EdgeInsets.symmetric(
                  vertical: 15,
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border:
                      Border.all(color: appTheme.colorSet.textBlack, width: 1),
                  color: appTheme.colorSet.textBlack,
                ),
                child: Text(
                  "提交",
                  style: appTheme.colorSet.textWhite.style(),
                )),
          ))
        ]));
  }
}
