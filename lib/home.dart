import 'package:flutter/material.dart';
import 'package:tabbar/animated_circle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _aninationController;
  late Animation<double> _loadAnimation;

  @override
  void initState() {
    super.initState();
    _aninationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );
    _loadAnimation =
        Tween<double>(begin: 0, end: 1).animate(_aninationController)
          ..addListener(() {
            setState(() {});
          });

    _aninationController.forward();
  }

  @override
  void dispose() {
    _aninationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedCircle(animation: _loadAnimation),
            // AnimatedSwitch(
            //   onTap: (bool value) {
            //     if (value) {
            //       _aninationController.repeat();
            //     } else {
            //       _aninationController.reset();
            //     }
            //     Fluttertoast.showToast(
            //         msg: "This is Center Short Toast",
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.CENTER,
            //         timeInSecForIosWeb: 1,
            //         backgroundColor: Colors.red,
            //         textColor: Colors.white,
            //         fontSize: 16.0);
            //   },
            // ),
            // AnimatedSlider(
            //   onTap: (double val) {
            //     _aninationController.value = val;
            //   },
            // )
            SizedBox(
              height: 50,
              child: Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    alignment: Alignment.bottomRight,
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width *
                          _loadAnimation.value,
                    ),
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: CustomPaint(
                        painter: QuestionPainter(),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    height: 10,
                    duration: const Duration(seconds: 1),
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width *
                          _loadAnimation.value,
                    ),
                    color: Colors.grey,
                    child: Container(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class QuestionPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, 0);
    path.close();
    canvas.drawPath(path, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// class DisplayRow extends StatelessWidget {
//   final Widget controller;
//   final Widget controlled;
//   const DisplayRow({
//     super.key,
//     required this.controlled,
//     required this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           controller,
//           controlled,
//         ],
//       ),
//     );
//   }
// }
