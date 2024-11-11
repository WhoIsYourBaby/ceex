import 'package:flutter/material.dart';

upVersionDialog(BuildContext context) async {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return WillPopScope(
            onWillPop: () async{
              return false;
            },
            child: AlertDialog(
              actionsAlignment: MainAxisAlignment.spaceAround,
              title: const Text(
                'Ceex改版4.0.1上线',
                textAlign: TextAlign.center,
              ),
              actions: <Widget>[
              ],
            ));
      });
}
