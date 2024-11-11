import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/invitation/invitation_cubit.dart';
import 'package:ceex_flutter/model/invitation/invitation_relation_model.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/tools.dart';
import 'package:ceex_flutter/views/mine/components/setting_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyInvitationView extends StatefulWidget {
  final cubit = InvitationCubit();
  MyInvitationView({super.key}) {
    cubit.init();
  }

  static Route route() =>
      MaterialPageRoute(builder: (context) => MyInvitationView());

  @override
  State<MyInvitationView> createState() => _MyInvitationViewState();
}

class _MyInvitationViewState extends State<MyInvitationView> {
  late AppTheme appTheme;
  late Size screenSize;
  late InvitationState invitationState;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    invitationState = widget.cubit.state;
  }

  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    screenSize = MediaQuery.of(context).size;
    return BlocBuilder<InvitationCubit, InvitationState>(
      bloc: widget.cubit,
      builder: (context, state) {
        return Scaffold(
            appBar: AppBarWrapper(
              statusBarColor: appTheme.colorSet.colorWhite,
              child: SettingAppBar(
                title: "我的邀请",
                // rightChild: GestureDetector(
                //   onTap: () {
                //     showMsg("暂缓开通");
                //   },
                //   child: Text(
                //     "规则",
                //     style: appTheme.colorSet.textBlack.style(),
                //   ),
                // ),
              ),
            ),
            body: _body(state),
            bottomNavigationBar: _bottomView(state, context));
      },
    );
  }

  Widget _body(InvitationState state) {
    final bgSize =
        scaleSizeFromWidth(Size(287, 204), screenSize.width - 44 * 2);
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
            child: Center(
          child: Image.asset(
            R.ASSETS_IMAGES_MY_INVITATION_PIC_PNG,
            width: bgSize.width,
            height: bgSize.height,
            fit: BoxFit.fill,
          ),
        )),
        SliverToBoxAdapter(
            child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: appTheme.colorSet.colorLight),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "邀请总数",
                style: appTheme.colorSet.textGrey.style(fontSize: 12),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${state.infoModel?.inviteInfoDTO?.inviteCount ?? 0}",
                style: appTheme.colorSet.textBlack.style(fontSize: 24),
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 192,
                      child: Text("直接邀请",
                          style: appTheme.colorSet.textGrey
                              .style(fontSize: 12))), // 48+144
                  Expanded(
                      flex: 121,
                      child: Text("间接邀请",
                          style: appTheme.colorSet.textGrey
                              .style(fontSize: 12))) //48+89-16
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Expanded(
                      flex: 48 + 144,
                      child: Text(
                        "${state.infoModel?.inviteInfoDTO?.inviteDirectVaildCount ?? 0}",
                        style: appTheme.colorSet.textBlack.style(fontSize: 24),
                      )),
                  Expanded(
                      flex: 48 + 89 - 16,
                      child: Text(
                        "${state.infoModel?.inviteInfoDTO?.inviteIndirectVaildCount ?? 0}",
                        style: appTheme.colorSet.textBlack.style(fontSize: 24),
                      ))
                ],
              ),
            ],
          ),
        )),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 31,
          ),
        ),
        SliverToBoxAdapter(
          child: GestureDetector(
            onTap: () {
              // showMsg("暂缓开通");
            },
            child: Container(
              color: Colors.transparent,
              child: Row(
                children: [
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                      child: Text(
                    "返佣明细",
                    style: appTheme.colorSet.textBlack.style(fontSize: 18),
                  )),
                  // Image.asset(R.ASSETS_IMAGES_ARROWS_CHEVRON_CHEVRON_RIGHT_PNG),
                  SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(
            child: (state.relationModel?.data ?? []).isNotEmpty
                ? ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: (state.relationModel?.data ?? []).length,
                    itemBuilder: ((context, index) => Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            accountText(state.relationModel?.data?[index] ??
                                InvitationDataModel()),
                            registerDate(state.relationModel?.data?[index] ??
                                InvitationDataModel()),
                          ],
                        ))))
                : Container(
                    margin: const EdgeInsets.only(top: 70),
                    child: Image.asset(
                      R.ASSETS_IMAGES_NO_RECORD_PNG,
                      width: 60,
                      height: 60,
                    ),
                  )),
      ],
    );
  }

  Widget accountText(InvitationDataModel invitationDataModel) {
    String text = "";
    if (invitationDataModel.registerType == 1) {
      // 注册方式 手机注册
      text = invitationDataModel.mobile ?? "123123";
    } else {
      // 注册方式 邮箱注册
      text = invitationDataModel.email ?? "123123";
    }
    return Text(
      text,
      style: appTheme.colorSet.textBlack.style(),
    );
  }

  Widget registerDate(InvitationDataModel invitationDataModel) {
    String text = "";
    if (invitationDataModel.registerDate == "1") {
      // 注册方式 手机注册
      text = "直接邀请";
    } else {
      // 注册方式 邮箱注册
      text = "间接邀请";
    }
    return Text(
      text,
      style: appTheme.colorSet.textBlack.style(),
    );
  }

  Widget _bottomView(InvitationState state, BuildContext context) {
    return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: appTheme.colorSet.textGrey2.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, -4), // 阴影偏移量，可以根据需要调整
          ),
        ], color: appTheme.colorSet.textWhite),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 16, 15, 20),
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2),
                  color: appTheme.colorSet.colorLight),
              child: Row(
                children: [
                  Text(
                    "邀请码",
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                  const Expanded(child: SizedBox()),
                  Text(
                    state.infoModel?.inviteCode ?? "",
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(
                            text: state.infoModel?.inviteCode ?? ""));
                        showMsg("复制成功");
                      },
                      child: Image.asset(R.ASSETS_IMAGES_COPY_2_LINE_PNG))
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  Clipboard.setData(
                      ClipboardData(text: state.infoModel?.inviteCode ?? ""));
                  showMsg("复制成功");
                },
                child: Container(
                  height: 44,
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          width: 1, color: appTheme.colorSet.colorDark),
                      color: appTheme.colorSet.colorDark),
                  alignment: Alignment.center,
                  child: Text(
                    "马上邀请好友加入",
                    style: appTheme.colorSet.textWhite.style(fontSize: 12),
                  ),
                )),
            // Row(
            //   children: [
            //     SizedBox(
            //       width: 15,
            //     ),
            //     Expanded(
            //         flex: 1,
            //         child: GestureDetector(
            //             onTap: () {
            //               // widget.cubit.invitationTemplate().then(
            //               //     (value) => {shareTemp(context, value.data)});
            //               showMsg("暂缓开通");
            //             },
            //             child: Container(
            //               height: 44,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(100),
            //                   border: Border.all(
            //                       width: 1,
            //                       color: appTheme.colorSet.colorDark)),
            //               alignment: Alignment.center,
            //               child: Text(
            //                 "专属海报",
            //                 style:
            //                     appTheme.colorSet.textBlack.style(fontSize: 12),
            //               ),
            //             ))),
            //     SizedBox(
            //       width: 9,
            //     ),
            //     Expanded(
            //         flex: 1,
            //         child: GestureDetector(
            //             onTap: () {
            //               showMsg("暂缓开通");
            //             },
            //             child: Container(
            //               height: 44,
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(100),
            //                   border: Border.all(
            //                       width: 1, color: appTheme.colorSet.colorDark),
            //                   color: appTheme.colorSet.colorDark),
            //               alignment: Alignment.center,
            //               child: Text(
            //                 "马上邀请好友加入",
            //                 style:
            //                     appTheme.colorSet.textWhite.style(fontSize: 12),
            //               ),
            //             ))),
            //     SizedBox(
            //       width: 15,
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 30,
            ),
          ],
        ));
  }
}
