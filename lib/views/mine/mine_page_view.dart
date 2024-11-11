import 'package:ceex_flutter/announcement/announcement_view.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/components/common_webview.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/auth/auth_cubit.dart';
import 'package:ceex_flutter/cubit/home/announcement_cubit.dart';
import 'package:ceex_flutter/cubit/search_tokens/search_tokens_cubit.dart';
import 'package:ceex_flutter/model/appconfig/symbol_model.dart';
import 'package:ceex_flutter/utils/dio_manager.dart';
import 'package:ceex_flutter/utils/option_grid_view.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:ceex_flutter/utils/user_info_manager.dart';
import 'package:ceex_flutter/views/address/address_list_view.dart';
import 'package:ceex_flutter/views/assets/components/net_select_view.dart';
import 'package:ceex_flutter/views/assets/recharge/recharge_view.dart';
import 'package:ceex_flutter/views/assets/search_tokens/show_can_tran_tokens_view.dart';
import 'package:ceex_flutter/views/authentication/authentication_view.dart';
import 'package:ceex_flutter/views/feedback/feedback_view.dart';
import 'package:ceex_flutter/views/login/login_view_page.dart';
import 'package:ceex_flutter/views/mine/my_invitation_view.dart';
import 'package:ceex_flutter/views/mine/setting_view.dart';
import 'package:ceex_flutter/views/myrate/my_rate_view.dart';
import 'package:ceex_flutter/views/order/order_view.dart';
import 'package:ceex_flutter/views/root_tabbar.dart';
import 'package:ceex_flutter/views/safe/safe_center_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MinePageView extends StatefulWidget {
  static const String path = '/mine';
  final bool? isJumpThisPage;
  const MinePageView({super.key, this.isJumpThisPage});

  static Route route(bool isJumpThisPage) => MaterialPageRoute(
        builder: (context) => MinePageView(
          isJumpThisPage: isJumpThisPage,
        ),
        settings: const RouteSettings(name: MinePageView.path),
      );

  @override
  State<MinePageView> createState() => _MinePageViewState();
}

enum MineType {
  safeCenter,
  notice,
  help,
  workOrder,
  invite,
  address,
  rate,
  order,
  feedback,
  other,
}

class _MinePageViewState extends State<MinePageView> {
  late AppTheme appTheme;
  late Size screenSize;
  final cubit = AuthCubit();

  final List userServiceChildList = [
    {
      "pic": R.ASSETS_IMAGES_SAFETY_CERTIFICATE_LINE_PNG,
      "text": "安全中心",
      "type": MineType.safeCenter
    },
    {
      "pic": R.ASSETS_IMAGES_HORN_2_LINE_PNG,
      "text": "公告",
      "type": MineType.notice
    },
    {
      "pic": R.ASSETS_IMAGES_QUESTION_LINE_PNG,
      "text": "帮助中心",
      "type": MineType.help
    },
    {
      "pic": R.ASSETS_IMAGES_TOOL_LINE_PNG,
      "text": "提交工单",
      "type": MineType.workOrder
    },
    {
      "pic": R.ASSETS_IMAGES_MY_INVITE_PNG,
      "text": "我的邀请",
      "type": MineType.invite
    },
    {
      "pic": R.ASSETS_IMAGES_LINK_2_LINE_PNG,
      "text": "地址簿",
      "type": MineType.address
    },
    {
      "pic": R.ASSETS_IMAGES_SALE_LINE_PNG,
      "text": "我的费率",
      "type": MineType.rate
    },
    {
      "pic": R.ASSETS_IMAGES_FEEDBACK_PNG,
      "text": "意见反馈",
      "type": MineType.feedback
    },
  ];

