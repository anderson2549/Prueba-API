import 'package:flutter/material.dart';

/**
 * FONDO LOGIN
 */

class HeaderWaveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      //color: Color(0xff615AAB),
      child: CustomPaint(
        painter: _HeaderWavePainter(),
      ),
    );
  }
}

class _HeaderWavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    LinearGradient gradient = LinearGradient(
      colors: [
        Color(0xffEAE7E5),
        Color(0xffEAE7E5),
        Color(0xffEAE7E5),
        Color(0xffEAE7E5),
        Color(0xffEAE7E5),
        Color(0xffEAE7E5),
        Color(0xffEAE7E5),
        Color(0xffEB9302),
      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
    );
    final rect = new Rect.fromCircle(
      //center: Offset(165, 55),
      center: Offset(10, 350),
      radius: 180,
    );

    final lapiz = Paint()..shader = gradient.createShader(rect);

    lapiz.style = PaintingStyle.fill;
    lapiz.strokeWidth = 25;

    final path2 = new Path();
    path2.moveTo(0, 0);
    path2.lineTo(0, size.height);
    path2.lineTo(size.width, size.height);
    path2.lineTo(size.width, 0);

    canvas.drawPath(path2, lapiz);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
