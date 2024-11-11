import 'package:ceex_flutter/components/fkline/fkline.dart';
import 'package:ceex_flutter/components/fkline/model/klineConstrants.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class KlineTypeSelectorWidget extends StatelessWidget {
  final List<YKLineType> lineTypes;
  const KlineTypeSelectorWidget({required this.lineTypes, super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    final maStyle =
        appTheme.colorSet.colorDark.style(fontSize: 20).copyWith(fontSize: 12);
    return Container(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTypeItem(context, "MA", [
            YKLineType.MA5,
            YKLineType.MA10,
            YKLineType.MA30,
          ]),
          _buildTypeItem(context, "EMA", [
            YKLineType.EMA12,
            YKLineType.EMA26,
          ]),
          Text(
            "BOLL",
            style: maStyle,
          ),
          Text(
            "SAR",
            style: maStyle,
          ),
          Text(
            "VOL",
            style: maStyle,
          ),
          Text(
            "MACD",
            style: maStyle,
          ),
          Text(
            "WR",
            style: maStyle,
          ),
        ],
      ),
    );
  }

  Widget _buildTypeItem(
    BuildContext context,
    String title,
    List<YKLineType> targetTypes,
  ) {
    KlineBloc bloc = KlineBlocProvider.of<KlineBloc>(context);
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    final normalStyle = appTheme.colorSet.colorDark.style(fontSize: 12);
    final selectStyle = appTheme.colorSet.colorPrimary1.style(fontSize: 12);
    final isSelect = lineTypes.indexWhere(
          (element) => targetTypes.contains(element),
        ) >=
        0;
    return GestureDetector(
      onTap: () {
        if (isSelect) {
          bloc.removeKlineTypes(targetTypes);
        } else {
          bloc.addKlineTypes(targetTypes);
        }
      },
      child: Text(
        title,
        style: isSelect ? selectStyle : normalStyle,
      ),
    );
  }
}
