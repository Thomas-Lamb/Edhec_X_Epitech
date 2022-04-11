import 'dart:io';

import 'package:flutter/material.dart';
import 'package:edhec_x_epitech/view/avis_page.dart';
import 'package:edhec_x_epitech/view/profile_page.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'dart:convert';

class ScanPage extends StatefulWidget{
  const ScanPage({Key? key}) : super(key: key);

  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  final qrKey = GlobalKey(debugLabel: 'QR');

  Barcode? barcode;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();

    if (Platform.isAndroid) {
      await controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          buildQrView(context),
          Positioned(bottom: 10,child: buildResult()),
        ],
      ),
    ),
  );

  Widget buildResult() => Container(
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white24,
    ),
    child: Text(
      barcode != null ? 'Résultat : ${barcode!.code}' : 'Scan un code !',
      maxLines: 3,
    ),
  );

  Widget buildQrView(BuildContext context) => QRView(
      key: qrKey,
      onQRViewCreated: onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Theme.of(context).accentColor,
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: MediaQuery.of(context).size.width * 0.8,
      ),
  );

  void execQrScan(barcode) {
    final parsedJson = jsonDecode(barcode.code);
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AvisPage(urlImgProduct: parsedJson["img"], nameProduct: parsedJson["name"],)));
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((barcode) => {
      if (this.barcode == null) {
        setState(() => this.barcode = barcode),
        execQrScan(barcode),
      }
    });
  }

}