  final List myOrderChildList = [
    {"pic": R.ASSETS_IMAGES_BB_MONEY_PNG, "text": "币币", "type": MineType.order},
    // {"pic": R.ASSETS_IMAGES_LEVER_PNG, "text": "杠杆", "type": MineType.other},
    // {
    //   "pic": R.ASSETS_IMAGES_SUSTAINABLE_PNG,
    //   "text": "永续合约",
    //   "type": MineType.other
    // },
    // {
    //   "pic": R.ASSETS_IMAGES_LEGAL_MONEY_PNG,
    //   "text": "法币",
    //   "type": MineType.other
    // },
  ];

  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite, child: topSetting()),
      body: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        return Container(
            child: CustomScrollView(
          slivers: [
            // 个人信息
            SliverToBoxAdapter(child: personalInformation(state)),
            const SliverToBoxAdapter(child: SizedBox(height: 11)),
            SliverToBoxAdapter(
                child: state.userBaseInfo == null
                    ? const SizedBox()
                    : GestureDetector(
                        onTap: () async {
                          await Navigator.push(
                                  context, AuthenticationView.route())
                              .then((value) async{
                              context.read<AuthCubit>().requestUserBaseInfo();
                          });
                        },
                        child: Container(
                            alignment: Alignment.topLeft,
                            margin: const EdgeInsets.only(left: 83),
                            height: 21,
                            width: 57,
                            child: (state.userBaseInfo?.kycVerifyStatus ?? 0) ==
                                    0
                                ? Image.asset(R.ASSETS_IMAGES_GROUP_41409_PNG,
                                    height: 21, width: 57, fit: BoxFit.contain)
                                : Image.asset(
                                    R.ASSETS_IMAGES_KYC_AUTHER_PNG,
                                    height: 21,
                                    width: 57,
                                    fit: BoxFit.contain,
                                  )))),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // 个人信息下面的两个按钮
            SliverToBoxAdapter(child: serviceButton()),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // 常用服务
            SliverToBoxAdapter(
                child:
                    useService(title: "常用服务", itemList: userServiceChildList)),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 24,
            )),
            // 我的订单
            SliverToBoxAdapter(
                child: useService(title: "我的订单", itemList: myOrderChildList)),
            const SliverToBoxAdapter(child: SizedBox(height: 24)),
            // 底部客服
            SliverToBoxAdapter(child: customerService()),
            const SliverToBoxAdapter(
                child: SizedBox(
              height: 10,
            )),
          ],
        ));
      }),
    );
  }

  // 顶部设置
  Widget topSetting() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // GestureDetector(
          //     onTap: () {
          //       showMsg("暂缓开通");
          //     },
          //     child: Image.asset(R.ASSETS_IMAGES_MOON_FOG_LINE_PNG)),
          // const SizedBox(
          //   width: 20,
          // ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, SettingView.route());
            },
            child: Image.asset(R.ASSETS_IMAGES_SETTINGS_1_LINE_PNG),
          ),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }

  // 个人信息
  Widget personalInformation(AuthState state) {
    return GestureDetector(
        onTap: () async {
          if (!UserInfoManager.shared.isLogin) {
            Navigator.push(context, LoginViewPage.route(
              didLogin: () async {
                if (widget.isJumpThisPage ?? false) {
                  if (UserInfoManager.shared.isLogin) {
                    if (Navigator.of(context).canPop()) {
                      Navigator.popUntil(context, (route) {
                        return route.settings.name == MinePageView.path;
                      });
                    }
                    await context.read<AuthCubit>().requestUserBaseInfo();
                  }
                } else {
                  if (UserInfoManager.shared.isLogin) {
                    if (Navigator.of(context).canPop()) {
                      Navigator.popUntil(context, (route) {
                        return route.settings.name == RootTabBar.path;
                      });
                    }
                    await context.read<AuthCubit>().requestUserBaseInfo();
                  }
                }
              },
            ));
          }
        },
        child: Container(
            color: appTheme.colorSet.textWhite,
            child: Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Image.asset(
                  R.ASSETS_IMAGES_AVATAR_LOGIN_PNG,
                  height: 58,
                  width: 58,
                ),
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                    height: 58,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        Row(
                          children: [
                            // Text(
                            //   state.userBaseInfo == null
                            //       ? "未登录"
                            //       : state.userBaseInfo?.registerType == 1
                            //           ? state.userBaseInfo?.mobile ?? "未登录"
                            //           : state.userBaseInfo?.email ?? "未登录",
                            //   style: appTheme.colorSet.colorDark.style(fontSize: 20,fontWeight: FontWeight.w600),
                            // ),
                            Text(
                              UserInfoManager.shared.isLogin
                                  ? state.userBaseInfo?.registerType == 1
                                      ? state.userBaseInfo?.mobile ?? "未登录"
                                      : state.userBaseInfo?.email ?? "未登录"
                                  : "未登录",
                              style: appTheme.colorSet.colorDark.style(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            Image.asset(R.ASSETS_IMAGES_GROUP_41428_PNG)
                          ],
                        ),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              Clipboard.setData(ClipboardData(
                                  text: UserInfoManager
                                          .shared.userBaseInfoModel?.userId ??
                                      ""));
                              showMsg("复制成功");
                            },
                            child: Row(
                              children: [
                                Text(
                                  "UID: ${state.userBaseInfo?.userId ?? ""}",
                                  style: appTheme.colorSet.textGrey
                                      .style(fontSize: 12),
                                ),
                                Image.asset(R.ASSETS_IMAGES_COPY_2_LINE_PNG)
                              ],
                            )),
                      ],
                    )),
                const Expanded(child: SizedBox()),
                UserInfoManager.shared.isLogin
                    ? SizedBox()
                    : Container(
                        child: Image.asset(
                            R.ASSETS_IMAGES_ARROWS_CHEVRON_CHEVRON_RIGHT_PNG),
                      ),
                SizedBox(
                  width: UserInfoManager.shared.isLogin ? 0 : 15,
                ),
              ],
            )));
  }

  // 个人信息下面的两个按钮
  // Widget serviceButton() {
  //   return Container(
  //     child: Row(
  //       children: [
  //         const SizedBox(
  //           width: 15,
  //         ),
  //         Expanded(
  //             flex: 1,
  //             child: AspectRatio(
  //                 aspectRatio: 168 / 70,
  //                 child: GestureDetector(
  //                     onTap: () {
  //                       showMsg("暂缓开通");
  //                     },
  //                     child: Image.asset(
  //                       R.ASSETS_IMAGES_GROUP_41415_PNG,
  //                       fit: BoxFit.fill,
  //                     )))),
  //         const SizedBox(
  //           width: 15,
  //         ),
  //         Expanded(
  //             flex: 1,
  //             child: AspectRatio(
  //                 aspectRatio: 168 / 70,
  //                 child: GestureDetector(
  //                     onTap: () {
  //                       showMsg("暂缓开通");
  //                     },
  //                     child: Image.asset(R.ASSETS_IMAGES_GROUP_41417_PNG,
  //                         fit: BoxFit.fill)))),
  //         const SizedBox(
  //           width: 15,
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // 个人信息下面的两个按钮
  Widget serviceButton() {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: appTheme.colorSet.textWhite,
          border: Border.all(color: appTheme.colorSet.colorLight, width: 1)),
      child: Row(
        children: [
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    if (!UserInfoManager.shared.isLogin) {
                      Navigator.push(context, LoginViewPage.route(
                        didLogin: () async {
                          if (widget.isJumpThisPage ?? false) {
                            if (UserInfoManager.shared.isLogin) {
                              if (Navigator.of(context).canPop()) {
                                Navigator.popUntil(context, (route) {
                                  return route.settings.name ==
                                      MinePageView.path;
                                });
                              }
                              await context
                                  .read<AuthCubit>()
                                  .requestUserBaseInfo();
                            }
                          } else {
                            if (UserInfoManager.shared.isLogin) {
                              if (Navigator.of(context).canPop()) {
                                Navigator.popUntil(context, (route) {
                                  return route.settings.name == RootTabBar.path;
                                });
                              }
                              await context
                                  .read<AuthCubit>()
                                  .requestUserBaseInfo();
                            }
                          }
                        },
                      ));
                    } else {
                      Navigator.push(context, MyInvitationView.route());
                    }
                  },
                  child: Container(
                      padding:
                          const EdgeInsets.only(left: 16, top: 20, bottom: 20),
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Image.asset(R.ASSETS_IMAGES_MINING_CENTER_PNG,
                              width: 38, height: 38),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "邀请中心",
                            style: appTheme.colorSet.textBlack
                                .style(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset(
                            R.ASSETS_IMAGES_RIGHT_LINE_ICON_PNG,
                            width: 38,
                            height: 38,
                          ),
                        ],
                      )))),
          Expanded(
              child: GestureDetector(
                  onTap: () {
                    if (!UserInfoManager.shared.isLogin) {
                      Navigator.push(context, LoginViewPage.route(
                        didLogin: () async {
                          if (widget.isJumpThisPage ?? false) {
                            if (UserInfoManager.shared.isLogin) {
                              if (Navigator.of(context).canPop()) {
                                Navigator.popUntil(context, (route) {
                                  return route.settings.name ==
                                      MinePageView.path;
                                });
                              }
                              await context
                                  .read<AuthCubit>()
                                  .requestUserBaseInfo();
                            }
                          } else {
                            if (UserInfoManager.shared.isLogin) {
                              if (Navigator.of(context).canPop()) {
                                Navigator.popUntil(context, (route) {
                                  return route.settings.name == RootTabBar.path;
                                });
                              }
                              await context
                                  .read<AuthCubit>()
                                  .requestUserBaseInfo();
                            }
                          }
                        },
                      ));
                    } else {
                      Navigator.push(
                          context,
                          ShowCanTranTokensView.route((model) {
                            if ((model.chainTypes ?? []).isEmpty) {
                              // 可充值的币种下没有网络可供选择
                              Navigator.push(
                                  context,
                                  RechargeView.route(
                                      tokenId: model.tokenId ?? "",
                                      chainType: const ChainTypesModel(),
                                      chainTypes: model.chainTypes ?? []));
                            } else {
                              Navigator.push(context,
                                      NetSelectView.route(model.chainTypes!))
                                  .then((value) {
                                if (value != null) {
                                  Navigator.push(
                                      context,
                                      RechargeView.route(
                                          tokenId: model.tokenId ?? "",
                                          chainType: value,
                                          chainTypes: model.chainTypes ?? []));
                                }
                              });
                            }
                          },
                              showCanTranTokensType:
                                  ShowCanTranTokensType.recharge));
                    }
                  },
                  child: Container(
                      padding:
                          const EdgeInsets.only(right: 16, top: 20, bottom: 20),
                      color: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset(
                            R.ASSETS_IMAGES_BROKER_CENTER_PNG,
                            width: 38,
                            height: 38,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            "充币",
                            style: appTheme.colorSet.textBlack
                                .style(fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          Image.asset(
                            R.ASSETS_IMAGES_RIGHT_LINE_ICON_PNG,
                            width: 38,
                            height: 38,
                          ),
                        ],
                      )))),
        ],
      ),
    );
  }

  // 我的订单
  Widget useService({
    required String title,
    required List itemList,
  }) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      padding: const EdgeInsets.fromLTRB(15, 24, 15, 24),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 1, color: appTheme.colorSet.colorLight)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
              title,
              style: appTheme.colorSet.textBlack
                  .style(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          OptionGridView(
              itemCount: itemList.length,
              rowCount: 4,
              itemWidth: 56,
              itemBuilder: (context, index) =>
                  userServiceChild(itemList, index)),
        ],
      ),
    );
  }

  // 常用服务item
  Widget userServiceChild(List itemList, int index) {
    return GestureDetector(
        onTap: () => click(itemList[index]['type']),
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          width: 56,
          child: Column(
            children: [
              Container(
                height: 38,
                width: 38,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: appTheme.colorSet.colorLight),
                child: Image.asset(itemList[index]['pic']),
              ),
              const SizedBox(
                height: 4,
              ),
              Text(
                itemList[index]['text'],
                style: appTheme.colorSet.textBlack.style(),
              ),
            ],
          ),
        ));
  }

  // 底部客服
  Widget customerService() {
    return Container(
        margin: const EdgeInsets.only(left: 15, right: 15),
        padding: const EdgeInsets.fromLTRB(15, 24, 15, 24),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            border: Border.all(width: 1, color: appTheme.colorSet.colorLight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "我们随时为您服务!",
              style: appTheme.colorSet.colorDark
                  .style(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 17,
            ),
            Row(
              children: [
                Image.asset(R.ASSETS_IMAGES_CUSTOMER_SERVICE_PNG),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  "Hellokitty",
                  style: appTheme.colorSet.textBlack.style(),
                ),
                const Expanded(child: SizedBox()),
                Text(
                  "您的专属客户经理",
                  style: appTheme.colorSet.textGrey.style(fontSize: 12),
                )
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              height: 1,
              color: appTheme.colorSet.colorLight,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: BoxDecoration(
                  color: appTheme.colorSet.colorLight,
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              child: Row(
                children: [
                  Image.asset(R.ASSETS_IMAGES_MAIL_LINE_PNG),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "service@ceex.com",
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: "service@ceex.com"));
                        showMsg("复制成功");
                      },
                      child: Image.asset(R.ASSETS_IMAGES_COPY_3_LINE_PNG))
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
              decoration: BoxDecoration(
                  color: appTheme.colorSet.colorLight,
                  borderRadius: const BorderRadius.all(Radius.circular(4))),
              child: Row(
                children: [
                  Image.asset(R.ASSETS_IMAGES_TELEGRAM_PNG),
                  const SizedBox(
                    width: 6,
                  ),
                  Text(
                    "ceexoffice",
                    style: appTheme.colorSet.textBlack.style(),
                  ),
                  const Expanded(child: SizedBox()),
                  GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: "ceexoffice"));
                        showMsg("复制成功");
                      },
                      child: Image.asset(R.ASSETS_IMAGES_COPY_3_LINE_PNG))
                ],
              ),
            ),
          ],
        ));
  }

  click(MineType mineType) async {
    switch (mineType) {
      case MineType.safeCenter:
        if (!UserInfoManager.shared.isLogin) {
          Navigator.push(context, LoginViewPage.route(
            didLogin: () async {
              if (widget.isJumpThisPage ?? false) {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == MinePageView.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              } else {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == RootTabBar.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              }
            },
          ));
        } else {
          Navigator.push(context, SafeCenterView.route());
        }
        break;
      case MineType.notice:
        final cubit = AnnouncementCubit();
        cubit.requestAnnouncement();
        Navigator.push(context, AnnouncementView.route(cubit));
        break;
      case MineType.help:
        // https://ceexglobal.zendesk.com/
        Navigator.push(
          context,
          CommonWebvView.route(
              "https://ceexglobal.zendesk.com/hc/zh-cn/categories/27476592835737-%E5%B8%B8%E8%A7%81%E9%97%AE%E9%A2%98",
              "帮助中心"),
        );
        break;
      case MineType.workOrder:
        Navigator.push(
          context,
          CommonWebvView.route(
              "https://ceexglobal.zendesk.com/hc/zh-cn/requests/new", "提交工单"),
        );
        break;
      case MineType.invite:
        if (!UserInfoManager.shared.isLogin) {
          Navigator.push(context, LoginViewPage.route(
            didLogin: () async {
              if (widget.isJumpThisPage ?? false) {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == MinePageView.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              } else {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == RootTabBar.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              }
            },
          ));
        } else {
          Navigator.push(context, MyInvitationView.route());
        }
        break;
      case MineType.address:
        if (!UserInfoManager.shared.isLogin) {
          Navigator.push(context, LoginViewPage.route(
            didLogin: () async {
              if (widget.isJumpThisPage ?? false) {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == MinePageView.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              } else {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == RootTabBar.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              }
            },
          ));
        } else {
          Navigator.push(context, AddressListView.route());
        }

        break;
      case MineType.rate:
        if (!UserInfoManager.shared.isLogin) {
          Navigator.push(context, LoginViewPage.route(
            didLogin: () async {
              if (widget.isJumpThisPage ?? false) {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == MinePageView.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              } else {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == RootTabBar.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              }
            },
          ));
        } else {
          Navigator.push(context, MyRateView.route());
        }

        break;
      case MineType.order:
        if (!UserInfoManager.shared.isLogin) {
          Navigator.push(context, LoginViewPage.route(
            didLogin: () async {
              if (widget.isJumpThisPage ?? false) {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == MinePageView.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              } else {
                if (UserInfoManager.shared.isLogin) {
                  if (Navigator.of(context).canPop()) {
                    Navigator.popUntil(context, (route) {
                      return route.settings.name == RootTabBar.path;
                    });
                  }
                  await context.read<AuthCubit>().requestUserBaseInfo();
                }
              }
            },
          ));
        } else {
          Navigator.push(context, OrderView.route());
        }
        break;
      case MineType.feedback:
        Navigator.push(context, FeedBackView.route());
        // Navigator.push(
        //   context,
        //   CommonWebvView.route(
        //       "https://ceexglobal.zendesk.com/hc/zh-cn/requests/new", "意见反馈"),
        // ).then((value) {
        //   showMsg("反馈成功，我们会在24小时内处理您的反馈！");
        // });
        break;
      default:
        showMsg("暂缓开通");
        break;
    }
  }
}
