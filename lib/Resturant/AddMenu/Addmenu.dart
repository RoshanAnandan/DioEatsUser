import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../Resturantmainscreen.dart';
import 'Addmenulist.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  late String email;

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        home:Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back,color: Colors.white),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ResturantMainscreen(email)));
              },
            ),
            backgroundColor: Color(0xFF384668),
            elevation: 0,
            title: Text("Add Your Menu...",

          )),
          body: Container(
            color: Color(0xFFF6F8FC),
            child: Column(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: MenuMainListView(),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            elevation: 4,
            backgroundColor: Color(0xFF384668),
            child: Icon(
              Icons.add,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Resturantmenulist(),
                ),
              );
            },
          ),
        )
    );
  }
}

class Studentdata {

  String studentName;
  String studentPhoneNumber;
  String studentSubject;

  Studentdata({
    required this.studentName,
    required this.studentPhoneNumber,
    required this.studentSubject
  });

  factory Studentdata.fromJson(Map<String, dynamic> json) {
    return Studentdata(
        studentName: json['Hwappy_AB_Title'],
        studentPhoneNumber: json['Hwappy_AB_Describe'],
        studentSubject: json['Hwappy_AB_Image']

    );
  }
}

class MenuMainListView extends StatefulWidget {

  MainListViewState createState() => MainListViewState();

}

class MainListViewState extends State {

  // final String apiURL = 'https://androiddatabase2021.000webhostapp.com/Hwappy/aboutus.php';
  //
  // Future<List<Studentdata>> fetchStudents() async {
  //
  //   var response = await get(Uri.parse(apiURL));
  //
  //   if (response.statusCode == 200) {
  //
  //     final items = json.decode(response.body).cast<Map<String, dynamic>>();
  //
  //     List<Studentdata> studentList = items.map<Studentdata>((json) {
  //       return Studentdata.fromJson(json);
  //     }).toList();
  //
  //     return studentList;
  //   }
  //   else {
  //     throw Exception('Failed to load data from Server.');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Studentdata>>(
      // future: fetchStudents(),
      builder: (context, snapshot) {

        if (!snapshot.hasData) return Center(
            child: CircularProgressIndicator()
        );
        return ListView(
          children: snapshot.data!
              .map((data) => Column(children: <Widget>[
            GestureDetector(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Padding(
                      child: Image.network(data.studentSubject),
                      padding: EdgeInsets.only(bottom: 8.0),
                    ),

                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 5, 0, 5),
                        child: Text(data.studentName,
                            style: TextStyle(fontSize: 20,fontStyle: FontStyle.normal,color: Colors.black),
                            textAlign: TextAlign.left))

                  ]),),
            Padding(
                child: Text(
                  data.studentPhoneNumber,
                  style: new TextStyle(fontStyle: FontStyle.normal,color: Colors.black),
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.all(3.0)),

            Divider(color: Colors.blueAccent),
          ],))
              .toList(),
        );
      },
    );
  }
}

