import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            height: 150,
            width: MediaQuery.of(context).size.width * 0.85,
            color: Colors.blueGrey,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.85,
                    child: CustomPaint(
                      painter: CirclePainter(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.85,
                    child: CustomPaint(
                      painter: CirclePainter2(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    canvas.drawArc(
      Rect.fromCenter(center: Offset.zero, width: 350, height: 350),
      0.0,
      500,
      true,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CirclePainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    canvas.drawArc(
      Rect.fromCenter(center: const Offset(0,20), width: 300, height: 180),
      0.0,
      5,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
