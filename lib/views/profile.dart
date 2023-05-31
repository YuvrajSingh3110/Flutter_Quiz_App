import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/services/localdb.dart';

class Profile extends StatefulWidget {
  String name;
  String profileUrl;
  String rank;
  String level;
  String money;

  Profile({
    required this.name,
    required this.profileUrl,
    required this.rank,
    required this.level,
    required this.money,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late List<QueryDocumentSnapshot<Map<String, dynamic>>> leaderboard;
  getLeaderboard() async {
    await FirebaseFirestore.instance
        .collection("User")
        .orderBy("money")
        .get()
        .then((value) {
      setState(() {
        leaderboard = value.docs.reversed.toList();
        widget.rank = (leaderboard.indexWhere((element) => element.data()["name"] == widget.name)+1).toString();
      });
    });
    await LocalDB.saveRank(widget.rank);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLeaderboard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.share)),
          IconButton(onPressed: () {}, icon: Icon(Icons.person_add))
        ],
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Stack(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(widget.profileUrl),
                          radius: 50),
                      Positioned(
                        right: 0.0,
                        bottom: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                          child: Icon(
                            Icons.edit,
                            color: Colors.orangeAccent,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.name,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Rs.${widget.money}",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            widget.level,
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w300),
                          ),
                          Text("Level",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            "#${widget.rank}",
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white.withOpacity(0.9),
                                fontWeight: FontWeight.w300),
                          ),
                          Text("Rank",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white.withOpacity(0.9),
                                  fontWeight: FontWeight.w500))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(20),
                child: Text(
                  "Leaderboard",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                )),
            RefreshIndicator(
              onRefresh: () async{
                getLeaderboard();
              },
              child: SizedBox(
                height: 370,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: leaderboard.length,
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.orange.withOpacity(0.3),
                    thickness: 1,
                    indent: 10,
                    endIndent: 10,
                  ),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        "#${index + 1}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      contentPadding: EdgeInsets.only(left: 20, right: 20),
                      title: Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                NetworkImage(leaderboard[index].data()["photoUrl"]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(leaderboard[index].data()["name"]),
                        ],
                      ),
                      trailing: Text(
                        "Rs.${leaderboard[index].data()["money"]}",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
