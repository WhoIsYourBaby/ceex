import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/address/address_cubit.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/basic/basic_config_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/cubit/quote_tokens/quote_tokens_cubit.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/views/address/components/qr_view_example.dart';
import 'package:ceex_flutter/views/address/quote_tokens_view.dart';
import 'package:ceex_flutter/views/login/login_need_fa_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressAddView extends StatefulWidget {
  final cubit = AddressCubit();
  final VoidCallback didLogin;
  AddressAddView({required this.didLogin, super.key});

  static Route route({
    VoidCallback? didLogin,
  }) =>
      MaterialPageRoute(
          builder: ((context) => AddressAddView(
                didLogin: didLogin ?? () {},
              )));

  @override
  State<AddressAddView> createState() => _AddressAddViewState();
}

class _AddressAddViewState extends State<AddressAddView>
    with TickerProviderStateMixin {
  late AppTheme appTheme;
  late TabController _tabController;
  int tabIndex = 0;
  TextEditingController tokenController = TextEditingController();
  FocusNode tokenFocusNode = FocusNode();

  TextEditingController netController = TextEditingController();
  FocusNode netFocusNode = FocusNode();

  TextEditingController addressController = TextEditingController();
  FocusNode addressFocusNode = FocusNode();

  TextEditingController remarksController = TextEditingController();
  FocusNode remarksFocusNode = FocusNode();
  late BuildContext buildContext;
  bool showTokenNet = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 1);
  }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: AppBarCenterText(
            title: "新增地址",
          ),
        ),
        body: BlocBuilder<AddressCubit, AddressState>(
            bloc: widget.cubit,
            builder: (contextcubit, state) => Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                        top: 20,
                      ),
                      child: Row(
                        children: [
                          tab(),
                          // GestureDetector(
                          //     onTap: () {
                          //     },
                          //     child: Image.asset(
                          //       R.ASSETS_IMAGES_VECTOR_PNG,
                          //       width: 16,
                          //       height: 16,
                          //     ))
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: appTheme.colorSet.colorLight,
                    ),
                    Expanded(
                        child:
                            TabBarView(controller: _tabController, children: [
                      addViewChild(),
                      // addViewChild(),
                    ]))
                  ],
                )));
  }

  // tab
  Widget tab() {
    return TabBar(
        isScrollable: true,
        tabAlignment: TabAlignment.start,
        labelPadding: EdgeInsets.only(left: 15, right: 8, bottom: 10),
        indicatorColor: appTheme.colorSet.colorDark,
        indicatorSize: TabBarIndicatorSize.label,
        labelColor:
            context.read<AppconfCubit>().state.appTheme.colorSet.textBlack,
        unselectedLabelColor:
            context.read<AppconfCubit>().state.appTheme.colorSet.textGrey,
        unselectedLabelStyle: appTheme.colorSet.textBlack
            .style(fontSize: 16, fontWeight: FontWeight.w600),
        labelStyle: appTheme.colorSet.textGrey2
            .style(fontSize: 16, fontWeight: FontWeight.w600),
        controller: _tabController,
        onTap: (v) => setState(() {
              tabIndex = v;
            }),
        tabs: const [
          Text("普通地址"),
          // Text("通用地址"),
        ]);
  }

  Widget addViewChild() {
    return Padding(
        padding: EdgeInsets.only(top: 32, left: 15, right: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // shrinkWrap: true,
          // padding: EdgeInsets.only(top: 32, left: 15, right: 15),
          children: [
            Text(
              "币种类型",
              style: appTheme.colorSet.textBlack
                  .style(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            GestureDetector(
                onTap: () async {
                  var result = await Navigator.push(context,
                      QuoteTokensView.route(quoteType: QuoteType.token));
                  if (result != null) {
                    tokenController.text = result;
                    var list = context
                        .read<BasicConfigCubit>()
                        .state
                        .configModel!
                        .token!;
                    for (var element in list) {
                      if (element.tokenId == tokenController.text) {
                        if (element.chainTypes!.isEmpty) {
                          setState(() {
                            showTokenNet = false;
                          });
                        } else {
                          setState(() {
                            showTokenNet = true;
                          });
                        }
                        return;
                      }
                    }
                  }
                },
                child: addViewChilditem(
                    controller: tokenController,
                    focusNode: netFocusNode,
                    hintText: "请选择币种类型",
                    canUse: false,
                    quoteType: QuoteType.token,
                    rightIcon:
                        Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG))),
            const SizedBox(height: 32),
            showTokenNet
                ? Text(
                    "网络",
                    style: appTheme.colorSet.textBlack
                        .style(fontWeight: FontWeight.w500),
                  )
                : const SizedBox(),
            SizedBox(height: showTokenNet ? 12 : 0),
            showTokenNet
                ? GestureDetector(
                    onTap: () async {
                      if (tokenController.text.isEmpty) {
                        showMsg("请先选择币种类型");
                        return;
                      }
                      var result = await Navigator.push(
                          context,
                          QuoteTokensView.route(
                              quoteType: QuoteType.net,
                              tokenType: tokenController.text,
                              chainList: context
                                  .read<BasicConfigCubit>()
                                  .state
                                  .configModel!
                                  .token!));
                      if (result != null) {
                        netController.text = result;
                      }
                    },
                    child: addViewChilditem(
                        controller: netController,
                        focusNode: netFocusNode,
                        hintText: "请选择网络",
                        quoteType: QuoteType.net,
                        canUse: false,
                        rightIcon:
                            Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG)))
                : const SizedBox(),
            SizedBox(height: showTokenNet ? 32 : 0),
            Text(
              "地址",
              style: appTheme.colorSet.textBlack
                  .style(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            addViewChilditem(
                controller: addressController,
                focusNode: addressFocusNode,
                hintText: "请输入提现地址",
                rightIcon: screenQrCode()),
            const SizedBox(
              height: 32,
            ),
            Text(
              "备注",
              style: appTheme.colorSet.textBlack
                  .style(fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 12,
            ),
            addViewChilditem(
              controller: remarksController,
              focusNode: remarksFocusNode,
              hintText: "请输入备注地址",
            ),
            const Expanded(child: SizedBox()),
            GestureDetector(
                onTap: () {
                  if (tokenController.text.isEmpty) {
                    showMsg("请选择币种类型");
                    return;
                  }
                  if (netController.text.isEmpty && showTokenNet) {
                    showMsg("请选择网络");
                    return;
                  }
                  if (addressController.text.isEmpty) {
                    showMsg("请填写地址");
                    return;
                  }
                  if (remarksController.text.isEmpty) {
                    showMsg("请填写备注信息");
                    return;
                  }
                  final authCubit = context.read<AuthCubit>();
                  if (authCubit.userBaseInfo?.registerType == 1) {
                    Navigator.push(
                      context,
                      LoginNeedFa.route(
                          loginFaType: LoginFaType.addAddressPhone,
                          tokenText: tokenController.text,
                          netText: netController.text,
                          addressText: addressController.text,
                          remarksText: remarksController.text,
                          cubit: LoginViewCubit(authCubit: authCubit),
                          didLogin: widget.didLogin),
                    );
                  } else {
                    Navigator.push(
                      context,
                      LoginNeedFa.route(
                          loginFaType: LoginFaType.addAddressEmail,
                          tokenText: tokenController.text,
                          netText: netController.text,
                          addressText: addressController.text,
                          remarksText: remarksController.text,
                          cubit: LoginViewCubit(authCubit: authCubit),
                          didLogin: widget.didLogin),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: appTheme.colorSet.colorDark),
                  child: Text(
                    "提交",
                    style: appTheme.colorSet.textWhite
                        .style(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                )),
            const SizedBox(height: 50),
          ],
        ));
  }

  Widget addViewChilditem(
      {required TextEditingController controller,
      required FocusNode focusNode,
      required String hintText,
      QuoteType quoteType = QuoteType.token,
      bool canUse = true,
      Widget rightIcon = const SizedBox()}) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: appTheme.colorSet.colorLight),
      child: Row(
        children: [
          Expanded(
              child: textField(
                  controller, focusNode, hintText, canUse, quoteType)),
          rightIcon,
        ],
      ),
    );
  }

  Widget textField(TextEditingController textEditingController,
      FocusNode focusNode, String hintText, bool canUse, QuoteType quoteType) {
    return TextField(
      onTap: canUse
          ? null
          : () async {
              if (quoteType == QuoteType.token) {
                var result = await Navigator.push(
                    context,
                    QuoteTokensView.route(
                      quoteType: quoteType,
                    ));
                if (result != null) {
                  tokenController.text = result;
                  var list = context
                      .read<BasicConfigCubit>()
                      .state
                      .configModel!
                      .token!;
                  for (var element in list) {
                    if (element.tokenId == tokenController.text) {
                      if (element.chainTypes!.isEmpty) {
                        setState(() {
                          showTokenNet = false;
                        });
                      } else {
                        setState(() {
                          showTokenNet = true;
                        });
                      }
                      return;
                    }
                  }
                }
              } else {
                if (tokenController.text.isEmpty) {
                  showMsg("请先选择币种类型");
                  return;
                }
                var result = await Navigator.push(
                    context,
                    QuoteTokensView.route(
                        quoteType: quoteType,
                        tokenType: tokenController.text,
                        chainList: context
                            .read<BasicConfigCubit>()
                            .state
                            .configModel!
                            .token!));
                if (result != null) netController.text = result;
              }
            },
      controller: textEditingController,
      focusNode: focusNode,
      readOnly: !canUse,
      scrollPadding: EdgeInsets.zero,
      enableInteractiveSelection: true,
      onChanged: (e) {
        setState(() {});
      },
      style: appTheme.colorSet.textBlack.style(),
      decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          hintStyle: appTheme.colorSet.textGrey2.style(),
          border: InputBorder.none),
    );
  }

  Widget screenQrCode() {
    return GestureDetector(
      onTap: () async {
        var result = await Navigator.push(context, QRViewExample.route());
        if (result != null) {
          addressController.text = result;
        }
      },
      child: Image.asset(R.ASSETS_IMAGES_FRAMESCREEN_PNG),
    );
  }
}
