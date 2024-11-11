import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/const/resource.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_cubit.dart';
import 'package:ceex_flutter/cubit/loginview/loginview_state.dart';
import 'package:ceex_flutter/model/publish/countries_model.dart';
import 'package:ceex_flutter/repository/publish_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';
import 'package:get_it/get_it.dart';

/// 区号选择
class AreaChoose extends StatefulWidget {
  const AreaChoose({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (context) => const AreaChoose());

  @override
  State<AreaChoose> createState() => _AreaChooseState();
}

class _AreaChooseState extends State<AreaChoose> {
  late LoginViewCubit loginViewCubit;
  TextEditingController textController = TextEditingController();
  final FocusNode textFocusNode = FocusNode();
  Dio dio = Dio();
  List<CountriesModel>? contriesValue = [];
  List<CountriesModel> filteredCountriesList = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loginViewCubit = BlocProvider.of<LoginViewCubit>(context);
    textController.addListener(
      () {
        setState(() {});
      },
    );
    getPasw();
  }

  getPasw() async {
    final repo = GetIt.I.get<PublishRepository>();
    final resp = repo.countries();
    resp.then((value) {
      setState(() {
        contriesValue = value.data;
        filteredCountriesList = contriesValue!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return BlocBuilder<LoginViewCubit, LoginViewState>(builder: (ctx, state) {
      return Scaffold(
        appBar: AppBarWrapper(
            statusBarColor: appTheme.colorSet.colorWhite,
            child: _buildAppBar(appTheme)),
        body: Container(
          color: appTheme.colorSet.colorLight,
          child: ListView.builder(
              itemCount: filteredCountriesList.length,
              itemBuilder: (context, index) =>
                  areaItems(context, index, appTheme)),
        ),
      );
    });
  }

  Widget _buildAppBar(AppTheme appTheme) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      margin: const EdgeInsets.only(top: 12, bottom: 12),
      height: 32,
      alignment: Alignment.center,
      child: Row(
        children: [
          Expanded(
              child: Container(
            height: 32,
            decoration: BoxDecoration(
                color: appTheme.colorSet.colorLight,
                borderRadius: BorderRadius.all(Radius.circular(16))),
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    onChanged: (value) {
                      loginViewCubit.inputConnect(
                        value,
                        LoginInputType.none,
                      );
                      List<CountriesModel> filteredCountries = contriesValue!
                          .where((element) =>
                              element.nationalCode!
                                  .toLowerCase()
                                  .contains(value) ||
                              element.countryName!
                                  .toLowerCase()
                                  .contains(value))
                          .toList();
                      setState(() {
                        filteredCountriesList = filteredCountries;
                      });
                    },
                    focusNode: textFocusNode,
                    scrollPadding: EdgeInsets.zero,
                    enableInteractiveSelection: true,
                    style: appTheme.colorSet.textBlack.style(),
                    decoration: InputDecoration(
                        hintText: "搜索国家或地区",
                        isDense: true,
                        hintStyle: appTheme.colorSet.textGrey2.style(),
                        border: InputBorder.none),
                  ),
                ),
                Image.asset(R.ASSETS_IMAGES_SEARCH_LINE_PNG),
              ],
            ),
          )),
          SizedBox(
            width: 19,
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              AppLocalizations.of(context)!.cancel,
              style: appTheme.colorSet.textBlack.style(),
            ),
          )
        ],
      ),
    );
  }

  Widget areaItems(BuildContext context, int index, AppTheme appTheme) {
    return GestureDetector(
        onTap: () {
          // context.read<LoginViewCubit>().upDataAreaCode(
          //     "+${filteredCountriesList[index].nationalCode!}");
          // Navigator.pop(context, filteredCountriesList[index].nationalCode!);
          Navigator.pop(context, filteredCountriesList[index]);
        },
        child: Container(
          padding: EdgeInsets.only(top: 16, bottom: 16, left: 16, right: 16),
          child: Row(
            children: [
              Expanded(
                  child: Text(
                filteredCountriesList[index].countryName!,
                style: appTheme.colorSet.textBlack.style(fontSize: 16),
              )),
              Text(
                "+${filteredCountriesList[index].nationalCode!}",
                style: appTheme.colorSet.textGrey.style(fontSize: 16),
              )
            ],
          ),
        ));
  }
}
