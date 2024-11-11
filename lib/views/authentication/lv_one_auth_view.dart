import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/authentication/authentication_cubit.dart';
import 'package:ceex_flutter/model/publish/countries_model.dart';
import 'package:ceex_flutter/views/authentication/components/authentication_dialog.dart';
import 'package:ceex_flutter/views/login/area_choose.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// LV2： 高级认证
class LvOneAuthView extends StatefulWidget {
  const LvOneAuthView({super.key});
  static Route route() =>
      MaterialPageRoute(builder: (context) => const LvOneAuthView());

  @override
  State<LvOneAuthView> createState() => _LvOneAuthViewState();
}

class _LvOneAuthViewState extends State<LvOneAuthView> {
  late AppTheme appTheme;
  final cubit = AuthenticationCubit();
  TextEditingController addressController = TextEditingController();
  FocusNode addressFocusNode = FocusNode();
  TextEditingController nameController = TextEditingController(); // 姓名 、 性
  FocusNode nameFocusNode = FocusNode();
  TextEditingController codeController = TextEditingController();
  FocusNode codeFocusNode = FocusNode();
  TextEditingController secondNameController = TextEditingController(); // 第二个名字
  FocusNode secondNameFocusNode = FocusNode();
  TextEditingController documentTypeController = TextEditingController();
  FocusNode documentTypeFocusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    addressController.addListener(() {
      setState(() {});
    });
    nameController.addListener(() {
      setState(() {});
    });
    codeController.addListener(() {
      setState(() {});
    });
    secondNameController.addListener(() {
      setState(() {});
    });
    secondNameFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
  }

  @override
  void dispose() {
    super.dispose();
    addressController.dispose();
    addressFocusNode.dispose();
    nameController.dispose();
    nameFocusNode.dispose();
    codeController.dispose();
    codeFocusNode.dispose();
    secondNameController.dispose();
    secondNameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: appTheme.colorSet.textWhite,
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: const AppBarCenterText(
            title: "Lv1：基础认证",
          ),
        ),
        body: BlocConsumer<AuthenticationCubit, AuthenticationState>(
          bloc: cubit,
          builder: (context, state) {
            return SafeArea(
                bottom: true,
                child: CustomScrollView(slivers: [
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 20,
                  )),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text("地址证明",
                        style: appTheme.colorSet.textBlack.style(fontSize: 14)),
                  )),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 12,
                  )),
                  SliverToBoxAdapter(
                      child: GestureDetector(
                    onTap: () async {
                      var result =
                          await Navigator.push(context, AreaChoose.route());
                      if (result != null) {
                        cubit.upDataNationality(
                            result as CountriesModel, addressController);
                      }
                    },
                    child: inputTextField(
                      addressController,
                      addressFocusNode,
                      enable: false,
                      showRight: true,
                    ),
                  )),
                  SliverToBoxAdapter(
                      child: titleType(
                          isShow: true,
                          text: state.shortName == "CN" ? "姓名" : "姓氏")),
                  SliverToBoxAdapter(
                      child: childInput(
                    isShow: true,
                    child: inputTextField(nameController, nameFocusNode,
                        onChanged: (p) {
                      cubit.upDataName(p);
                    }),
                  )),
                  SliverToBoxAdapter(
                      child: titleType(
                          isShow: state.shortName != "CN", text: "名字")),
                  SliverToBoxAdapter(
                      child: childInput(
                    isShow: state.shortName != "CN",
                    child: inputTextField(
                        secondNameController, secondNameFocusNode,
                        onChanged: (p) {
                      cubit.upDataSurName(p);
                    }),
                  )),
                  SliverToBoxAdapter(
                      child: titleType(
                          isShow: state.shortName != "CN", text: "证件类型")),
                  SliverToBoxAdapter(
                      child: GestureDetector(
                          onTap: () async {
                            var result = await documentTypeChoosePicType(
                                context: context);
                            if (result != null) {
                              cubit.upDocumentType(
                                  result as int, documentTypeController);
                            }
                          },
                          child: childInput(
                              isShow: state.shortName != "CN",
                              child: inputTextField(
                                documentTypeController,
                                documentTypeFocusNode,
                                enable: false,
                                showRight: true,
                              )))),
                  SliverToBoxAdapter(
                      child: titleType(
                          isShow: true,
                          text: state.shortName == "CN" ? "身份证号" : "证件号")),
                  SliverToBoxAdapter(
                      child: childInput(
                          isShow: true,
                          child: inputTextField(codeController, codeFocusNode,
                              onChanged: (p) {
                            cubit.upDataDocumentCode(p);
                          }))),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 100,
                  )),
                  SliverToBoxAdapter(
                      child: GestureDetector(
                          onTap: () {
                            cubit.kycBasicverify();
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100)),
                                color: appTheme.colorSet.colorDark),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.only(top: 14, bottom: 14),
                            margin: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "确认",
                              style: appTheme.colorSet.textWhite.style(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                          ))),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 30,
                  )),
                ]));
          },
          listener: (BuildContext context, AuthenticationState state) {
            if (state.requestSuccess ?? false) {
              Navigator.pop(context, true);
            }
          },
        ));
  }

  Widget titleType({required bool isShow, required String text}) {
    return isShow
        ? Padding(
            padding: const EdgeInsets.fromLTRB(15, 32, 15, 12),
            child: Text(text,
                style: appTheme.colorSet.textBlack.style(fontSize: 14)),
          )
        : const SizedBox();
  }

  Widget childInput({
    required bool isShow,
    required Widget child,
  }) {
    return isShow ? child : const SizedBox();
  }

  /// 输入框
  Widget inputTextField(
    TextEditingController textEditingController,
    FocusNode focusNode, {
    String hintText = "",
    bool enable = true,
    bool showRight = false,
    Function(String)? onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.only(left: 15, right: 15),
      height: 44,
      decoration: BoxDecoration(
          color: appTheme.colorSet.colorLight,
          borderRadius: BorderRadius.circular(4)),
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: textEditingController,
              enabled: enable,
              onChanged: onChanged,
              focusNode: focusNode,
              scrollPadding: EdgeInsets.zero,
              enableInteractiveSelection: true,
              style: appTheme.colorSet.textBlack.style(),
              decoration: InputDecoration(
                  hintText: hintText,
                  isDense: true,
                  hintStyle: appTheme.colorSet.textGrey2.style(),
                  border: InputBorder.none),
            ),
          ),
          showRight
              ? Image.asset(R.ASSETS_IMAGES_RIGHT_SMALL_LINE_PNG)
              : const SizedBox()
        ],
      ),
    );
  }
}
