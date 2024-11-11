import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanView extends StatelessWidget {
  QRScanView({super.key});

  final MobileScannerController cameraController = MobileScannerController();

  static Route<String?> route() => MaterialPageRoute(
        builder: (context) => QRScanView(),
      );

  @override
  Widget build(BuildContext context) {
    final safeArea = MediaQuery.of(context).viewPadding;
    return Scaffold(
      body: MobileScanner(
        controller: cameraController,
        onDetect: (capture) {
          cameraController.stop();
          final List<Barcode> barcodes = capture.barcodes;
          for (final barcode in barcodes) {
            final barValue = barcode.rawValue;
            Navigator.pop(context, barValue);
            return;
          }
        },
        placeholderBuilder: (context, child) {
          return Container(
            color: Colors.black,
          );
        },
        overlay: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: safeArea.top),
              height: kToolbarHeight,
              alignment: Alignment.center,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_rounded),
                  ),
                  Spacer(),
                  IconButton(
                    icon: ValueListenableBuilder(
                      valueListenable: cameraController.torchState,
                      builder: (context, state, child) {
                        switch (state as TorchState) {
                          case TorchState.off:
                            return const Icon(Icons.flash_off,
                                color: Colors.black54);
                          case TorchState.on:
                            return const Icon(Icons.flash_on,
                                color: Colors.yellow);
                        }
                      },
                    ),
                    iconSize: 32.0,
                    onPressed: () => cameraController.toggleTorch(),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
