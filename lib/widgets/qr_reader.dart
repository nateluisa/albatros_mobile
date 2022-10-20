import 'dart:io';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';


class MyQRReader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyQRReaderState();
}

class _MyQRReaderState extends State<MyQRReader> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  void _onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);
    controller.scannedDataStream.listen((scanData) {
      setState(() => result = scanData);
    });
  }
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void readQr() async {
    if (result != null) {
      controller!.pauseCamera();
      print(result!.code);
      controller!.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    readQr();
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Leitor de código QR',)),
        backgroundColor: Color.fromARGB(255, 106, 16, 48),
      ),
      body: QRView(
        key: qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Colors.orange,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: 250,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}