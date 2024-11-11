import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:ceex_flutter/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCell extends StatelessWidget {
  final String title;
  final DateTime time;
  final VoidCallback? onTap;
  const NewsCell({
    required this.title,
    required this.time,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: EdgeInsets.only(top: 10),
        height: 60,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: appTheme.colorSet.textBlack.style(fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              time.formatyyyymmddHHMMnnSS(),
              style: appTheme.colorSet.textGrey.style(fontSize: 12),
            ),
            SizedBox(
              height: 6,
            ),
            Divider(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
