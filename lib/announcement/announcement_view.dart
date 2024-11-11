import 'package:ceex_flutter/components/common_webview.dart';
import 'package:ceex_flutter/components/news_cell.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/cubit/home/announcement_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnnouncementView extends StatelessWidget {
  final AnnouncementCubit cubit;
  AnnouncementView({required this.cubit, super.key});

  static Route route(AnnouncementCubit cubit) => MaterialPageRoute(
        builder: (ctx) => AnnouncementView(
          cubit: cubit,
        ),
      );

  @override
  Widget build(BuildContext context) {
    final appTheme = context.read<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: appTheme.colorSet.textBlack,
        ),
        title: Text(
          "公告",
          style: appTheme.colorSet.textBlack.style(fontSize: 18),
        ),
      ),
      body: BlocBuilder<AnnouncementCubit, AnnouncementState>(
        bloc: cubit,
        builder: (context, state) {
          final annoList = state.announcementList ?? [];
          return Container(
            margin: const EdgeInsets.only(left: 15, right: 15, top: 20),
            child: ListView.builder(
              itemCount: annoList.length,
              itemBuilder: (context, index) {
                final e = annoList[index];
                return NewsCell(
                  title: e.title ?? "",
                  time: DateTime.fromMillisecondsSinceEpoch(
                      int.tryParse(e.publishTime ?? "") ?? 0),
                  onTap: () {
                    final url = e.directUrl;
                    if (url != null) {
                      Navigator.push(
                        context,
                        CommonWebvView.route(url, e.title),
                      );
                    }
                  },
                );
              },
            ),
            // child: Column(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     ...annoList
            //         .map(
            //           (e) => NewsCell(
            //             title: e.title ?? "",
            //             time: DateTime.fromMillisecondsSinceEpoch(
            //                 int.tryParse(e.publishTime ?? "") ?? 0),
            //           ),
            //         )
            //         .toList(),
            //   ],
            // ),
          );
        },
      ),
    );
  }
}
