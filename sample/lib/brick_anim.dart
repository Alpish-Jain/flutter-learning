import 'package:flutter/material.dart';
import 'dart:math' as math;

class BrickPage extends StatefulWidget {
  @override
  _BrickPageState createState() => _BrickPageState();
}

class _BrickPageState extends State<BrickPage>
    with SingleTickerProviderStateMixin {
  AnimationController animationController;
  Tween tween;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    tween = Tween(begin: 0.0, end: 1.0);
    animationController.repeat();
  }

  //brick one
  Animation get animOne => tween.animate(CurvedAnimation(
        curve: Interval(
          0.0,
          0.125,
          curve: Curves.linear,
        ),
        parent: animationController,
      ));
  //brick one
  Animation get animTwo => tween.animate(CurvedAnimation(
        curve: Interval(
          0.125,
          0.250,
          curve: Curves.linear,
        ),
        parent: animationController,
      ));
  //brick two
  Animation get animThree => tween.animate(CurvedAnimation(
        curve: Interval(
          0.250,
          0.375,
          curve: Curves.linear,
        ),
        parent: animationController,
      ));
  //brick three
  Animation get animFour => tween.animate(CurvedAnimation(
        curve: Interval(
          0.375,
          0.5,
          curve: Curves.linear,
        ),
        parent: animationController,
      ));
  //brick Four
  Animation get animFive => tween.animate(CurvedAnimation(
        curve: Interval(
          0.5,
          0.625,
          curve: Curves.linear,
        ),
        parent: animationController,
      ));
  //brick Four
  Animation get animSix => tween.animate(CurvedAnimation(
        curve: Interval(
          0.625,
          0.75,
          curve: Curves.linear,
        ),
        parent: animationController,
      ));
  //brick three
  Animation get animSeven => tween.animate(CurvedAnimation(
        curve: Interval(
          0.75,
          0.875,
          curve: Curves.linear,
        ),
        parent: animationController,
      ));
  //brick Two
  Animation get animEight => tween.animate(CurvedAnimation(
        curve: Interval(
          0.875,
          1.0,
          curve: Curves.linear,
        ),
        parent: animationController,
      ));

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter learning'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedBrick(
              animations: [animOne, animTwo],
              controller: animationController,
              marginLeft: 0.0,
              alignment: Alignment.centerLeft,
              isClockWise: true,
            ),
            AnimatedBrick(
              animations: [animThree, animEight],
              controller: animationController,
              marginLeft: 0.0,
              isClockWise: false,
            ),
            AnimatedBrick(
              animations: [animFour, animSeven],
              controller: animationController,
              marginLeft: 30.0,
              isClockWise: true,
            ),
            AnimatedBrick(
              animations: [animFive, animSix],
              controller: animationController,
              marginLeft: 30.0,
              isClockWise: false,
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedBrick extends AnimatedWidget {
  final AnimationController controller;
  final List<Animation> animations;
  final double marginLeft;
  final Alignment alignment;
  bool isClockWise;
  AnimatedBrick(
      {Key key,
      this.controller,
      this.animations,
      this.marginLeft,
      this.alignment = Alignment.centerRight,
      this.isClockWise})
      : super(key: key, listenable: controller);

  Matrix4 clockWise(animation) =>
      Matrix4.rotationZ(animation.value * math.pi * 2.0 * 0.5);

  Matrix4 antiClockWise(animation) =>
      Matrix4.rotationZ(-(animation.value * math.pi * 2.0 * 0.5));

  @override
  Widget build(BuildContext context) {
    var firstTransformation, secondTransformation;

    if (isClockWise) {
      firstTransformation = clockWise(animations[0]);
      secondTransformation = clockWise(animations[1]);
    } else {
      firstTransformation = antiClockWise(animations[0]);
      secondTransformation = antiClockWise(animations[1]);
    }

    return Transform(
      alignment: alignment,
      transform: firstTransformation,
      child: Transform(
        transform: secondTransformation,
        alignment: alignment,
        child: Brick(
          marginLeft: marginLeft,
        ),
      ),
    );
  }
}

class Brick extends StatelessWidget {
  final marginLeft;

  Brick({this.marginLeft = 15.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: marginLeft),
      height: 10,
      width: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.green,
      ),
    );
  }
}
