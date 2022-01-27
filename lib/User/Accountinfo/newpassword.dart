import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/User/Details/responsive_ui.dart';
import '../MainScreen.dart';


class Newpassword extends StatelessWidget {
  Newpassword(String email);

  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      home: new NewpasswordHomepage(),
    );
  }

}

class NewpasswordHomepage extends StatefulWidget {
  @override
  _NewpasswordState createState() => _NewpasswordState();
}

class _NewpasswordState extends State<NewpasswordHomepage> {

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
  //   final response = await http.post(Uri.parse("https://androiddatabase2021.000webhostapp.com/Hwappy/newpassword.php"), body: {
  //     "olduser": email,
  //     "newpass": pass.text,
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


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back,color: Colors.white),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => Newpassword(_email)));
          },
        ),
        backgroundColor: Color(0xFFA90725),
        elevation: 0,
        title: Text("Make Your Password Strong..."),
        actions: <Widget>[

        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
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
                    child: Text("Kindly enter your new password with minimum 8 characters to be make strong",
                        style: TextStyle(fontSize: 21,color: Color(0xFF384668)))),
                Padding(
                  padding: EdgeInsets.all(2.0),
//                child: Text('Hello World!'),
                ),
                _buildUserPassword(),
                Padding(
                  padding: EdgeInsets.all(6.0),
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
      obscureText: true,
      validator: (value) =>
      value!.length <= 6 ? "Password must be 6 or more characters in length" : null,
      style: TextStyle(
          color: Color(0xFF384668), fontFamily: 'RadikalLight'),
      decoration:
      _buildInputDecoration("Password", ''),

    );
  }

  // Login Button //

  _buildLoginButton(BuildContext context) {

    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.push(context, MaterialPageRoute(builder: (_)=>Profilepages(_email)));
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Apply Changes..."),backgroundColor: Color(0xFF384668)),
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
        child: Text("Conform",style: TextStyle(fontSize: _large? 14: (_medium? 12: 10))),
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
      hintStyle: TextStyle(color:Color(0xFF384668)),

      errorStyle: TextStyle(color: Colors.red),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.red)
      ),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(color: Colors.red)));
}