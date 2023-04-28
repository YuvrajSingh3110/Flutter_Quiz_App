import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:quiz_app/widgets/sideNavBar.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../services/localdb.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String name = "User Name";
  String money = "---";
  String rank = "---";
  String profileUrl = "";

  getUserDetails() async{
    await LocalDB.getName().then((value) {
      setState(() {
        name = value.toString();
      });
    });
    await LocalDB.getMoney().then((value) {
      setState(() {
        money = value.toString();
      });
    });
    await LocalDB.getRank().then((value) {
      setState(() {
        rank = value.toString();
      });
    });
    await LocalDB.getUrl().then((value) {
      setState(() {
        profileUrl = value.toString();
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUserDetails();
  }

  int currentPos = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orangeAccent),
      drawer: SideNavBar(name, money, rank, profileUrl),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    height: 100.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    scrollPhysics: BouncingScrollPhysics(),
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentPos = index;
                      });
                    },
                    autoPlayCurve: Curves.fastOutSlowIn),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber),
                          child: Text(
                            'text $i',
                            style: TextStyle(fontSize: 16.0),
                          ));
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                height: 200,
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black38,
                                )),
                            Padding(
                              padding: EdgeInsets.all(40),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Rs.50,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Flutter Quiz",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                height: 200,
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black38,
                                )),
                            Padding(
                              padding: EdgeInsets.all(40),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Rs.50,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Flutter Quiz",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                height: 200,
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black38,
                                )),
                            Padding(
                              padding: EdgeInsets.all(40),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.lock,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Rs.50,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Flutter Quiz",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Container(
                                height: 200,
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                                top: 0,
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  color: Colors.black38,
                                )),
                            Padding(
                              padding: EdgeInsets.all(40),
                              child: Align(
                                alignment: Alignment.center,
                                child: Column(
                                  children: const [
                                    Icon(
                                      Icons.lock,
                                      size: 50,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Rs.50,000",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      "Flutter Quiz",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        )),
                  ],
                ),
              ),
              Stack(
                children: [
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 150,
                      child: Image.network(
                        "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 0,
                      bottom: 15,
                      left: 5,
                      right: 5,
                      child: Container(
                        color: Colors.black38,
                      )),
                  Padding(
                    padding: EdgeInsets.all(40),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          Icon(
                            Icons.lock,
                            size: 50,
                            color: Colors.white,
                          ),
                          Text(
                            "Rs.50,000",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                          Text(
                            "Flutter Quiz",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white),
                          )
                        ],
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
