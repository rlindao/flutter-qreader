import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:qr_reader/models/scan_models.dart';
import 'package:qr_reader/providers/db_providers.dart';

class ScanListProvider extends ChangeNotifier {
    
    List<ScanModel> scans = [];
    String tipoSeleccionado = 'http';

    Future<ScanModel>nuevoScan(String valor) async {
      final nuevoScan = new ScanModel(valor:valor);
      final id = await DBProvider.db.nuevoScan(nuevoScan);
      // Asignar el ID de la base de datos
      nuevoScan.id = id;

      if(this.tipoSeleccionado == nuevoScan.tipo){
        this.scans.add(nuevoScan);
        notifyListeners();
      }

      return nuevoScan;
    }

    cargarScans() async {
        final scans = await DBProvider.db.getTodosLosScans();
        this.scans =  [...scans];
        notifyListeners();
    }

    cargarScanPorTipo(String tipo) async {
          final scans = await DBProvider.db.getScansPorTipo(tipo);
          this.scans =  [...scans];
          this.tipoSeleccionado = tipo;
          notifyListeners();
    }

    borrarTodos() async {
        await DBProvider.db.deleteAllScan();
        this.scans = [];
        notifyListeners();
        
    }


      borrarScansPorId(int id) async {
        await DBProvider.db.deleteScan(id);
      }
}