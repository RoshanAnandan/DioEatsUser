import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body:TeamsPage(
          ),

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
  int _counter = 0;
  List words = [
    Contact("1.John Doe", "+91 9658245236"),
    Contact("2.Matt Brittin", "+91 9658245236"),
    Contact("3.Mark William", "+91 9658245236"),
  ];


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
    return Scaffold(appBar: AppBar(centerTitle:true,title: Text("Category"),
      backgroundColor: Color(0xFFA90725),
    ),
        body: SingleChildScrollView(child:
        ConstrainedBox(
            constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
            child:   Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
             SizedBox(height:50),
                  Container(
                    height: 150.0,
                    child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Card(
                            elevation: 5.0,
                            child: Container(
                              decoration:   BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/nonvegst.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.medium ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child:  Text("Non Veg Staters",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            child: Container(
                              decoration:   BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/noodles.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.low ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child:  Text("Noodles",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            child:Container(
                              decoration:  BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/Tandoori.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.high ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child: const Text("Tandoori chicken",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          ),
                          Card(
                            elevation: 5.0,
                            child: Container(
                              decoration:  BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/nongrav.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.high ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child: const Text("Non Veg Gravy",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                            ),
                            ),
                          Card(
                            elevation: 5.0,
                            child: Container(
                              decoration:  BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/tif.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.high ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child: const Text("Tiffin ",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                            ),
                            ),
                            Card(
                            elevation: 5.0,
                            child: Container(
                              decoration:  BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/parotta.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.high ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child: const Text("Parotta ",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          ),  Card(
                            elevation: 5.0,
                            child:Container(
                              decoration:  BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/veggrav.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.high ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child: const Text("Veg Gravy  ",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                  ),
                          ),Card(
                            elevation: 5.0,
                            child: Container(
                                decoration:  BoxDecoration(
                                    image:  DecorationImage(
                                      image:  AssetImage("assets/shawarma.jpg"),
                                        colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                      filterQuality:FilterQuality.low ,
                                      fit: BoxFit.cover
                                    ),
                                ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child: const Text("Shawarma  ",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          ),Card(
                            elevation: 5.0,
                            child: Container(
                              decoration:  BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/vegstat.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.high ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child: const Text("Veg Staters  ",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,
                                fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          ),Card(
                            elevation: 5.0,
                            child: Container(
                              decoration:  BoxDecoration(
                                image:  DecorationImage(
                                    image:  AssetImage("assets/vegfri.jpg"),
                                    colorFilter:  ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
                                    filterQuality:FilterQuality.high ,
                                    fit: BoxFit.cover
                                ),
                              ),
                              height: MediaQuery.of(context).size.width / 3,
                              width: MediaQuery.of(context).size.width / 3,
                              alignment: Alignment.bottomCenter,
                              child: const Text("Fried Rice  ",overflow:TextOverflow.clip,style:TextStyle(fontWeight:FontWeight.bold,color:Colors.white,fontSize: 20),textAlign: TextAlign.center,),
                            ),
                          ),
                        ]),
                  ),const SizedBox(height:20),
                  Center(
                    child: Text(
                      "Category Name",
                      style: TextStyle(fontWeight:FontWeight.bold,color: Color(0xFFA90725),
                        fontSize: 20, ),
                    ),
                  ),   Divider(thickness: 0.5,),
                  Expanded(
                      child: ListView.builder(
                          padding: const EdgeInsets.all(15),
                          itemCount: words.length,
                          itemBuilder: (context, index) {
                            return Container(padding: EdgeInsets.all(10),
                                      child: Row(
                                        children: [   const FittedBox(
                                          fit: BoxFit.contain, child:
                                        Center(
                                          child: Image(height:100,width:100,
                                            image: AssetImage("assets/foodres.jpg"),
                                          ),
                                        ),
                                        ),
                                          SizedBox(width:10,),
                                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                                              children: const [
                                                SizedBox(height: 10), Center(
                                                  child: Text(
                                                    "Hotel Name",
                                                    style: TextStyle(color: Color(0xFFA90725),
                                                        fontSize: 20, ),
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Center(
                                                  child: Text(
                                                    "Item Name ",
                                                    style: TextStyle(
                                                        fontSize: 10, color: Colors.black),
                                                  ),
                                                ),
                                                Text(
                                                  "₹ Price ",
                                                  style: TextStyle(
                                                      fontSize: 10, color: Colors.black),
                                                ),]),
                                          TextButton(
                                            onPressed: _incrementCounter,
                                            child: Icon(Icons.add),
                                          ),
                                                 Text(  '₹$_counter', style: const TextStyle(
                                                    fontSize: 15, color: Colors.black),),
                                                const SizedBox(height: 10),
                                              ]),
                                    );
                          }))
                ] ))));

  }
}



