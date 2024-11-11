import 'package:flutter/material.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

class ProfitView extends StatefulWidget {
  const ProfitView({super.key});

  static Route route(RouteSettings routeSettings) =>
      MaterialPageRoute(builder: (context) => const ProfitView());

  @override
  State<ProfitView> createState() => _ProfitViewState();
}

class _ProfitViewState extends State<ProfitView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("赚取"),
      ),
      body: Center(
        child: Text("赚取"),
      ),
    );
  }
}
