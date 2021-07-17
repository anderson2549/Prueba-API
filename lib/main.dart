import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prueba_flutter/src/Pages/detailsPage.dart';
import 'package:prueba_flutter/src/Pages/splashPage.dart';
import 'package:prueba_flutter/src/Pages/home.dart';
import 'package:prueba_flutter/src/providers/ClimaProvider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widgetMain = MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "/splash",
      routes: {
        "/": (_) => MyHomePage(),
        "/splash": (_) => SplashPage(),
        "detailsPage": (_) => DetailsPage(),
      },
    );

    //Instalacion de provider
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ClimaProvider(),
          lazy: false,
        )
      ],
      child: widgetMain,
    );
  }
}
