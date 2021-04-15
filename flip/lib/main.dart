import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: FlipperWidget(),
    );
  }
}

class FlipperWidget extends StatefulWidget {
  @override
  _FlipperWidgetState createState() => _FlipperWidgetState();
}

class _FlipperWidgetState extends State<FlipperWidget>
    with SingleTickerProviderStateMixin {
  bool reversed = false;
  AnimationController _animationController;
  Animation<double> _animation;

  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = TweenSequence([
      TweenSequenceItem(
          tween: Tween(begin: 0.0, end: -math.pi / 2.0), weight: 0.5),
      TweenSequenceItem(
          tween: Tween(begin: math.pi / 2.0, end: 0.0), weight: 0.5),
    ]).animate(_animationController);
  }

  _doAnim() {
    if (!mounted) return;
    if (reversed) {
      _animationController.reverse();
      reversed = false;
    } else {
      _animationController.forward();
      reversed = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Flipper widget')),
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001)
              ..rotateY(_animation.value),
            child: GestureDetector(
              onTap: _doAnim,
              child: IndexedStack(
                children: <Widget>[
                  CardOne(),
                  CardTwo(),
                ],
                alignment: Alignment.center,
                index: _animationController.value < 0.5 ? 0 : 1,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      child: Container(
        height: 300,
        width: 300,
        child: Center(
          child: Text(
            'Tap to see the code',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class CardTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: Container(
        height: 300,
        width: 300,
        child: Center(
          child: Text(
            '2082000',
            style: TextStyle(
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
