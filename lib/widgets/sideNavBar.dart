import 'package:flutter/material.dart';
import 'package:quiz_app/Views/login.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/views/home.dart';
import 'package:quiz_app/views/profile.dart';

class SideNavBar extends StatelessWidget {
  String name;
  String money;
  String rank;
  String profileUrl;
  String level;

  SideNavBar({required this.name, required this.money, required this.rank,
      required this.profileUrl, required this.level});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(255, 165, 0, 40),
        child: ListView(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(name: name, profileUrl: profileUrl, rank: rank, level: level, money: money)));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                    child: Row(
                      children: [
                        CircleAvatar(
                            backgroundImage: NetworkImage(profileUrl),
                            radius: 40),
                        const SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              name,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Rs. $money",
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "Leaderboard - #$rank",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            listItem(
                label: "Daily Quiz",
                icon: Icons.quiz,
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Home())),
            listItem(
                label: "Leaderboard",
                icon: Icons.leaderboard,
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Home())),
            listItem(
                label: "How to use",
                icon: Icons.question_answer,
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Home())),
            listItem(
                label: "About us",
                icon: Icons.face,
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Home())),
            listItem(
                label: "Logout",
                icon: Icons.logout,
                context: context,
                path: MaterialPageRoute(
                    builder: (BuildContext context) => Login())),
          ],
        ),
      ),
    );
  }

  Widget listItem(
      {required String label,
      required IconData icon,
      required BuildContext context,
      required MaterialPageRoute path}) {
    const color = Colors.white;
    const hoverColor = Colors.white60;

    return ListTile(
      leading: Icon(
        icon,
        color: hoverColor,
        size: 30,
      ),
      hoverColor: hoverColor,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      title: Text(label,
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white70)),
      onTap: () async {
        await signOut();
        Navigator.pushReplacement(context, path);
      },
    );
  }
}
