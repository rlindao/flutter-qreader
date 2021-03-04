import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//import 'package:flutter/rendering.dart';
import './pages/home_page.dart';
import './pages/mapa_page.dart';
import './providers/scan_list_provider.dart';
import './providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiProvider(
          providers: [ 
            ChangeNotifierProvider(create: (_) => new UiProvider()),
            ChangeNotifierProvider(create: (_) => new ScanListProvider()),
          ],
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR READER probando',
        initialRoute: 'home',
        routes: {
          'home' : (_) => HomePage() ,
          'mapa': (_) => MapaPage() ,
        },
        theme: ThemeData(
          primaryColor: Colors.deepPurple,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
                    backgroundColor:Colors.deepPurple
          )
        ),
      ),
    );
  }
}