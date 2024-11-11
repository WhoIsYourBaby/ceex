import 'dart:io';

import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/authentication/authentication_cubit.dart';
import 'package:ceex_flutter/views/authentication/components/authentication_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

/// LV2： 高级认证
class LvTwoAuthView extends StatefulWidget {
  const LvTwoAuthView({super.key});
  static Route route() =>
      MaterialPageRoute(builder: (context) => const LvTwoAuthView());

  @override
  State<LvTwoAuthView> createState() => _LvTwoAuthViewState();
}

class _LvTwoAuthViewState extends State<LvTwoAuthView> {
  late AppTheme appTheme;
  final cubit = AuthenticationCubit();
  final ImagePicker picker = ImagePicker();
  XFile? imageFile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appTheme = context.watch<AppconfCubit>().state.appTheme;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: appTheme.colorSet.textWhite,
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: const AppBarCenterText(
            title: "Lv2 高级认证",
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
                      child: Text("本人有效证件正面照片",
                          style:
                              appTheme.colorSet.textBlack.style(fontSize: 14)),
                    )),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 12,
                    )),
                    SliverToBoxAdapter(
                        child: GestureDetector(
                            onTap: () async {
                              var result = await authenticationChoosePicType(
                                  context: context);
                              if (result != null) {
                                positiveTake(result);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appTheme.colorSet.colorLight),
                              width: screenSize.width - 30,
                              height: (screenSize.width - 30) / 1.83,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: state.fontImagePath == null
                                  ? Image.asset(
                                      R.ASSETS_IMAGES_FONT_PIC_PNG,
                                    )
                                  : Image.file(
                                      File(state.fontImagePath ?? ""),
                                      width: screenSize.width - 30,
                                      height: (screenSize.width - 30) / 1.83,
                                      fit: BoxFit.contain,
                                    ),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 10,
                    )),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "请您上传一张有效证件正面照，并确保内容清晰可见",
                              style: appTheme.colorSet.textGrey
                                  .style(fontSize: 14,),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 40,
                    )),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "本人手持有效证件正面照片",
                              style: appTheme.colorSet.textBlack
                                  .style(fontSize: 14),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 12,
                    )),
                    SliverToBoxAdapter(
                        child: GestureDetector(
                            onTap: () async {
                              var result = await authenticationChoosePicType(
                                  context: context);
                              if (result != null) {
                                negativeTake(result);
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: appTheme.colorSet.colorLight),
                              width: screenSize.width - 30,
                              height: (screenSize.width - 30) / 1.83,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: state.rearImagePath == null
                                  ? Image.asset(
                                      R.ASSETS_IMAGES_REAR_PNG,
                                    )
                                  : Image.file(
                                      File(state.rearImagePath ?? ""),
                                      width: screenSize.width - 30,
                                      height: (screenSize.width - 30) / 1.83,
                                      fit: BoxFit.contain,
                                    ),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 10,
                    )),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "请您上传手持有效证件正面照，请确保内容清晰可见",
                              style: appTheme.colorSet.textGrey
                                  .style(fontSize: 14),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 5,
                    )),
                    SliverToBoxAdapter(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              "注明：姓名、交易所名称、申请日期",
                              style: appTheme.colorSet.textGrey
                                  .style(fontSize: 14),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 12,
                    )),
                    SliverToBoxAdapter(
                        child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset(R.ASSETS_IMAGES_CHECK_CIRCLE_LINE_P_PNG),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "头像清晰",
                          style:
                              appTheme.colorSet.textBlack.style(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 32,
                        ),
                        Image.asset(R.ASSETS_IMAGES_CHECK_CIRCLE_LINE_P_PNG),
                        const SizedBox(
                          width: 6,
                        ),
                        Text(
                          "有效证件清晰",
                          style:
                              appTheme.colorSet.textBlack.style(fontSize: 12),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    )),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 103,
                    )),
                    SliverToBoxAdapter(
                        child: Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Image.asset(
                          R.ASSETS_IMAGES_WARNING_ICON_PNG,
                          color: appTheme.colorSet.textBlack,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Expanded(
                            child: Text(
                          "照片清晰、照片小于10M、照片格式:jpg、png、jpeg",
                          style:
                              appTheme.colorSet.textBlack.style(fontSize: 12),
                        )),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    )),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 16,
                    )),
                    SliverToBoxAdapter(
                        child: GestureDetector(
                            onTap: () {
                              cubit.kycPhotoVerify();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100)),
                                  color: appTheme.colorSet.colorDark),
                              alignment: Alignment.center,
                              padding:
                                  const EdgeInsets.only(top: 14, bottom: 14),
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Text(
                                "提交",
                                style: appTheme.colorSet.textWhite.style(
                                    fontSize: 16, fontWeight: FontWeight.w600),
                              ),
                            ))),
                    const SliverToBoxAdapter(
                        child: SizedBox(
                      height: 30,
                    )),
                  ]));
            }, listener: (BuildContext context, AuthenticationState state) { 
              if(state.requestSuccess ?? false){
                Navigator.pop(context,true);
              }
             },));
  }

  positiveTake(int result) {
    if (result == 1) {
      // 拍照
      cubit.pickImageCamera(picType: PicType.font);
    } else if (result == 2) {
      // 相册
      cubit.pickImageGallery(picType: PicType.font);
    }
  }

  negativeTake(int result) {
    if (result == 1) {
      cubit.pickImageCamera(picType: PicType.rear);
      // 拍照
    } else if (result == 2) {
      // 相册
      cubit.pickImageGallery(picType: PicType.rear);
    }
  }
}
