import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/User/MainScreen.dart';
import 'Resturant/Details/signin.dart';
import 'User/Details/signin.dart';



class LandingPage extends StatefulWidget {
  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  
  String validateemail='';
  @override
  void initState() {
    // TODO: implement initState
    getvalidation().whenComplete(() async
    {
      if(validateemail!=''){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Profilepages(validateemail)));
      }
    }
    );
    super.initState();
  }

  Future getvalidation() async {
    final SharedPreferences pref=await SharedPreferences.getInstance();
    pref.setBool('first', true);
    var mail=pref.getString('email');
    setState(() {
      validateemail=mail!;
    });
    print("validateemail:"+validateemail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFCA1F39),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: const <Widget>[Text(
                        "DIO EATS",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white),
                      ),
                  SizedBox(
                    height: 20,
                  ),

                      Text(
                        "Welcomes you all and make delicious..",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                ],
              ),
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/landingicon.jpg'))),
                  ),
              Column(
                children: <Widget>[
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 60,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UserSignin()));
                        },
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(50)),
                        child: const Text(
                          "Login as Customer",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18,color: Colors.white),
                        ),
                      ),
                  const SizedBox(
                    height: 20,
                  ),
                      Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ResturantSignin()));
                          },
                          shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.circular(50)),
                          child: const Text(
                            "Login as Resturant",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18,color: Colors.white),
                          ),
                        ),
                      )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}