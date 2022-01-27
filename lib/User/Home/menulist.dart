import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuList extends StatefulWidget {
  @override
  _MenuListState createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          minimum: EdgeInsets.all(15),
          child: Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text(
                'HOTEL KINGS DHARBAR',
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 25,
                    color: Color(0xFFA90725),),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  'Shawarma,Fried Rice ,Noodles',
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(color: Colors.black12, spreadRadius: 3),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "4.5",
                        ),
                        Divider(
                          color: Colors.red,
                          thickness: 10,
                        ),
                        Text(
                          "Likes",
                        ),
                      ],
                    )),
              ]),
              SizedBox(height: 10),
              Text(
                'Trichy',
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.black),
              ),
              Divider(),
              Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.all(5),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return  Row(children: [
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                        "Hotel Name",
                                        style: TextStyle(
                                          color: Color(0xFFA90725),
                                          fontSize: 20,
                                        ),
                                      ),
                                    SizedBox(height: 10),
                                     Text(
                                        "Item Name ",
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.black),
                                      ),
                                    Text(
                                      "₹ Price ",
                                      style: TextStyle(
                                          fontSize: 10, color: Colors.black),
                                    ),
                                  ]),
                              SizedBox(height: 20,width:70),
                              Column(children: [
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage("assets/foodres.jpg"),
                                        filterQuality: FilterQuality.high,
                                        fit: BoxFit.scaleDown),
                                  ),
                                  height: MediaQuery.of(context).size.width / 3,
                                  width: MediaQuery.of(context).size.width / 3,
                                  alignment: Alignment.bottomCenter,
                                ),
                                Container(
                                  color:Colors.blueGrey[100],
                                  child: Row(children: [SizedBox(width:20),
                                    Text("ADD"),
                                  TextButton(
                                    onPressed: _incrementCounter,
                                    child: Icon(Icons.add),
                                  ),
                                  Text(
                                    '$_counter',
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.black),
                                  ),
                                  const SizedBox(height: 10),
                              ]),
                                ),
                            ]),

                        ]);

                      })),
              const Divider(
                color: Colors.red,
              ), ],
          )),


        )));
  }
}
