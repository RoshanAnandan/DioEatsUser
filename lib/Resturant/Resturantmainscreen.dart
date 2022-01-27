import 'package:flutter/material.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/User/Accountinfo/accountview.dart';
import 'package:untitled/User/OrderList/orderpage.dart';


class ResturantMainscreen extends StatelessWidget {

  ResturantMainscreen(String email);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,

      home:  ResturantDashboard(),

    );
  }

}


class ResturantDashboard extends StatefulWidget {

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<ResturantDashboard > with TickerProviderStateMixin{
  int _selectedIndex = 0;
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



  final List<Widget> _children = <Widget>[
     // HomeScreen(),
    // Cateogiries(),
  OrderHistory(),
    Accountview()
  ];


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> _children_title = <String>["Homepage",
      "Cateogry",
      "Order History",
      "My Account"
    ];
    return Scaffold(
      appBar :AppBar(
        title: Text(_children_title.elementAt(_selectedIndex)),
        backgroundColor: Color(0xFFA90725),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout,color: Colors.white),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => ResturantMainscreen(_email)));
            },
          ),
        ],
      ),
      body: Center(
        child: _children.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
          items:  <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.restaurant_menu,color: Colors.white),
                title: Text("Home"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.category_rounded,color: Colors.white),
                title: Text("Categories"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.reorder,color: Colors.white),
                title: Text("Order History"),
                backgroundColor: Color(0xFFA90725)),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_circle_sharp,color: Colors.white),
                title: Text("Account Info"),
                backgroundColor: Color(0xFFA90725)),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.black87,
          selectedItemColor: Colors.white,
          iconSize: 30,
          onTap: _onItemTapped,
          elevation: 5
      ),
    );
  }
}