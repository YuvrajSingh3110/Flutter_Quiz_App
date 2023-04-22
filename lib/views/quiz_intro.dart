import 'package:flutter/material.dart';

class QuizIntro extends StatelessWidget {
  const QuizIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text("START"),
        onPressed: () {

        },
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "Quiz Name",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Image.network(
                  "https://img.freepik.com/free-vector/curiosity-search-concept-illustration_114360-11031.jpg?w=740&t=st=1682102462~exp=1682103062~hmac=9b575b837af38f4f7619cfa6f42ea5d436db2b50c9b2509c8d5540910f3d37d5",
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 330,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.topic_outlined),
                        SizedBox(width: 10,),
                        Text("Related To -", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),)
                      ],
                    ),
                    const Text("Science, ISRO, Mars Mission, Astronomy")
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.timer),
                        SizedBox(width: 10,),
                        Text("Duration", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),)
                      ],
                    ),
                    const Text("30 mins")
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(Icons.info),
                        SizedBox(width: 10,),
                        Text("About Quiz", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),)
                      ],
                    ),
                    const Text("hghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuhahghiilhhguiaguwiehgiuawheghwehghweuhahghiilghaiwhhguiaguwiehgiuawheghwehghweuha")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
