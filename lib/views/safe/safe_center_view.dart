import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/safe/safe_center_view_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/views/safe/account_information_show/account_information_show_view.dart';
import 'package:ceex_flutter/views/safe/bind_account/bind_email.dart';
import 'package:ceex_flutter/views/safe/bind_account/bind_phone.dart';
import 'package:ceex_flutter/views/safe/bind_account/set_google_view.dart';
import 'package:ceex_flutter/views/safe/replace_login_password/replace_login_password.dart';
import 'package:ceex_flutter/views/safe/set_money_password/set_money_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SafeCenterView extends StatefulWidget {
  const SafeCenterView({super.key});
  static const String path = '/safecenterview';

  static Route route() => MaterialPageRoute(
        builder: (context) => const SafeCenterView(),
        settings: const RouteSettings(name: SafeCenterView.path),
      );

  @override
  State<SafeCenterView> createState() => _SafeCenterViewState();
}

class _SafeCenterViewState extends State<SafeCenterView> {
  late AppTheme appTheme;
  late BuildContext _buildContext;
  final cubit = SafeCenterViewCubit();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    cubit.checkSafeLevel();
    _buildContext = context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: AppBarCenterText(
            title: AppLocalizations.of(context)!.safeCenter,
          ),
        ),
        body: SafeArea(
            bottom: true,
            child: BlocBuilder<SafeCenterViewCubit, SafeCenterViewState>(
              bloc: cubit,
              builder: (context, state) {
                return CustomScrollView(slivers: [
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 32,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: topSafeVersion(),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 20,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      AppLocalizations.of(context)!.safeVerify,
                      style: appTheme.colorSet.textBlack.style(),
                    ),
                  )),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 6,
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      AppLocalizations.of(context)!.forYourSafe,
                      style: appTheme.colorSet.textGrey3.style(fontSize: 10),
                    ),
                  )),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 10,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: verifyList(
                      title1: AppLocalizations.of(context)!.fingerVerify,
                      title2: AppLocalizations.of(context)!.googleVerify,
                      image1: R.ASSETS_IMAGES_FINGERPRINT_LINE_PNG,
                      image2: R.ASSETS_IMAGES_IMAGE_200_PNG,
                      ischeck1: state.bindFinger ?? false,
                      ischeck2: state.bindGA ?? false,
                      safeVerType1: SafeVerType.finger,
                      safeVerType2: SafeVerType.google,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 16,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: verifyList(
                      title1: AppLocalizations.of(context)!.phoneNumber,
                      title2: AppLocalizations.of(context)!.email,
                      content1: state.phone,
                      content2: state.email,
                      image1: R.ASSETS_IMAGES_CELLPHONE_LINE_PNG,
                      image2: R.ASSETS_IMAGES_INVITE_LINE_PNG,
                      ischeck1: (state.phone ?? "").isNotEmpty,
                      ischeck2: (state.email ?? "").isNotEmpty,
                      safeVerType1: SafeVerType.phone,
                      safeVerType2: SafeVerType.email,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 32,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: rowClick(
                        title: AppLocalizations.of(context)!.loginPassword,
                        connect: AppLocalizations.of(context)!.modifying,
                        type: RowClickType.loginPassword),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: rowClick(
                        title: AppLocalizations.of(context)!.moneyPassword,
                        connect: AppLocalizations.of(context)!.setting,
                        type: RowClickType.moneyPassword),
                  ),
                ]);
              },
            )));
  }

  // 顶部安全等级
  Widget topSafeVersion() {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Image.asset(
          _getSafeImage(cubit.state.safeLavel ?? SafeLavel.low),
        ),
        const SizedBox(
          width: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _getSafeText(cubit.state.safeLavel ?? SafeLavel.low),
              style: appTheme.colorSet.textBlack.style(fontSize: 18),
            ),
            const SizedBox(
              height: 6,
            ),
            Text(
              AppLocalizations.of(context)!.safeLevel,
              style: appTheme.colorSet.textGrey3.style(fontSize: 12),
            ),
          ],
        )
      ],
    );
  }

  String _getSafeImage(SafeLavel safeLevel) {
    switch (safeLevel) {
      case SafeLavel.low:
        return R.ASSETS_IMAGES_SAFE_LOW_PNG;
      case SafeLavel.middle:
        return R.ASSETS_IMAGES_SAFE_MID_PNG;
      case SafeLavel.height:
        return R.ASSETS_IMAGES_SAFE_HIGHT_PNG;
      default:
        return R.ASSETS_IMAGES_SAFE_LOW_PNG;
    }
  }

  String _getSafeText(SafeLavel safeLevel) {
    switch (safeLevel) {
      case SafeLavel.low:
        return AppLocalizations.of(context)!.low;
      case SafeLavel.middle:
        return AppLocalizations.of(context)!.middle;
      case SafeLavel.height:
        return AppLocalizations.of(context)!.height;
      default:
        return AppLocalizations.of(context)!.low;
    }
  }

  // 验证列表
  Widget verifyList({
    required String title1,
    required String title2,
    String? content1,
    String? content2,
    required String image1,
    required String image2,
    required bool ischeck1,
    required bool ischeck2,
    required SafeVerType safeVerType1,
    required SafeVerType safeVerType2,
  }) {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () => onclick(safeVerType1, ischeck1),
                child: verifyItem(
                  title: title1,
                  content: content1,
                  image: image1,
                  ischeck: ischeck1,
                ))),
        const SizedBox(
          width: 13,
        ),
        Expanded(
            flex: 1,
            child: GestureDetector(
                onTap: () => onclick(safeVerType2, ischeck2),
                child: verifyItem(
                  title: title2,
                  content: content2,
                  image: image2,
                  ischeck: ischeck2,
                ))),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  // 验证子widget
  Widget verifyItem({
    required String title,
    String? content,
    required String image,
    required bool ischeck,
  }) {
    return Container(
      decoration: BoxDecoration(
          color: appTheme.colorSet.colorLight,
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Image.asset(image),
              const Spacer(),
              ischeck
                  ? Image.asset(R.ASSETS_IMAGES_CHECK_CIRCLE_LINE_PNG)
                  : Image.asset(R.ASSETS_IMAGES_WARNING_LINE_PNG),
              Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_WHITE_PNG)
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: appTheme.colorSet.textBlack.style(),
          ),
          content != null
              ? Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    content,
                    style: appTheme.colorSet.textBlack.style(fontSize: 10),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  Widget rowClick(
      {required String title,
      required String connect,
      required RowClickType type}) {
    return GestureDetector(
        onTap: () {
          switch (type) {
            case RowClickType.loginPassword:
              Navigator.push(context, ReplaceLoginPassword.route());
              break;
            case RowClickType.moneyPassword:
              Navigator.push(
                  context,
                  SetMoneyPassword.route(
                      didLogin: () => backThisPage(context)));
              break;
            default:
          }
        },
        child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            color: appTheme.colorSet.textWhite,
            child: Row(
              children: [
                Text(
                  title,
                  style: appTheme.colorSet.textBlack.style(fontSize: 15),
                ),
                const Spacer(),
                Text(
                  connect,
                  style: type == RowClickType.moneyPassword
                      ? appTheme.colorSet.colorPrimary.style(fontSize: 14)
                      : appTheme.colorSet.textBlack.style(),
                ),
                const SizedBox(
                  width: 8,
                ),
                Image.asset(R.ASSETS_IMAGES_ARROWS_CHEVRON_CHEVRON_RIGHT_PNG)
              ],
            )));
  }

  onclick(SafeVerType safeVerType, bool ischeck) {
    switch (safeVerType) {
      case SafeVerType.finger:
        if (cubit.state.bindFinger ?? false) {
          cancleBindFingerDialog();
        } else {
          cubit.bindFinger();
        }
        break;
      case SafeVerType.email:
        if (ischeck) {
          Navigator.push(
              _buildContext,
              AccountInformationShowView.route(
                  account: cubit.state.email!,
                  safeVerType: safeVerType,
                  didLogin: () => backThisPage(context)));
        } else {
          Navigator.push(
              _buildContext,
              BindEmail.route(
                  safeVerType: safeVerType,
                  didLogin: () => backThisPage(context)));
        }
        break;
      case SafeVerType.phone:
        if (ischeck) {
          Navigator.push(
              _buildContext,
              AccountInformationShowView.route(
                  account: cubit.state.phone!,
                  safeVerType: safeVerType,
                  didLogin: () => backThisPage(context)));
        } else {
          Navigator.push(
              _buildContext,
              BindPhone.route(
                  safeVerType: safeVerType,
                  isFromSafeCenter: true,
                  didLogin: () => backThisPage(context)));
        }
        break;
      case SafeVerType.google:
        if (ischeck) {
          Navigator.push(
              _buildContext,
              AccountInformationShowView.route(
                  safeVerType: safeVerType,
                  didLogin: () => backThisPage(context)));
        } else {
          Navigator.push(
              _buildContext,
              SetGoogleView.route(
                  safeVerType: safeVerType,
                  didLogin: () => backThisPage(context)));
        }
        break;
      default:
    }
  }

  cancleBindFingerDialog() async {
    var result = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            actionsAlignment: MainAxisAlignment.spaceAround,
            title: const Text(
              '确定要取消绑定指纹吗',
              textAlign: TextAlign.center,
            ),
            titleTextStyle: appTheme.colorSet.colorDark
                .style(fontSize: 16, fontWeight: FontWeight.w600),
            actions: <Widget>[
              TextButton(
                  child: Text(
                    '取消',
                    style: appTheme.colorSet.colorDark.style(
                      fontSize: 14,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context, false);
                  }),
              TextButton(
                child: Text(
                  '确定',
                  style: appTheme.colorSet.colorDark.style(
                    fontSize: 14,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context, true);
                },
              ),
            ],
          );
        });
    if (result) {
      cubit.cancleBindFinger();
    }
  }

  backThisPage(BuildContext context) {
    Navigator.popUntil(context, (route) {
      return route.settings.name == SafeCenterView.path;
    });
    cubit.getUserInfo();
    cubit.checkSafeLevel();
  }
}
