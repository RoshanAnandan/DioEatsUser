// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/User/Accountinfo/wishlist.dart';
import 'package:untitled/User/OrderList/orderpage.dart';
import 'dart:ui';
import 'editprofile.dart';
import 'logout.dart';

class Accountview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: UserProfile("_email"));
  }
}

class UserProfile extends StatefulWidget {
  UserProfile(String _email);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<State> _keyLoader = new GlobalKey<State>();
  bool showCartIcon = true;
  String? name;
  String? mobileNumber;
  String? email;

  void setProfileDetails(context) async {
    dynamic args = ModalRoute.of(context)?.settings.arguments;
    this.setState(() {
      name = args['fullName'];
      mobileNumber = args['mobileNumber'];
    });
  }

  void initState() {
    super.initState();
    name = '';
    mobileNumber = '';
    email = '';
  }

  @override
  Widget build(BuildContext context) {
    setProfileDetails(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AccountView"),
        backgroundColor: Color(0xFFA90725),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 20.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: ClipOval(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    child: CircleAvatar(
                      radius: 37,
                      backgroundColor: Colors.red[800]?.withOpacity(
                        0.4,
                      ),
                      child: IconButton(
                        alignment: Alignment.topCenter,
                        icon: const Icon(
                          Icons.person_outline,
                          color: Colors.red,
                          size: 35,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.0),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 40.0,
                  color: Colors.blueAccent,
                ),
                title: Text(
                  'Account Details',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right, color: Colors.red),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(builder: (_) => Editprofile()));
                    }),

                // async{
                // bool connectionStatus = await _userService.checkInternetConnectivity();
                //
                // if(connectionStatus){
                // dynamic args = ModalRoute.of(context)?.settings.arguments;
                // // String email = _userService.userEmail();
                // args['email'] = email;
                // Navigator.pushNamed(context, '/profile/edit',arguments: args);
                // }
                // else{
                // internetConnectionDialog(context);
                // }
                // },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.favorite,
                  size: 40.0,
                  color: Colors.red,
                ),
                title: Text(
                  'WishList',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right, color: Colors.red),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .push(MaterialPageRoute(builder: (_) => WishList()));
                    }),

                // async{
                // bool connectionStatus = await _userService.checkInternetConnectivity();
                //
                // if(connectionStatus){
                // Loader.showLoadingScreen(context, _keyLoader);
                // List userList = await _userService.userWishlist();
                // Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                // Navigator.pushNamed(context, '/wishlist',arguments: {'userList':userList});
                // }
                // else{
                // internetConnectionDialog(context);
                // }
                // },
              ),
              Divider(),
              ListTile(
                leading: const Icon(
                  Icons.fastfood,
                  color: Colors.blueGrey,
                  size: 40.0,
                ),
                title: Text(
                  'Order History',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right, color: Colors.red),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(builder: (_) => OrderHistory()));
                    }),
                // async{
                // bool connectionStatus = await _userService.checkInternetConnectivity();
                //
                // if(connectionStatus){
                // Loader.showLoadingScreen(context, _keyLoader);
                // List orderData = await _checkoutService.listPlacedOrder();
                // Navigator.of(_keyLoader.currentContext, rootNavigator: true).pop();
                // Navigator.popAndPushNamed(context, '/placedOrder',arguments: {'data': orderData});
                // }
                // else{
                // internetConnectionDialog(context);
                // }
                // },
              ),
              Divider(),
              ListTile(
                leading: Icon(
                  Icons.settings,
                  size: 40.0,
                  color: Colors.black26,
                ),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
                ),
                trailing: IconButton(
                    icon: Icon(Icons.keyboard_arrow_right, color: Colors.red),
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(builder: (_) => Editprofile()));
                    }),

                // async{
                // bool connectionStatus = await _userService.checkInternetConnectivity();
                //
                // if(connectionStatus){
                // Navigator.of(context).pushNamed('/profile/settings', arguments: userSettings.docs[0].data);
                // }
                // else{
                // internetConnectionDialog(context);
                // }
                //
                // },
              ),
              Divider(
                height: 10,
              ),
              SizedBox(height: 30.0),
              ButtonTheme(
                  minWidth: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true).push(
                          MaterialPageRoute(builder: (_) => LogOutPage()));
                    },
                    // _userService.logOut(context);
                    color: Colors.white,
                    child: Text(
                      'Logout',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black26, width: 2.0),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

void internetConnectionDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          child: Container(
            height: 300,
            // width: 100,
            child: Padding(
              padding: EdgeInsets.all(5.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.signal_wifi_off,
                    size: 60.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Oops!',
                      style: TextStyle(
                        fontFamily: 'NovaSquare',
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'No internet connection found',
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ),
                  Text(
                    'Check your connection',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 50.0,
                      child: ElevatedButton(
                        child: Text(
                          'Close',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}
