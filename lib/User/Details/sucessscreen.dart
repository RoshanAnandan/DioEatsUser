import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../MainScreen.dart';


class Sucessscreen extends StatefulWidget {
  @override
  late String text;
  Sucessscreen(this.text);

  @override
  State<StatefulWidget> createState() {
    return SucessscreenState(this.text);
  }
}

class SucessscreenState extends State<Sucessscreen>
    with SingleTickerProviderStateMixin {

  String _email;

  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  SucessscreenState(this._email);

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Profilepages(_email)));
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
    new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: const <Widget>[
            ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/image/success.png',
                width: animation.value * 250,
                height: animation.value * 250,
              ),
               const Text(
                "Verified",
                style:  TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Color(0xFF56C565)),
              ),
              const Text(
                "Your details are Sucessfully Verified...",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Color(0xFF061508)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}