import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/User/Details/responsive_ui.dart';
import 'package:untitled/User/Details/signin.dart';
import 'newpassword.dart';



class Forgotpassword extends StatelessWidget {
  Forgotpassword(String _email);

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new ForgotpasswordHomepage(),
    );
  }

  ThemeData buildTheme() {
    final ThemeData base = ThemeData();
    return base.copyWith(
      hintColor: Color(0xFF384668),
      primaryColor: Color(0xFF384668),
      inputDecorationTheme: InputDecorationTheme(
        hintStyle: TextStyle(
          color: Color(0xFF384668),
        ),
        labelStyle: TextStyle(
          color: Color(0xFF384668),
        ),
      ),
    );
  }
}

class ForgotpasswordHomepage extends StatefulWidget {
  @override
  _ForgotpasswordState createState() => _ForgotpasswordState();
}

class _ForgotpasswordState extends State<ForgotpasswordHomepage> {

  bool visible = false ;
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;

  TextEditingController pass=new TextEditingController();

   late String _email ;

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

  // Future<String> _login() async {
  //
  //   setState(() {
  //     visible = true ;
  //   });
  //
  //   var data = {'emailid': email};
  //   print(data);
  //
  //   final response = await http.post(Uri.parse("https://androiddatabase2021.000webhostapp.com/Hwappy/oldpassword.php"), body: {
  //     "oldpassword": pass.text,
  //   });
  //
  //   var datauser = json.decode(response.body.toString());
  //   print(datauser);
  //
  //   if(datauser=="Not Success"){
  //     setState(() {
  //       print("Not Success");
  //       visible = false;
  //     });
  //   }else{
  //     print(email);
  //     print("Success");
  //
  //     Navigator.push(context, MaterialPageRoute(builder: (_)=>Newpassword(email))
  //     );
  //
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


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => UserSignin()));
          },
        ),
        backgroundColor: Color(0xFFA90725),
        elevation: 0,
        title: Text("Forgot Password"),
        actions: <Widget>[
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(2.0),
//                child: Text('Hello World!'),
                    child: Text("Get in to your registered  emailid for reset Your Password",
                        style: TextStyle(fontSize: 21,color:Color(0xFF384668)))),
                Padding(
                  padding: EdgeInsets.all(2.0),
//                child: Text('Hello World!'),
                ),
                _buildUserPassword(),
                Padding(
                  padding: EdgeInsets.all(4.0),
//                child: Text('Hello World!'),
                ),
                _buildLoginButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Passord for login  //

  _buildUserPassword() {
    return TextFormField(
      controller: pass,
      obscureText: false,
      validator: (value) =>
      value!.length <= 6 ? "Password must be 6 or more characters in length" : null,
      style: TextStyle(
          color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
      decoration:
      _buildInputDecoration("Email-Id", ''),
      onSaved: (val) {
        _email = val!;
      },
    );
  }

  // Login Button //

  _buildLoginButton(BuildContext context) {

    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => Newpassword(_email)));

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Fetching Your Details...."),
                backgroundColor: Color(0xFF384668)),
          );
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large? _width/4 : (_medium? _width/3.75: _width/3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Color(0xFF9B0437), Color(0xFF9B0437)],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text("Next->",style: TextStyle(fontSize: _large? 14: (_medium? 12: 10))),
      ),
    );

  }
}
InputDecoration _buildInputDecoration(String hint, String iconPath) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Color(0xFF384668))
      ),

      labelText: hint,


      border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Color(0xFF384668))
      ),
      hintStyle: TextStyle(color: Color(0xFF384668)),

      errorStyle: TextStyle(color: Colors.red.shade900),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.red)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.red)));
}