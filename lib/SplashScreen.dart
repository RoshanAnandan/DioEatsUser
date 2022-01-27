import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Introscreen.dart';
import 'User/MainScreen.dart';



class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  String msg='';
  String email='';

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }


  Future getvalidation() async {
    final SharedPreferences pref=await SharedPreferences.getInstance();
    var mail=pref.getString('email');
    setState(() {
      email=mail!;
    });
    print("validateemail:"+email.toString());
  }

  
  void navigationPage()  {
    getvalidation().whenComplete(() async
    {
      if(email!=''){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profilepages(email)));
      }
      else{
          Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => Introscreen()));
      }
    }
    );
    
  }

  @override
  void initState() {
    super.initState();

    animationController =  AnimationController(
        vsync: this, duration: const Duration(seconds: 2));
    animation =
     CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => setState(() {}));
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
            children: <Widget>[
            ],),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/logo.jpeg',
                width: animation.value * 250,
                height: animation.value * 250,
              //color: Color(0xFFCA1F39),
              ),
              // new Text(
              //   '',
              //   style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Color(0xFFCA1F39)),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}