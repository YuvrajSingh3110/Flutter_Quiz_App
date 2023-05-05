import 'package:flutter/material.dart';

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
                  SizedBox(height: 20,),
                  Stack(
                    children: [
                      CircleAvatar(
                          backgroundImage: NetworkImage(
                              widget.profileUrl),
                          radius: 50),
                      Positioned(
                        right: 0.0,
                        bottom: 0.0,
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white
                          ),
                          child: Icon(Icons.edit, color: Colors.orangeAccent,),
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
            SizedBox(
              height: 370,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: 20,
                separatorBuilder: (context, index) => Divider(color: Colors.orange.withOpacity(0.3), thickness: 1, indent: 10, endIndent: 10,),
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Text("#${index + 1}", style: TextStyle(fontWeight: FontWeight.w500),),
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    title: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1331&q=80"),
                        ),
                        SizedBox(width: 10,),
                        Text("Yato"),
                      ],
                    ),
                    trailing: Text(
                        "Rs.${(2000000 / (index + 1)).toString().substring(0, 7)}", style: TextStyle(fontWeight: FontWeight.w500),),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
