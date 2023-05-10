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
  String level = "---";

  getUserDetails() async {
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
    await LocalDB.getLevel().then((value) {
      setState(() {
        level = value.toString();
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
      drawer: SideNavBar(name, money, rank, profileUrl, level),
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
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.yellowAccent,
                      radius: 35,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 10,
                              child: Container(
                                height: 180,
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                              child: Container(
                                height: 180,
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: [
                    Flexible(
                        fit: FlexFit.tight,
                        flex: 1,
                        child: Stack(
                          children: [
                            Card(
                              elevation: 10,
                              child: Container(
                                height: 180,
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
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
                              child: Container(
                                height: 180,
                                child: Image.network(
                                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  children: [
                    Card(
                      elevation: 10,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 120,
                        child: Image.network(
                          "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Top Players In This Week",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                    ),
                    Text(
                      "Last updated 5 days ago",
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CircleAvatar(backgroundColor: Colors.grey, radius: 50),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Yuvraj Singh",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Player ID- 100",
                            ),
                            Text(
                              "Money- Rs, 10 Crore",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        "Unlock New Quizzes",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w600),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 10,
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 10,
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 10,
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 10,
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 10,
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Row(
                      children: [
                        Flexible(
                            fit: FlexFit.tight,
                            flex: 1,
                            child: Stack(
                              children: [
                                Card(
                                  elevation: 10,
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
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
                                  child: Container(
                                    height: 180,
                                    child: Image.network(
                                      "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Stack(
                      children: [
                        Card(
                          elevation: 10,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            child: Image.network(
                              "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
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
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 35,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 35,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 35,
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.purpleAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 35,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.greenAccent,
                      radius: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
            ],
          ),
        ),
      ),
    );
  }
}
