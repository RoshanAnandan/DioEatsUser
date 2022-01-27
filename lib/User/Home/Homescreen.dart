import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'menulist.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: TeamsPage(),
        ));
  }
}

class Contact {
  final String name, mobile;

  Contact(this.name, this.mobile);
}

class TeamsPage extends StatefulWidget {
  const TeamsPage({Key? key}) : super(key: key);

  @override
  _TeamsState createState() => _TeamsState();
}

class _TeamsState extends State<TeamsPage> {
  TextEditingController editingController = TextEditingController();
  List words = [
    Contact("1.John Doe", "+91 9658245236"),
    Contact("2.Matt Brittin", "+91 9658245236"),
    Contact("3.Mark William", "+91 9658245236"),
    Contact("4.Adam Jones ", "+91 9658245236"),
    Contact("5.Serina William", "+91 9658245236"),
    Contact("6.Kate William", "+91 9658245236"),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    //   appBar: AppBar(centerTitle:true,title: Text("HomeScreen"),
    //     backgroundColor: Color(0xFFA90725),
    // ),
        body:
            // SingleChildScrollView(child:
            //  ListView(
            //    children:[ TextField(
            //      cursorWidth: 10,
            //      onChanged: (value) {
            //        setState(() {});
            //      },
            //      style: const TextStyle(fontSize: 10),
            //      controller: editingController,
            //      decoration: const InputDecoration(
            //          prefixIcon: Icon(
            //            Icons.search,
            //          ),
            //          border: OutlineInputBorder(
            //            borderRadius: BorderRadius.all(
            //              Radius.circular(10),
            //            ),
            //          ),
            //          hintText: ""),
            //    ),
            //   const SizedBox(height: 10),
            //   Text(
            //     "Restuarnts Around You ",
            //     style: TextStyle(
            //         fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            //     textAlign: TextAlign.center,
            //   ),
            ListView.builder(
                padding: const EdgeInsets.all(0.5),
                itemCount: words.length,
                itemBuilder: (context, index) {
                  return
                      // Card(
                      // shadowColor: Colors.white60,
                      // elevation: 20,
                      // shape: RoundedRectangleBorder(
                      //     borderRadius: BorderRadius.circular(20)),
                      // child:
                      // InkWell(
                      //                                   splashColor: Colors.orange,
                      //                                   onTap: () {
                      //                                     print("menu");
                      //                                     Navigator.push(
                      //                                         context,
                      //                                         MaterialPageRoute(
                      //                                             builder: (_) => Categories()));
                    InkWell(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MenuList()));
                        },
                        child:
                      Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const SizedBox(height: 10),
                            const Text(
                              "Restaurants  ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            const Center(
                              child: Image(
                                width: 1000,
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  "assets/foodres.jpg",
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Divider(height: 10),
                            Row(
                              children: [
                                Text(
                                  "Hotel Name",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.black),
                                ),
                                SizedBox(width: 100),
                                IconButton(
                                    color: Colors.red,
                                    icon: Icon(Icons.favorite_outline_outlined,
                                        color: Colors.red),
                                    onPressed: () {}),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "Menu List",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w100,
                                      color: Colors.black),
                                ),
                                SizedBox(width: 190),
                                Container( decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(color: Colors.green, spreadRadius: 3),
                                  ],
                                ),
                                  width: 35,
                                  height: 20,
                                  child: Text(
                                    "5.67k",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w100,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Divider(thickness: 0.5,),
                            Center(
                              child: Text(
                                "Hotel Address",textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w100,
                                    color: Colors.black),
                              ),
                            ),
                          ]),
                    ),
                  ));
                }));
    // )));
  }
}
