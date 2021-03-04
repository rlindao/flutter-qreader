import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import 'package:qr_reader/utils/utils.dart';

class ScanButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      elevation: 0,
      child: Icon(Icons.filter_center_focus),
      onPressed: () async{

        String barcodeScanRes;

        try {
              // codigo para scanear 
              barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                  "#3D8BEF", "Cancelar", true, ScanMode.QR);
              //barcodeScanRes = 'geo:45.287135,-75.920226';

              if (barcodeScanRes == '-1') {
                  return ;
              }
              
              final scanListProvider = Provider.of<ScanListProvider>(context , listen: false);
              
              final nuevoscan = await scanListProvider.nuevoScan(barcodeScanRes);
              
              launchURL(context, nuevoscan);
            } on PlatformException {
              barcodeScanRes = 'Failed to get platform version.';
            }

      },
    );
  }
}