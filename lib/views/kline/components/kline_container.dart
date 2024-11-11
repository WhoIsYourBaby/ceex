import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/kline/kline_graph_cubit.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:ceex_flutter/components/fkline/fkline.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KlineContainer extends StatefulWidget {
  final KlineGraphCubit cubit;
  const KlineContainer({
    required this.cubit,
    super.key,
  });

  @override
  State<KlineContainer> createState() => _KlineWidgetState();
}

class _KlineWidgetState extends State<KlineContainer> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    final maStyle = appTheme.colorSet.colorDark.style(fontSize: 20).copyWith(fontSize: 12);
    return Container(
      width: screenSize.width,
      // height: screenSize.width,
      // color: Colors.red,
      child: KlinePageWidget(widget.cubit),
    );
  }
}
