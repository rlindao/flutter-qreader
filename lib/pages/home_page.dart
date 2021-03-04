import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/providers/scan_list_provider.dart';
import '../pages/direcciones_page.dart';
import '../providers/ui_provider.dart';
import '../pages/mapas_page.dart';
import '../widgets/scan_button.dart';
import '../widgets/custom_navigator.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          title: Text('Historial'),
          actions:[
              IconButton(
                icon: Icon(Icons.delete_forever),
                onPressed: (){

                    Provider.of<ScanListProvider>(context , listen: false).borrarTodos();
                },
              )
          ]
      ),
      body: _HomePageBody(),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScanButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}


class _HomePageBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      //obtener el selecte menu opt
      final uiProvider = Provider.of<UiProvider>(context);
      // cambiar para mostrar la pagina respectiva
      final currentIndex = uiProvider.selectedMenuOpt;

      // TODO: TEMPORAL LEER LA BASE DE DATOS
      //final tempScan = new ScanModel(valor: 'http://google.com');
      //DBProvider.db.nuevoScanRow(tempScan);
      //DBProvider.db.getScanById(10).then((value) => print(value.valor));
      //  DBProvider.db.getTodosLosScans().then(print);
      //  DBProvider.db.deleteAllScan().then(print);

      // Usar el scanListProvider
      final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
      
      switch(currentIndex){
        
        case 0:
          scanListProvider.cargarScanPorTipo('geo');
          return MapasPage();

        case 1:
          scanListProvider.cargarScanPorTipo('http');
          return DireccionesPage();

        default:
            return MapasPage();
      }

  }
}