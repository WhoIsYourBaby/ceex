import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/tools.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/const/resource.dart';

/// 首页登录成功后1-2-3步骤
class HomeStepsSliver extends StatefulWidget {
  const HomeStepsSliver({super.key});

  @override
  State<HomeStepsSliver> createState() => _HomeStepsSliverState();
}

class _HomeStepsSliverState extends State<HomeStepsSliver> {
  late AppTheme appTheme;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final bgSize = scaleSizeFromWidth(Size(345, 231), size.width - 15 * 2);
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: bgSize.height,
      width: bgSize.width,
      child: Stack(
        children: [
          Image.asset(
            R.ASSETS_IMAGES_BG_PNG,
            fit: BoxFit.fitWidth,
            width: bgSize.width,
            height: bgSize.height,
          ),
          Positioned.fill(
            top: 16,
            bottom: 16,
            left: 20,
            right: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "3步\n",
                    style: appTheme.colorSet.textBlack.style(fontSize: 18),
                    children: [
                      TextSpan(
                        text: "开启数字货币交易",
                        style: appTheme.colorSet.textGrey.style(),
                      ),
                    ],
                  ),
                ),
                HomeStepCell(
                  index: 1,
                  isFinish: true,
                  title: "注册账户",
                  subtitle: "完成注册，开启投资之旅",
                ),
                HomeStepCell(
                  index: 2,
                  isFinish: false,
                  title: "充值",
                  subtitle: "获取第一笔数字资产",
                  onTap: () {
                    showMsg("TODO: 充值");
                  },
                ),
                HomeStepCell(
                  index: 3,
                  isFinish: false,
                  title: "交易",
                  subtitle: "完成第一笔交易",
                  onTap: () {
                    showMsg("TODO: 交易");
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}

class HomeStepCell extends StatelessWidget {
  final int index;
  final bool isFinish;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  const HomeStepCell({
    required this.index,
    required this.isFinish,
    required this.title,
    required this.subtitle,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 46,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            isFinish
                ? Image.asset(
                    R.ASSETS_IMAGES_GROUP_77_PNG,
                    width: 14,
                    height: 14,
                  )
                : Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: appTheme.colorSet.colorGrey,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "${index}",
                      style: appTheme.colorSet.textGrey.style(fontSize: 12)
                          .copyWith(color: Colors.white),
                    ),
                  ),
            SizedBox(
              width: 8,
            ),
            RichText(
              text: TextSpan(
                text: title + "\n",
                style: isFinish
                    ? appTheme.colorSet.colorPrimary.style(fontSize: 14)
                    : appTheme.colorSet.textBlack.style(),
                children: [
                  TextSpan(
                    text: subtitle,
                    style: appTheme.colorSet.textGrey.style(fontSize: 12),
                  ),
                ],
              ),
            ),
            Spacer(),
            if (!isFinish)
              Image.asset(
                R.ASSETS_IMAGES_ARROWS_CHEVRON_CHEVRON_RIGHT_PNG,
                width: 16,
                height: 16,
              ),
          ],
        ),
      ),
    );
  }
}
