import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../payment.dart';

class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Order"),
        backgroundColor: Color(0xFFA90725),
      ),
      backgroundColor: Colors.grey[200],
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/foodres.jpg"),
                    colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.7), BlendMode.dstATop),
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.scaleDown),
              ),
              height: MediaQuery.of(context).size.width / 3,
              width: MediaQuery.of(context).size.width / 3,
              alignment: Alignment.bottomCenter,
            ),
            SizedBox(height: 10),
            const Center(
              child: Text(
                'HOTEL NAME',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            ListTile(
              title:  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height:10),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text("Order ID"),Text("56536798",),]),
                    SizedBox(height:10),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text("Order Name"),Text("ABCDEF"),]),
                    SizedBox(height:10),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text("Order Address"),Text("TRICHY"),]),
                    SizedBox(height:10),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text("Order Date"),Text("MM/DD/YYYY"),]),
                    SizedBox(height:10),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text("Product Name"),Text("Veg Rice"),]),
                    SizedBox(height:10),
                    Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,children:[Text("Total Price "),Text("₹"),])
                   , Text(
                      ' Add Address',
                      style: const TextStyle(
                          fontSize: 15, color: Colors.black),
                    ),
                  ],
                ),
              ),
            SizedBox(height: 10),
            SizedBox(height:70),
            ButtonTheme(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0))),
              height: 50.0,
              minWidth: 160.0,
              child: RaisedButton(
                color: Color(0xff313134),
                onPressed: () {  Navigator.push(
                    context, MaterialPageRoute(builder: (_) => PaymentPage()));},
                child: Text(
                  'Confirm Order And Pay ',
                  style: TextStyle(
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ])),
    );
  }
}
//     // List? itemList;
//   // void listOrderItems(context) async {
//   //   Object? args = ModalRoute.of(context)?.settings.arguments;
//   //   for(var items in args!['data']){
//   //     int? total = 0;
//   //     for(int i =0; i< items['orderDetails'].length;i++){
//   //       total = (total! + items['orderDetails'][i]['quantity'] * items['orderDetails'][i]['price']) as int?;
//   //     }
//   //     items['totalPrice'] = total.toString();
//   //   }
//   //   setState(() {
//   //   });
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
//     // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//     // bool showCartIcon = true;
//     // // listOrderItems(context);
//     return Scaffold(
//       backgroundColor: Colors.grey[200],
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.only(top:8.0),
//           child: ListView.builder(
//             // itemCount: itemList.length,
//             itemBuilder: (BuildContext context, int index){
//               // List item = itemList[index]['orderDetails'];
//               // String totalPrice = itemList[index]['totalPrice'];
//               // String orderedDate = timeago.format(itemList![index]['orderDate'].toDate(),locale: 'fr');
//               return Padding(
//                 padding: const EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 0.0),
//                 child: Card(
//                   elevation: 3.0,
//                   child: Column(
//                     children: <Widget>[
//                       Container(
//                         constraints: BoxConstraints.expand(
//                             height: 200.0
//                         ),
//                         decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: AssetImage("assets/foodres.jpg"),
//                                 fit: BoxFit.fill,
//                                 colorFilter: ColorFilter.mode(
//                                     Color.fromRGBO(90,90,90, 0.8),
//                                     BlendMode.modulate
//                                 )
//                             )
//                         ),
//                         child: Stack(
//                           children: const <Widget>[
//                             Padding(
//                               padding: EdgeInsets.all(8.0),
//                               child: Align(
//                                 alignment: Alignment.bottomRight,
//                                 child: Text(
//                                   'Ordered Date',
//                                   style: TextStyle(
//                                       fontSize: 18.0,
//                                       color: Colors.white,
//                                       letterSpacing: 1.0
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Center(
//                               child: Text(
//                                 'Order Placed',
//                                 style: TextStyle(
//                                   fontSize: 20.0,
//                                   fontFamily: 'Novasquare',
//                                   letterSpacing: 1.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: ClampingScrollPhysics(),
//                         itemBuilder: (BuildContext context, int itemIndex){
//                           return const ListTile(
//                             title: Text(
//                              "Product Name",
//                               style: TextStyle(
//                                   fontSize: 18.0,
//                                   fontWeight: FontWeight.w600
//                               ),
//                             ),
//                             subtitle: Text("₹ Price",
//                               // "\$ ${item[itemIndex]['price']}.00",
//                               style: TextStyle(
//                                   fontSize: 16.0,
//                                   fontWeight: FontWeight.w500
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: <Widget>[
//                           Text(
//                             "Total",
//                             style: TextStyle(
//                                 fontSize: 18.0,
//                                 fontWeight: FontWeight.bold
//                             ),
//                           ),
//                           // ButtonTheme(
//                           //   shape: RoundedRectangleBorder(
//                           //       borderRadius: BorderRadius.all(Radius.circular(7.0))
//                           //   ),
//                           //   height: 50.0,
//                           //   minWidth: 160.0,
//                           //   child:
//                   RaisedButton(
//                               color: Color(0xff313134),
//                               onPressed: (){ },
//                               child: Text(
//                                 'REORDER',
//                                 style: TextStyle(
//                                   fontSize: 17.0,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//
//                         ],
//                       ),
//                       SizedBox(height: 10.0)
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
