import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/model/address/add_address_model.dart';
import 'package:ceex_flutter/repository/address_repository.dart';
import 'package:ceex_flutter/utils/toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:oktoast/oktoast.dart';

/// 网络选择
class AddressSelectView extends StatefulWidget {
  final String? tokenId;
  final String? chainType;
  const AddressSelectView({
    this.tokenId,
    this.chainType,
    super.key,
  });

  static Route<AddAddressModel?> route(String? tokenId, String? chainType) =>
      ModalBottomSheetRoute(
        builder: (context) => AddressSelectView(
          tokenId: tokenId,
          chainType: chainType,
        ),
        isScrollControlled: false,
      );

  @override
  State<AddressSelectView> createState() => _AddressSelectViewState();
}

class _AddressSelectViewState extends State<AddressSelectView> {
  late AppTheme appTheme;

  List<AddAddressModel>? addressList;

  @override
  void initState() {
    final formData = FormData.fromMap({
      "token_id": widget.tokenId,
      "chain_type": widget.chainType,
    });
    showLoading();
    final repo = GetIt.I.get<AddressRepository>();
    repo.addressListByToken(formData).then((value) {
      dismissAllToast();
      setState(() {
        addressList = value.data;
      });
    }).onError((error, stackTrace) {
      dismissAllToast();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "选择地址",
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image.asset(R.ASSETS_IMAGES_CLOSE_LINE_PNG),
          )
        ],
      ),
      body: Container(
        constraints: BoxConstraints(minHeight: screenSize.height * 0.85),
        child: (addressList?.isEmpty ?? true)
            ? Center(
                child: Text(
                  "无地址可供选择",
                  style: appTheme.colorSet.textGrey.style(fontSize: 14),
                ),
              )
            : ListView(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                children: (addressList ?? [])
                    .map(
                      (e) => GestureDetector(
                        onTap: () {
                          Navigator.pop(context, e);
                        },
                        child: AddressItemCell(
                          addressModel: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    appTheme = context.read<AppconfCubit>().state.appTheme;
    super.didChangeDependencies();
  }
}

class AddressItemCell extends StatelessWidget {
  final AddAddressModel addressModel;
  final VoidCallback? onTap;
  const AddressItemCell({
    required this.addressModel,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "通用地址",
                      style: appTheme.colorSet.textBlack.style(fontSize: 16),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 7),
                      color: appTheme.colorSet.colorLight,
                      child: Text(
                        "${addressModel.chainType}",
                        style: appTheme.colorSet.textBlack.style(fontSize: 10),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "${addressModel.address}",
                  style: appTheme.colorSet.textGrey.style(fontSize: 11),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "${addressModel.remark}",
                  style: appTheme.colorSet.textBlack.style(),
                )
              ],
            ),
            GestureDetector(
              onTap: onTap,
              child: Image.asset(R.ASSETS_IMAGES_MORE_1_FILL_PNG),
            ),
          ],
        ));
  }
}
