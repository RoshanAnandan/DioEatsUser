import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:provider/provider.dart';
import 'package:untitled/User/Details/custom_shape.dart';
import 'package:untitled/User/Details/responsive_ui.dart';
import 'package:untitled/User/Details/signin.dart';

import '../../color.dart';



class Resturantmenulist extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
  bool visible = false ;
  _RegisterState createState() => new _RegisterState();

}


class _RegisterState extends State<Resturantmenulist> {

  bool checkBoxValue = false;
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;


  static ThemeData _buildTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      accentColor: CeBrown900,
      primaryColor: CePink100,
      buttonColor: CePink100,
      scaffoldBackgroundColor: CeBackgroundWhite,
      cardColor: CeBackgroundWhite,
      textSelectionColor: CePink100,
      errorColor: CeErrorRed,

    );
  }

  String msg='';


  var _firstnameController = new TextEditingController();
  var _lastnameController = new TextEditingController();
  var _emailidController = new TextEditingController();
  var _usepassController = new TextEditingController();

  // void _addData() {
  //
  //   Navigator.push(context, MaterialPageRoute(builder: (context)=>UserSignin()));
  //
  //   http.post(Uri.parse("https://androiddatabase2021.000webhostapp.com/Hwappy/signup.php"), body: {
  //     "Hwappy_Name": _firstnameController.text,
  //     "Hwappy_Lastname": _lastnameController.text,
  //     "Hwappy_Email_Id": _emailidController.text,
  //     "Hwappy_Password": _usepassController.text,
  //   });
  //
  //   //print(_adresseController.text);
  // }

  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large =  ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium =  ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88,child: AppBar(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.white),
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (_) => UserSignin()));
                    },
                  ),
                  backgroundColor: Color(0xFFA90725),
                  elevation: 0,
                  title: Text("Singn Up Your Details..."),
                ),),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(height: _height/35,),
                button(),
                infoTextRow(),
                socialIconsRow(),

              ],
            ),
          ),
        ),
      ),
    );
  }


  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large? _height/8 : (_medium? _height/7 : _height/6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFD3032A), Color(0xFFCE8B98)],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large? _height/12 : (_medium? _height/11 : _height/10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFD3032A), Color(0xFFCE8B98)],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left:_width/ 12.0,
          right: _width / 12.0,
          top: _height / 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildFirstName(),
            SizedBox(height: _height / 60.0),
            _buildContact(),
            SizedBox(height: _height/ 60.0),
            _buildEmail(),
            SizedBox(height: _height / 60.0),
            _buildPassword(),
            SizedBox(height: _height / 60.0),
            _buildConfirmPassword(),
          ],
        ),
      ),
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (bool? value) {
                setState(() {
                  checkBoxValue = value!;
                });
              }),
          Text("I accept all terms and conditions",
            style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF3F3C3D), fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }


  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // _addData();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Adding Your Personal Details...."),backgroundColor: Color(0xFF384668)),
          );
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width:_large? _width/4 : (_medium? _width/3.75: _width/3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Color(0xFF9B0437), Color(0xFF9B0437)],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text("Add Your Details", style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
      ),
    );
  }

  Widget infoTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Or create using social media",
            style: TextStyle(fontWeight: FontWeight.w400,color: Color(0xFF3F3C3D), fontSize: _large? 12: (_medium? 11: 10)),
          ),
        ],
      ),
    );
  }

  Widget socialIconsRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 80.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/image/googlelogo.png"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/image/fblogo.jpg"),
          ),
          SizedBox(
            width: 20,
          ),
          CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage("assets/image/twitterlogo.jpg"),
          ),
        ],
      ),
    );
  }

  // User name //

  _buildFirstName() {
    return TextFormField(
      validator: (value) =>
      value!.isEmpty ? "First name cannot be empty" : null,
      style: TextStyle(
          color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
      decoration:
      _buildInputDecoration("Customer Name", ''),
      controller: _firstnameController,
    );
  }


  _buildContact() {
    return TextFormField(
      validator: (value) =>
      value!.isEmpty ? "Last name cannot be empty" : null,
      style: TextStyle(
          color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
      decoration:
      _buildInputDecoration("Contact Number", ''),
      controller: _lastnameController,
    );
  }

  // Email id //

  _buildEmail() {

    return TextFormField(
      validator: (value) => !isEmail(value!) ? "Sorry, we do not recognize this email address" : null,
      style: TextStyle(
          color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
      decoration: _buildInputDecoration("Email-Id", ''),
      controller: _emailidController,
    );
  }

  // password //

  final _passwordController = TextEditingController();
  _buildPassword() {
    return TextFormField(
      obscureText: true,
      controller: _passwordController,
      validator: (value) =>
      value!.length <= 6 ? "Password must be 6 or more characters in length" : null,
      style: TextStyle(
          color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
      decoration:
      _buildInputDecoration("Password", ''),

    );
  }

  // conform password  //

  _buildConfirmPassword() {

    return Container(
        child: TextFormField(
          obscureText: true,
          validator: (value) => value!.isEmpty ||
              (value.isNotEmpty && value != _passwordController.text)
              ? "Must match the previous entry"
              : null,
          style: TextStyle(
              color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
          decoration: _buildInputDecoration("Conform Password",''),
          controller: _usepassController,
        ));
  }
}

bool isEmail(String value) {
  String regex =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(regex);

  return value.isNotEmpty && regExp.hasMatch(value);
}

InputDecoration _buildInputDecoration(String hint, String iconPath) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Color(0xFF94AADE))
      ),
      labelText: hint,
      border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Color(0xFF94AADE))
      ),
      hintStyle: TextStyle(color: Color(0xFF3F3C3D)),

      errorStyle: TextStyle(color: Colors.red),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.red)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.red)));
}