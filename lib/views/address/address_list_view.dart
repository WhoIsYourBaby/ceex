import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/components/icon_widget.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/address/address_cubit.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/views/address/address_add_view.dart';
import 'package:ceex_flutter/views/address/components/address_net_choose_dialog.dart';
import 'package:ceex_flutter/views/address/components/address_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressListView extends StatefulWidget {
  static const String path = '/addresslistview';
  final cubit = AddressCubit();

  AddressListView({super.key}) {
    cubit.requiredAddressAllList();
    cubit.requiredAllType(); // 请求类型
    cubit.requiredAllBB(); // 请求币种
  }

  static Route route() => MaterialPageRoute(
        builder: ((context) => AddressListView()),
        settings: const RouteSettings(name: AddressListView.path),
      );

  @override
  State<AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  @override
  void initState() {
    super.initState();
  }

  late AppTheme appTheme;
  @override
  Widget build(BuildContext context) {
    appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
        appBar: AppBarWrapper(
          statusBarColor: appTheme.colorSet.colorWhite,
          child: AppBarCenterText(
            title: "地址管理",
            rigetWidget: IconWidget(
              icon: Image.asset(
                R.ASSETS_IMAGES_EDIT_3_LINE_PNG,
              ),
              onTap: () {
                Navigator.push(context, AddressAddView.route(didLogin: () {
                  Navigator.popUntil(context, (route) {
                    return route.settings.name == AddressListView.path;
                  });
                  widget.cubit.requiredAddressAllList();
                }));
              },
            ),
          ),
        ),
        body: BlocBuilder<AddressCubit, AddressState>(
            bloc: widget.cubit,
            builder: (contextcubit, state) => Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        _selectType1(
                            title: state.netAddress ?? "全部类型",
                            onTap: () {
                              addressNetChooseDialog(
                                  context: contextcubit,
                                  netItem: state.netAddressList,
                                  addressCubit: widget.cubit,
                                  topType: TopType.net);
                            }),
                        const SizedBox(width: 32),
                        _selectType1(
                            title: state.bbType ?? "全部币种",
                            onTap: () {
                              addressNetChooseDialog(
                                  context: contextcubit,
                                  bbItem: state.bbTypeList,
                                  addressCubit: widget.cubit,
                                  topType: TopType.bb);
                            })
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Expanded(child: buildList(state))
                  ],
                )));
  }

  Widget _selectType1({required String title, required Function()? onTap}) {
    return GestureDetector(
        onTap: onTap,
        child: Row(
          children: [
            Text(
              title,
              style: appTheme.colorSet.textBlack.style(),
            ),
            const SizedBox(
              width: 4,
            ),
            RotatedBox(
                quarterTurns: 1,
                child: Image.asset(
                    R.ASSETS_IMAGES_ARROWS_CHEVRON_CHEVRON_RIGHT_PNG)),
          ],
        ));
  }

  Widget buildList(AddressState state) {
    return ListView.separated(
      itemCount: state.addressList?.length ?? 0,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      itemBuilder: (context, index) => AddressViewItem(
        addressState: state,
        index: index,
        deleteAddress: () {
          print("object");
          widget.cubit.deleteAddress(int.parse(state.addressList![index].id ?? "0"));
        },
      ),
      separatorBuilder: (BuildContext context, int index) => Container(
        height: 1,
        color: appTheme.colorSet.colorLight,
      ),
    );
  }
}
