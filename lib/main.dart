import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.7;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          height: height,
          alignment: Alignment.center,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Opacity(
                  opacity: 0.3,
                  child: ClipPath(
                    clipper: TopClipper(),
                    child: Container(
                      height: height * 0.8,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Opacity(
                  opacity: 0.3,
                  child: ClipPath(
                    clipper: BottomClipper(),
                    child: Container(
                      height: height * 0.4,
                      width: MediaQuery.of(context).size.width * 0.8,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 30;
    path.moveTo(0, offset);
    path.lineTo(0, size.height / 1.5 - offset);
    path.quadraticBezierTo(
        0, size.height / 1.5, offset, size.height / 1.5 + offset / 2);
    path.lineTo(size.width - offset, size.height - offset / 2);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - offset);
    path.lineTo(size.width, offset);
    path.quadraticBezierTo(size.width, 0, size.width - offset, 0);
    path.lineTo(offset, 0);
    path.quadraticBezierTo(0, 0, 0, offset);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}

class BottomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    double offset = 30;

    path.moveTo(0, offset);
    path.lineTo(0, size.height - offset);
    path.quadraticBezierTo(0, size.height, offset, size.height);
    path.lineTo(size.width - offset, size.height);
    path.quadraticBezierTo(
        size.width, size.height, size.width, size.height - offset);
    path.lineTo(size.width, size.height / 1.5 + offset);
    path.quadraticBezierTo(size.width, size.height / 1.5, size.width - offset,
        size.height / 1.5 - offset / 2);
    path.lineTo(offset, offset / 2);
    path.quadraticBezierTo(0, 0, 0, offset);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper oldClipper) => true;
}
