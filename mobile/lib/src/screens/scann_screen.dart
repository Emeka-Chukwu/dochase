import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobile/src/cores/cores.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScanScreenWidget extends StatefulWidget {
  @override
  _ScanScreenWidgetState createState() => _ScanScreenWidgetState();
}

class _ScanScreenWidgetState extends State<ScanScreenWidget> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? result;

  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller?.pauseCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              YMargin(50),
              if (result != null)
                Text(
                    'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
              else
                Text('Scan a code'),
              YMargin(50),
              Container(
                height: Responsive.screenHeight(40, context),
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller?.toggleFlash();
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: controller?.getFlashStatus(),
                          builder: (context, snapshot) {
                            return Text('Flash: ${snapshot.data}');
                          },
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () async {
                          await controller?.flipCamera();
                          setState(() {});
                        },
                        child: FutureBuilder(
                          future: controller?.getCameraInfo(),
                          builder: (context, snapshot) {
                            if (snapshot.data != null) {
                              return Text(
                                  'Camera facing ${describeEnum(snapshot.data!)}');
                            } else {
                              return Text('loading');
                            }
                          },
                        )),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.pauseCamera();
                      },
                      child: Text('pause', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                      onPressed: () async {
                        await controller?.resumeCamera();
                      },
                      child: Text('resume', style: TextStyle(fontSize: 20)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
