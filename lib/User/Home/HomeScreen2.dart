import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/User/Details/MenuScreen.dart';
import '../../const.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({Key? key}) : super(key: key);

  @override
  _HomeScreen2State createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  Widget categoriesContainer(
      { //required Function onTap,
      required String image,
      required String name}) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        children: [
          GestureDetector(
            // onTap: onTap(),
            child: Container(
              margin: EdgeInsets.only(left: 20),
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black, blurRadius: 0.5)],
                image: DecorationImage(image: NetworkImage(image)),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(children: [
          header(size),
          searchBar(size),
          SizedBox(
            height: 10,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                categoriesContainer(
                    image:
                        'https://github.com/FlutterBaba/Food-Ordering-App-Flutter-Firebase/blob/main/images/1.png?raw=true',
                    name: "All"),
                categoriesContainer(
                    image:
                        'https://github.com/FlutterBaba/Food-Ordering-App-Flutter-Firebase/blob/main/images/2.png?raw=true',
                    name: "Burger"),
                categoriesContainer(
                    image:
                        'https://github.com/FlutterBaba/Food-Ordering-App-Flutter-Firebase/blob/main/images/3.png?raw=true',
                    name: "Recipe"),
                categoriesContainer(
                    image:
                        'https://github.com/FlutterBaba/Food-Ordering-App-Flutter-Firebase/blob/main/images/4.png?raw=true',
                    name: "Pizza"),
                categoriesContainer(
                    image:
                        'https://github.com/FlutterBaba/Food-Ordering-App-Flutter-Firebase/blob/main/images/5.png?raw=true',
                    name: "Drink"),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: size.width / 1.1,
            child: Text(
              "Restaurants around you",
              style: TextStyle(
                  fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold
                  //fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          restaurantsAvalible(size)
        ]),
      ),
    );
  }

  Widget restaurantsAvalible(Size size) {
    // ignore: sized_box_for_whitespace
    return Container(
      width: size.width,
      height: size.height,
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: restaurantList.length,
          itemBuilder: (context, index) {
            return itemBuilder(size, index, context);
          }),
    );
  }

  Widget itemBuilder(Size size, int index, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => MenuScreen())),
        child: Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(18),
          child: Container(
            height: size.height / 2.5,
            width: size.width / 1.1,
            child: Column(
              children: [
                Container(
                  height: size.height / 4,
                  width: size.width / 1.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18),
                    ),
                    image: DecorationImage(
                        image: NetworkImage(restaurantList[index].imageUrl),
                        fit: BoxFit.cover),
                  ),
                ),
                Container(
                  height: size.height / 12,
                  width: size.width / 1.2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        restaurantList[index].title,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        height: size.height / 25,
                        width: size.width / 7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green,
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          restaurantList[index].rating,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: size.width / 1.2,
                  child: Text(
                    "${restaurantList[index].locations}   \t\t\t\t\t\t\t\t\t\t\t\t\t\t  ${restaurantList[index].price} for one",
                    style: TextStyle(
                      fontSize: 12.9,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar(Size size) {
    return Container(
      height: size.height / 15,
      width: size.width / 1.1,
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          SizedBox(
            width: size.width / 40,
          ),
          Icon(Icons.search, color: Colors.red),
          SizedBox(
            width: size.width / 20,
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Restaurant name, cuisine, or a dish..."),
            ),
          ),
        ],
      ),
    );
  }

  Widget header(Size size) {
    return Container(
      height: size.height / 10,
      width: size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(
              Icons.add_location,
              color: Colors.black,
            ),
          ),
          Text(
            "Add Your Location Here",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
