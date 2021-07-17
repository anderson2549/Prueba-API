import 'package:flutter/material.dart';
import 'package:prueba_flutter/constants/header_widget.dart';
import 'package:prueba_flutter/src/Pages/home.dart';
import 'package:prueba_flutter/src/lib/your_splash-0.2.2/lib/src/base_splash.dart';
import 'package:prueba_flutter/constants/StylesText.dart' as Styles;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen.timed(
      seconds: 5,
      route: MaterialPageRoute(
        builder: (_) {
          return MyHomePage(
            main: "exit",
          );
        },
      ),
      body: Scaffold(
        body: Stack(
          children: [
            HeaderWaveWidget(),
            Image(),
            Positioned(
              bottom: 50,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Center(
                    child: Text(
                  "¡¡Bienvenido!!",
                  style: Styles.textDetailBold,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Image extends StatelessWidget {
  const Image({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.scaleDown,
            image: AssetImage('assets/logo.png'),
          ),
        ),
      ),
    );
  }
}
