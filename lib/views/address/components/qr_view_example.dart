import 'package:ceex_flutter/components/app_bar_center_text.dart';
import 'package:ceex_flutter/components/app_bar_wrapper.dart';
import 'package:ceex_flutter/cubit/appconf/appconf_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  static Route route() =>
      MaterialPageRoute(builder: ((context) => QRViewExample()));

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  MobileScannerController cameraController = MobileScannerController();
  bool isSuccess = true;

  @override
  Widget build(BuildContext context) {
    final appTheme = context.watch<AppconfCubit>().state.appTheme;
    return Scaffold(
      appBar: AppBarWrapper(
        statusBarColor: appTheme.colorSet.colorWhite,
        child: AppBarCenterText(
          title: "扫描二维码",
          rigetWidget: IconButton(
            color: appTheme.colorSet.colorDark,
            icon: ValueListenableBuilder(
              valueListenable: cameraController.cameraFacingState,
              builder: (context, state, child) {
                switch (state as CameraFacing) {
                  case CameraFacing.front:
                    return const Icon(Icons.camera_front);
                  case CameraFacing.back:
                    return const Icon(Icons.camera_rear);
                }
              },
            ),
            iconSize: 32.0,
            onPressed: () => cameraController.switchCamera(),
          ),
        ),
      ),
      body: MobileScanner(
        controller: cameraController,
        onDetect: (capture) {
          if (isSuccess) {
            isSuccess = !isSuccess;
            Navigator.pop(context, "${capture.barcodes[0].displayValue}");
          }
        },
      ),
    );
  }
}
