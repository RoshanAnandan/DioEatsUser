// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/User/Accountinfo/forgotpassword.dart';
import 'package:untitled/User/Details/custom_shape.dart';
import 'package:untitled/User/Details/responsive_ui.dart';
import 'package:untitled/User/Details/signup.dart';

import '../Resturantmainscreen.dart';

class ResturantSignin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool checkBoxValue = false;
  late double _height;
  late double _width;
  late double _pixelRatio;
  late bool _large;
  late bool _medium;

  bool visible = false;

  TextEditingController user = new TextEditingController();
  TextEditingController pass = new TextEditingController();

  late SharedPreferences logindata;
  late bool newuser;

  String? _email;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // Future<String> _login() async {
  //
  //   setState(() {
  //     visible = true ;
  //   });
  //
  //   print(user.text);
  //
  //   final response = await http.post(Uri.parse("https://androiddatabase2021.000webhostapp.com/Hwappy/login.php"), body: {
  //     "user": user.text,
  //     "pass": pass.text,
  //   });
  //
  //
  //
  //   var datauser = json.decode(response.body.toString());
  //   print(datauser);
  //
  //   if(datauser=="Not Login"){
  //     setState(() {
  //       print("Not Login");
  //       visible = false;
  //     });
  //   }else{
  //     print(user.text);
  //     print("Login sucess");
  //
  //     final prefs = await SharedPreferences.getInstance();
  //     await prefs.setString('counter', user.text);
  //     print(prefs.getString('counter'));
  //     Navigator.push(context, MaterialPageRoute(builder: (context)=>Sucessscreen(user.text))
  //     );
  //
  //   }
  //
  //   return datauser;
  // }

  void showInSnackBar(String value) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(value)));
  }

  final _formKey = new GlobalKey<FormState>();
  String? _password;
  // final auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(
                  opacity: 0.88,
                  child: AppBar(
                    backgroundColor: Color(0xFFA90725),
                    title: Text("Sign In Here..."),
                  ),
                ),
                clipShape(),
                welcomeTextRow(),
                signInTextRow(),
                form(),
                // acceptTermsTextRow(),
                forgetPassTextRow(),
                SizedBox(height: _height / 12),
                button(),
                signUpTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //Clip Shape //

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
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
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
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

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large ? 60 : (_medium ? 50 : 40),
              color: Color(0xFF1F1C1D),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Lets Search For Best Food...",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
              color: Color(0xFF3F3C3D),
            ),
          ),
        ],
      ),
    );
  }

  //Form Page//

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            _buildUserEmail(),
            SizedBox(height: _height / 40.0),
            _buildUserPassword(),
          ],
        ),
      ),
    );
  }

  //Forgot Option//
  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot Password?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey[400],
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => Forgotpassword(_email!)));
            },
            child: Text(
              "Recover",
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
            ),
          )
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
          print(_email);
          print(_password);
          // auth.signInWithEmailAndPassword(email: _email!, password: _password!).then((value){
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>ResturantDashboard()));
          // }).catchError((onError){
          //   if(onError.toString().contains("The user may have been deleted")){
          //     print("User is not in DB, Please register as a new one.");
          //   }else{
          //     print(onError.toString());
          //   }
          // });
          // auth.createUserWithEmailAndPassword(email: _email, password: _password!).then((_){
          //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Sucessscreen(user.text)));
          // });

        } else {
          showInSnackBar("Incorrect credentials");
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Color(0xFF9B0437), Color(0xFF9B0437)],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text("Login Here",
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.grey[400],
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => Signup()));
            },
            child: Text(
              "SignUp Here",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.red,
                  fontSize: _large ? 19 : (_medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }

  //  Email id  for login //

  _buildUserEmail() {
    return TextFormField(
        keyboardType: TextInputType.emailAddress,
        controller: user,
        validator: (value) => !isEmail(value!)
            ? "Sorry, we do not recognize this email address"
            : null,
        style: TextStyle(color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
        decoration: _buildInputDecoration(
            Icon(Icons.email, color: Color(0xFF3F3C3D)), "Email-Id"),
        onChanged: (value) {
          setState(() {
            _email = value.trim();
          });
        });
  }

  // Passord for login  //

  _buildUserPassword() {
    return TextFormField(
        controller: pass,
        obscureText: true,
        validator: (value) => value!.length <= 6
            ? "Password must be 6 or more characters in length"
            : null,
        style: TextStyle(color: Color(0xFF3F3C3D), fontFamily: 'RadikalLight'),
        decoration: _buildInputDecoration(
            Icon(Icons.lock, color: Color(0xFF3F3C3D)), "Password"),
        onChanged: (value) {
          setState(() {
            _password = value.trim();
          });
        });
  }
}

InputDecoration _buildInputDecoration(Icon IconData, String hint) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.blue)),
      labelText: hint,
      prefixIcon: IconData,
      border: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.blue)),
      hintStyle: TextStyle(color: Colors.blue),
      errorStyle: TextStyle(color: Colors.red),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.blue)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.blue)));
}
