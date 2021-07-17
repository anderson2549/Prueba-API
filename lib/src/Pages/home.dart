import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/searchs/searchClimaDelegate.dart';
import 'package:prueba_flutter/constants/StylesText.dart' as Styles;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.main = ""}) : super(key: key);
  final String main;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    if (widget.main != "") {
      Navigator.of(context).pop();
    }
    return getPantalla(context);
  }

  Scaffold getPantalla(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("Pronostico APP - BOLD"),
        actions: [
          IconButton(
            onPressed: () =>
                showSearch(context: context, delegate: ClimaDelegate()),
            icon: Icon(Icons.search_outlined),
          )
        ],
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('TEST BOLD',
                  textAlign: TextAlign.center,
                  style: Styles.textFormBold.copyWith(fontSize: 50)),
              SizedBox(height: 25),
              Text(
                'En este aplicacion podras realizar la busqueda del pronostico por ciudades',
                textAlign: TextAlign.center,
                style: Styles.textForm.copyWith(),
              ),
              SizedBox(height: 25),
              Text(
                'Gracias por descargar esta prueba de la aplicacion :D',
                textAlign: TextAlign.center,
                style: Styles.textForm.copyWith(),
              ),
              SizedBox(height: 25),
              Text(
                'Anderson Ortiz Florez :D',
                textAlign: TextAlign.center,
                style:
                    Styles.textFormBold.copyWith(fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () =>
            showSearch(context: context, delegate: ClimaDelegate()),
        tooltip: 'Increment',
        backgroundColor: Colors.red,
        child: Icon(Icons.search),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
