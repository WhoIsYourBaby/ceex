import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/**
 * 委托tab
 */

class EntrustView extends StatefulWidget {
  const EntrustView({super.key});

  @override
  State<EntrustView> createState() => _EntrustViewState();
}

class _EntrustViewState extends State<EntrustView> with TickerProviderStateMixin{
  late TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(vsync: this, length: 2);
  }
  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return TabBar(
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              labelPadding: EdgeInsets.only(right: 32, bottom: 10),
              labelColor: context.read<AppconfCubit>().state.appTheme.colorSet.textBlack,
              unselectedLabelColor:
                  context.read<AppconfCubit>().state.appTheme.colorSet.textGrey,
              controller: _tabController,
              padding: EdgeInsets.only(left: 15),
              unselectedLabelStyle: appTheme.colorSet.textBlack.style(fontSize: 16, fontWeight: FontWeight.w600),
              labelStyle: appTheme.colorSet.textGrey2.style(fontSize: 16, fontWeight: FontWeight.w600),
              tabs: [
                Text(AppLocalizations.of(context)!.contractViewBB),
                Text(AppLocalizations.of(context)!.contractViewLT)
                // InkWell(child:  Text(AppLocalizations.of(context)!.loginSignViewEmail), onTap: () {},),
                // InkWell(child:  Text(AppLocalizations.of(context)!.loginSignViewPhone), onTap: () {},),
              ]);
  }
}