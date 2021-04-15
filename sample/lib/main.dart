import 'package:flutter/material.dart';
import 'brick_anim.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BrickPage());
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _animationController;

  void mylistener(status) {
    if (status == AnimationStatus.completed) {
      _animationController.removeStatusListener(mylistener);
      _animationController.reset();
      _animation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn));

      _animationController.forward();
    }
  }

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween<double>(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.fastOutSlowIn))
      ..addStatusListener(mylistener);

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Application learning'),
      ),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Transform(
          transform: Matrix4.translationValues(_animation.value * width, 0, 0),
          child: Center(
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}
