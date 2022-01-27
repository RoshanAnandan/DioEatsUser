import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/User/Details/custom_shape.dart';
import 'package:untitled/User/Details/responsive_ui.dart';

import '../../color.dart';
import '../MainScreen.dart';




class Editprofile extends StatefulWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
    );
  }
  bool visible = false ;
  _RegisterState createState() => new _RegisterState();

}


class _RegisterState extends State<Editprofile> {

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
  bool visible = false ;
  late String _email ;

  var _firstnameController = new TextEditingController();
  var _lastnameController = new TextEditingController();
  var _emailidController = new TextEditingController();
  var _userpasswordController = new TextEditingController();

  Future<Null> getSharedPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("email");
    setState(() {
      _email =  prefs.getString("counter")!;
      print(_email);
    });

  }

  @override
  void initState() {
    print("ini");
    super.initState();
    _email = "";
    getSharedPrefs();

  }

  // Future<String> _addData() async {
  //
  //   setState(() {
  //     visible = true ;
  //   });
  //
  //   final response = await http.post(Uri.parse("https://androiddatabase2021.000webhostapp.com/Hwappy/editprofile.php"), body: {
  //     "profileuser": email,
  //     "Hwappy_Name": _firstnameController.text,
  //     "Hwappy_Lastname": _lastnameController.text,
  //     "Hwappy_Password": _userpasswordController.text,
  //   });
  //
  //   var datauser = json.decode(response.body.toString());
  //   print(datauser);
  //
  //   if(datauser=="failure"){
  //     setState(() {
  //       print("failure");
  //       visible = false;
  //     });
  //   }else{
  //     print(email);
  //     print("successfully updated");
  //
  //     Navigator.push(context, MaterialPageRoute(builder: (_)=>Profilepages(email))
  //     );
  //   }
  //
  //   return datauser;
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
                Opacity(opacity: 0.88,child:  AppBar(
                     leading: IconButton(
                         icon: Icon(Icons.arrow_back,color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                       ),
                    backgroundColor: Color(0xFFA90725),
                    elevation: 0,
                       title: Text("Edit Your Profile"),
                 ),),
                clipShape(),
                form(),
                SizedBox(height: _height/35,),
                button(),
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
            _buildLastName(),
            SizedBox(height: _height/ 60.0),
            _buildEmail(),
            SizedBox(height: _height / 60.0),
            _buildPassword(),
          ],
        ),
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
            SnackBar(content: Text('Loading...'),backgroundColor: Colors.blueAccent,),
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
        child: Text("Update Profile", style: TextStyle(fontSize: _large? 14: (_medium? 12: 10)),),
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
      _buildInputDecoration("Name", ''),
      controller: _firstnameController,
    );
  }


  _buildLastName() {
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

  _buildPassword() {
    return TextFormField(
      obscureText: true,
      controller: _userpasswordController,
      validator: (value) =>
      value!.length <= 6 ? "Password must be 6 or more characters in length" : null,
      style: TextStyle(
          color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
      decoration:
      _buildInputDecoration("Password", ''),

    );
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
          borderSide: BorderSide(color: Colors.brown)
      ),
      labelText: hint,
      border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.brown)
      ),
      hintStyle: TextStyle(color: Colors.brown),

      errorStyle: TextStyle(color: Colors.red),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.red)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.0),
          borderSide: BorderSide(color: Colors.red)));
}