import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.85,
            child: Stack(
              children: [
                Positioned.fill(
                  child: SizedBox(
                    child: CustomPaint(
                      painter: CommentPaint(),
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Value  for money',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '-Arun & 25 others',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.blue;

    var path2 = Path();

    path2.lineTo(0, size.height - 30);
    path2.lineTo(40, size.height - 30);
    path2.moveTo(40, size.height - 30);
    path2.lineTo(40, size.height);
    path2.lineTo(120, size.height - 30);
    path2.lineTo(size.width, size.height - 30);
    path2.lineTo(size.width, 0);
    path2.lineTo(0, 0);

    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
