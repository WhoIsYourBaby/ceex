import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/assets/transfer_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:ceex_flutter/model/assets/sub_account_query_model.dart';
import 'package:ceex_flutter/utils/input_formatter/amount_input_formatter.dart';
import 'package:ceex_flutter/views/assets/components/assets_dialog.dart';
import 'package:ceex_flutter/views/assets/orderlist/order_list_view.dart';
import 'package:ceex_flutter/views/assets/search_tokens/search_tokens_view.dart';
import 'package:ceex_flutter/views/contract/common/network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:syncfusion_flutter_core/theme.dart';

// 划转
class TransferView extends StatefulWidget {
  TransferView({super.key});

  static Route route() =>
      MaterialPageRoute(builder: ((context) => TransferView()));

  @override
  State<TransferView> createState() => _TransferViewState();
}

class _TransferViewState extends State<TransferView> {
  final cubit = TransferCubit();
  late AppTheme appTheme;
  TextEditingController controller = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    cubit.init(context);
  }

  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: AppBarCenterText(
            title: AppLocalizations.of(context)!.transfer,
            rigetWidget: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    OrderListView.route(cubit.state.tokenName ?? "USDT"));
              },
              child: Image.asset(R.ASSETS_IMAGES_TASK_2_LINE_PNG),
            ),
          ),
        ),
        body: BlocConsumer<TransferCubit, TransferState>(
          bloc: cubit,
          builder: (context, state) {
            return CustomScrollView(slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 25,
                ),
              ),
              SliverToBoxAdapter(
                child: topChoose(),
              ),
              SliverToBoxAdapter(
                child: Container(
                  height: 8,
                  color: appTheme.colorSet.colorLight,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    AppLocalizations.of(context)!.token,
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              SliverToBoxAdapter(
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          SearchTokensView.route((tokenSelect) {
                        if (tokenSelect == null) return;
                        Navigator.pop(context);
                        cubit.changeTokenName(tokenSelect.tokenName ?? "USDT",
                            tokenSelect.iconUrl ?? "");
                      }));
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                      padding: const EdgeInsets.only(left: 15, right: 16),
                      height: 44,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: appTheme.colorSet.colorLight),
                      child: Row(
                        children: [
                          cubit.state.tokenNameImage == null
                              ? Image.asset(R.ASSETS_IMAGES_ELLIPSE_2250_PNG)
                              : NetworkImageWidget(
                                  url: cubit.state.tokenNameImage ?? "",
                                  width: 20,
                                  height: 20,
                                ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            state.tokenName ?? "USDT",
                            style: appTheme.colorSet.textBlack.style(),
                          ),
                          const Spacer(),
                          Image.asset(R.ASSETS_IMAGES_DOWN_SMALL_LINE_PNG)
                        ],
                      ),
                    )),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 32,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    AppLocalizations.of(context)!.transfer +
                        AppLocalizations.of(context)!.quantity,
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 12,
                ),
              ),
              SliverToBoxAdapter(child: inputNum()),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              SliverToBoxAdapter(
                child: sliderWidget(),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 16,
                ),
              ),
              SliverToBoxAdapter(
                  child: Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  "${AppLocalizations.of(context)!.canUse}：${state.amount ?? "--"} ${state.tokenName ?? "USDT"}",
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                ),
              )),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 24,
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      AppLocalizations.of(context)!.assetsTranferReminder,
                      style:
                          appTheme.colorSet.colorAuxiliary4.style(fontSize: 12),
                    )),
              ),
              const SliverToBoxAdapter(
                  child: SizedBox(
                height: 109,
              )),
              SliverToBoxAdapter(
                  child: GestureDetector(
                      onTap: () {
                        cubit.transfer();
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            color: appTheme.colorSet.colorDark),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(top: 14, bottom: 14),
                        child: Text(
                          AppLocalizations.of(context)!.confirmTransfer,
                          style: appTheme.colorSet.textWhite
                              .style(fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ))),
            ]);
          },
          listener: (BuildContext context, TransferState state) {
            if (state.success ?? false) {
              Navigator.pop(context);
            }
          },
        ));
  }

  Widget topChoose() {
    return Row(
      children: [
        const SizedBox(
          width: 15,
        ),
        Expanded(
            child: Column(
          children: [
            topChooseItem(
                type: AppLocalizations.of(context)!.from,
                title: cubit.state.sourceAssetType?.accountName ?? "--",
                subAccountQueryModel:
                    cubit.state.sourceAssetType ?? const SubAccountQueryModel(),
                canChoose: cubit.state.sourceAssetType?.canChoose ?? false),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 1,
              color: appTheme.colorSet.colorLight,
            ),
            const SizedBox(
              height: 16,
            ),
            GestureDetector(
              onTap: () {},
              child: topChooseItem(
                  type: AppLocalizations.of(context)!.to,
                  title: cubit.state.targetAssetType?.accountName ?? "--",
                  subAccountQueryModel: cubit.state.targetAssetType ??
                      const SubAccountQueryModel(),
                  canChoose: cubit.state.targetAssetType?.canChoose ?? false),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        )),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
            onTap: () {
              cubit.changeSelectAssetsType();
            },
            child: Image.asset(R.ASSETS_IMAGES_GROUP_49_PNG)),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  Widget topChooseItem({
    required String type,
    required String title,
    required bool canChoose,
    required SubAccountQueryModel subAccountQueryModel,
  }) {
    return GestureDetector(
        onTap: () {
          if (canChoose) {
            chooseAssetsType(
                cubit: cubit,
                context: context,
                title: AppLocalizations.of(context)!.account,
                list: cubit.state.accountList ?? [],
                subAccountQueryModel: subAccountQueryModel);
          }
        },
        child: Container(
            color: appTheme.colorSet.textWhite,
            child: Row(
              children: [
                Text(
                  type,
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: appTheme.colorSet.textBlack.style(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      cubit.state.tokenName ?? "USDT",
                      style: appTheme.colorSet.textGrey.style(fontSize: 12),
                    ),
                  ],
                ),
                const Spacer(),
                canChoose
                    ? Image.asset(R.ASSETS_IMAGES_DOWN_SMALL_LINE_PNG)
                    : const SizedBox()
              ],
            )));
  }

  Widget inputNum() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      // padding: const EdgeInsets.fromLTRB(40, 12, 16, 12),
      padding: const EdgeInsets.only(left: 16, right: 16),
      height: 44,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: appTheme.colorSet.colorLight),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: TextField(
            inputFormatters: [
              AmountInputFormatter(digit: 10),
            ],
            controller: controller,
            focusNode: focusNode,
            scrollPadding: EdgeInsets.zero,
            enableInteractiveSelection: true,
            onChanged: (e) {
              if (e.isEmpty) {
                cubit.upDateSlideValue("0");
                return;
              }
              if (double.parse(e) > double.parse(cubit.state.amount ?? "0")) {
                cubit.upDateSlideValue(cubit.state.amount ?? "0");
                controller.text = cubit.state.amount ?? "0";
              } else {
                cubit.upDateSlideValue(e);
              }
            },
            style: appTheme.colorSet.textBlack.style(),
            decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.quantity,
                isDense: true,
                hintStyle: appTheme.colorSet.textGrey2.style(),
                border: InputBorder.none),
          )),
          Text(
            "${cubit.state.tokenName ?? "USDT"} |",
            style: appTheme.colorSet.textGrey3.style(),
          ),
          GestureDetector(
              onTap: () {
                cubit.setAllValue();
                controller.text = cubit.state.amount ?? "";
              },
              child: Text(
                " ${AppLocalizations.of(context)!.all}",
                style: appTheme.colorSet.textBlack.style(),
              )),
        ],
      ),
    );
  }

  Widget sliderWidget() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: SfSliderTheme(
          data: SfSliderThemeData(
            activeTrackColor: appTheme.colorSet.colorPrimary,
            inactiveTrackColor: appTheme.colorSet.colorLight,
            thumbColor: Colors.transparent,
            thumbStrokeWidth: 0,
            overlayRadius: 0,
            activeTrackHeight: 6,
            inactiveTrackHeight: 6,
          ),
          child: SfSlider(
              thumbIcon: const Image(
                image: AssetImage(R.ASSETS_IMAGES_GROUP_41073_PNG),
                width: 40,
                height: 40,
                fit: BoxFit.fill,
              ),
              min: 0.0,
              max: 100.0,
              value: cubit.state.slideValue ?? 0,
              interval: 25,
              onChanged: (dynamic value) {
                setState(() {
                  cubit.upDatePriceValue(slideValue: value);
                  controller.text = cubit.state.priceText ?? "0";
                });
              })),
    );
  }
}
