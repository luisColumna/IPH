
import 'package:flutter/material.dart';
import 'package:iph/src/pages/detenido.dart';
import 'package:iph/src/pages/detenidos.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
        debugShowCheckedModeBanner: false,
         localizationsDelegates: [

          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          //GlobalCupertinoLocalizations.delegate,
        ],
          supportedLocales: [
          const Locale('en'), // English
          const Locale('es'), // Español
        ],
        title: 'Detenidos',
        initialRoute: 'detenidos',
        routes: {
          'detenidos': (BuildContext context) => DetenidosPage(),
          'detenido':(BuildContext context) => DetenidoPage(),
        },
        theme: ThemeData(primaryColor: Colors.blueAccent[700])
      );
    
  }
}