import 'package:flutter/material.dart';

class SideNavBar extends StatelessWidget {
  const SideNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: const Color.fromRGBO(255, 165, 0, 40),
          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  children: [
                    CircleAvatar(radius: 40, backgroundColor: Colors.white),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Yuvraj Singh", style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),),
                        SizedBox(height: 10,),
                        Text("Rs. 1lac", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),)
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Leaderboard - 1st pos", style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 40,),
              listItem(
                label : "Daily Quiz",
                icon : Icons.quiz
              ),
              listItem(
                  label : "Leaderboard",
                  icon : Icons.leaderboard
              ),
              listItem(
                  label : "How to use",
                  icon : Icons.question_answer
              ),
              listItem(
                  label : "About us",
                  icon : Icons.face
              ),
            ],
          ),
      ),
    );
  }

  Widget listItem({required String label, required IconData icon}) {
    const color = Colors.white;
    const hoverColor = Colors.white60;

    return ListTile(
      leading: Icon(icon, color: hoverColor, size: 30,),
      hoverColor: hoverColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 20,),
      title: Text(label, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white70)),
      onTap: (){

      },
    );
  }
}
