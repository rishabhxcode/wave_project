import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';
import 'dart:math';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[

          ControlledAnimation(
            playback: Playback.LOOP,
            duration: Duration(seconds: 10),
            tween: Tween(begin: 0.0, end: 2*pi),
            builder: (context, value)=>ClipPath(
              child: Container(
                height: h/1.6,
                width: w,
                color: Colors.yellowAccent.withAlpha(150),
              ),
              clipper: curveClipper3(value),
            ),
          ),


          ControlledAnimation(
            playback: Playback.LOOP,
            duration: Duration(seconds: 7),
            tween: Tween(begin: 0.0, end: 2*pi),
            builder: (context, value)=>ClipPath(
              child: Container(
                height: h/1.6,
                width: w,
                color: Colors.purpleAccent.withAlpha(100),
              ),
              clipper: curveClipper2(value),
            ),
          ),
          
ControlledAnimation(
  playback: Playback.LOOP,
  duration: Duration(seconds: 3),
  tween: Tween(begin: 0.0, end: 2*pi),
  builder: (context, value)=>ClipPath(
    child: Container(
      height: h/1.75,
      width: w,
      color: Colors.orange,
    ),
    clipper: curveClipper(value),
  ),
            ),
        ],
      ),
    );
  }
}


//     ORANGE

class curveClipper extends CustomClipper<Path>{

  final double value;
  curveClipper(this.value);

  @override
  getClip(Size size) {
    final path = Path();
    final x = size.width;
    final y = size.height;

    final sin1 = sin(value);
    final sin2 = sin(value + pi/2);
    final sin3 = sin(value + pi);

    final startPointY =  y * (0.9+0.05*sin1);
    final controlPointY = y * (0.9 + 0.1*sin2);
    final endPointY = y * (0.9+ 0.05*sin3);

path.lineTo(0,startPointY);
path.quadraticBezierTo(x/2, controlPointY, x, endPointY);
path.lineTo(x, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

//      YELLOW

class curveClipper2 extends CustomClipper<Path>{

  final double value;
  curveClipper2(this.value);

  @override
  getClip(Size size) {
    final path = Path();
    final x = size.width;
    final y = size.height;

    final sin1 = sin(value);
    final sin2 = sin(value + pi/2);
    final sin3 = sin(value + pi);

    final startPointY =  y * (0.9+0.1*sin1);
    final controlPointY = y * (0.9 + 0.15*sin2);
    final endPointY = y * (0.9+ 0.1*sin3);

    path.lineTo(0,startPointY);
    path.quadraticBezierTo(x/1.1, controlPointY, x, endPointY);
    path.lineTo(x, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}


//                   PINK

class curveClipper3 extends CustomClipper<Path>{
  final double value;
  curveClipper3(this.value);

  @override
  getClip(Size size) {
    final path = Path();
    final x = size.width;
    final y = size.height;

    final sin1 = sin(value);
    final sin2 = sin(value + pi/2);
    final sin3 = sin(value + pi);

    final startPointY =  y * (0.9+0.05*sin1);
    final controlPointY = y * (0.8+ 0.3*sin2);
    final endPointY = y * (0.9+ 0.1*sin3);

    path.lineTo(0,startPointY);
    path.quadraticBezierTo(x/2, controlPointY, x, endPointY);
    path.lineTo(x, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}


