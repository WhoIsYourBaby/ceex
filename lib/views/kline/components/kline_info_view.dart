import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/kline/token_info_cubit.dart';
import 'package:ceex_flutter/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';

class KlineInfoView extends StatefulWidget {
  const KlineInfoView({super.key});

  @override
  State<KlineInfoView> createState() => _KlineInfoViewState();
}

class _KlineInfoViewState extends State<KlineInfoView> {
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocBuilder<TokenInfoCubit, TokenInfoState>(
      builder: (context, state) {
        final infoModel = state.tokenInfoModel;
        if (infoModel == null) {
          return const Placeholder();
        }
        return ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            _KlineInfoCell(
                title: "发行时间",
                detail: infoModel.publishTime ?? "",
                showIcon: false),
            _KlineInfoCell(
                title: "供应总量",
                detail: infoModel.maxQuantitySupplied ?? "",
                showIcon: false),
            _KlineInfoCell(
                title: "流通量",
                detail: infoModel.currentTurnover ?? "",
                showIcon: false),
            _KlineInfoCell(
                title: "白皮书",
                detail: infoModel.whitePaperUrl ?? "",
                showIcon: true),
            _KlineInfoCell(
                title: "网站",
                detail: infoModel.officialWebsiteUrl ?? "",
                showIcon: true),
            _KlineInfoCell(
                title: "区块浏览器",
                detail: infoModel.exploreUrl ?? "",
                showIcon:
                    (infoModel.exploreUrl?.length ?? 0) > 0 ? true : false),
            Container(
              height: 1,
              width: double.infinity,
              color: appTheme.colorSet.colorLight,
            ),
            SizedBox(
              height: 12,
            ),
            _buildInfo(context, infoModel, appTheme),
          ],
        );
      },
    );
  }

  Widget _buildInfo(
      BuildContext context, TokenInfoModel infoModel, AppTheme appTheme) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "简介",
          style: appTheme.colorSet.textBlack.style(fontSize: 16),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          infoModel.description ?? "",
          style: appTheme.colorSet.textGrey.style(),
        ),
      ],
    );
  }
}

class _KlineInfoCell extends StatelessWidget {
  final String title;
  final String detail;
  final bool showIcon;
  const _KlineInfoCell({
    required this.title,
    required this.detail,
    required this.showIcon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appThtme = context.watch<AppconfCubit>().state.appTheme;
    return Container(
      height: 48,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: appThtme.colorSet.textGrey.style(),
          ),
          // Spacer(),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              detail,
              textAlign: TextAlign.end,
              style: appThtme.colorSet.textBlack.style(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (showIcon) ...[
            SizedBox(
              width: 4,
            ),
            GestureDetector(
              onTap: () {
                Clipboard.setData(ClipboardData(text: detail));
                showToast("内容已拷贝");
              },
              child: Image.asset(
                R.ASSETS_IMAGES_SHARE_3_LINE_PNG,
                width: 16,
                height: 16,
              ),
            ),
          ]
        ],
      ),
    );
  }
}
