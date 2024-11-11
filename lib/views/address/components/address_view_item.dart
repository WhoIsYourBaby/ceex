import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/address/address_cubit.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressViewItem extends StatelessWidget {
  final AddressState addressState;
  final int index;
  final VoidCallback? deleteAddress;
  const AddressViewItem(
      {required this.addressState,
      required this.index,
      required this.deleteAddress,
      super.key});

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Padding(
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
                        "${addressState.addressList![index].chainType}",
                        style: appTheme.colorSet.textBlack.style(fontSize: 10),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "${addressState.addressList![index].address}",
                  style: appTheme.colorSet.textGrey.style(fontSize: 11),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "${addressState.addressList![index].remark}",
                  style: appTheme.colorSet.textBlack.style(),
                )
              ],
            ),
            IconButton(onPressed: deleteAddress, icon: const Icon(Icons.delete_outline_outlined))
            // GestureDetector(
            //   onTap: () {},
            //   child: Icon,
            // )
          ],
        ));
  }
}
