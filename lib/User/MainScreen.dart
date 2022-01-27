import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/User/Accountinfo/wishlist.dart';
import 'Accountinfo/accountview.dart';
import 'Categories/categories.dart';
import 'Home/HomeScreen2.dart';
import 'Home/Homescreen.dart';
import 'OrderList/orderpage.dart';

class Profilepages extends StatelessWidget {
  Profilepages(String _email);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  String? email;

  // Future<Null> getSharedPrefs() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   print("email");
  //   setState(() {
  //     email =  prefs.getString("counter")!;
  //     print(email);
  //   });
  //
  // }
  //
  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  final List<Widget> _children = <Widget>[
    HomeScreen2(),
    WishList(),
    OrderHistory(),
    Accountview(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final List<String> _children_title = <String>["Homepage",
    //   "Cateogry",
    //   "Order History",
    //   "My Account"
    // ];
    return Scaffold(
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu, color: Colors.white),
                title: Text("Home"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.favorite, color: Colors.white),
                title: Text("Wishlist"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.reorder, color: Colors.white),
                title: Text("Order History"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp, color: Colors.white),
                title: Text("Account Info"),
                backgroundColor: Color(0xFFA90725)),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black87,
          selectedItemColor: Colors.white,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5),
    );
  }
}
