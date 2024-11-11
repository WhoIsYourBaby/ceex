import 'package:flutter/material.dart';
import 'package:ceex_flutter/l10n/gen/app_localizations.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  static Route route(RouteSettings routeSettings) =>
      MaterialPageRoute(builder: (context) => const ServiceView());

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.serviceViewTitle),
      ),
      body: const Center(
        child: Text("service"),
      ),
    );
  }
}
