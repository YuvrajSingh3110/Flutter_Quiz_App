import 'package:flutter/material.dart';
import 'package:quiz_app/services/checkQuizUnlock.dart';
import 'package:quiz_app/services/localdb.dart';
import 'package:quiz_app/services/quizBusiness.dart';
import 'package:quiz_app/views/quiz_ques.dart';

class QuizIntro extends StatefulWidget {
  String QuizName;
  String QuizImgUrl;
  String QuizTopics;
  String QuizDuration;
  String QuizAbout;
  String QuizID;
  String QuizPrice;

  QuizIntro(
      {required this.QuizName,
      required this.QuizImgUrl,
      required this.QuizTopics,
      required this.QuizDuration,
      required this.QuizAbout,
      required this.QuizID,
      required this.QuizPrice});

  @override
  State<QuizIntro> createState() => _QuizIntroState();
}

class _QuizIntroState extends State<QuizIntro> {
  bool quizUnlock = false;
  getQuizUnlockStatus() async {
    await CheckQuizUnlock.QuizUnlockStatus(widget.QuizID).then((value) {
      setState(() {
        quizUnlock = value;
      });
    });
  }

  setLifeLineAvailability() async {
    await LocalDB.saveAudPoll(true);
    await LocalDB.saveJoker(true);
    await LocalDB.save50(true);
    await LocalDB.saveExp(true);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                QuizQues(quizID: widget.QuizID, quizMoney: widget.QuizPrice)));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getQuizUnlockStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        child: Text(quizUnlock ? "START" : "UNLOCK QUIZ"),
        onPressed: () {
          quizUnlock
              ? setLifeLineAvailability()
              : quizBusiness
                  .buyQuiz(
                      quizPrice: int.parse(widget.QuizPrice),
                      quizId: widget.QuizID)
                  .then((quizIsUnlocked) {
                  if (quizIsUnlocked) {
                    setState(() {
                      quizUnlock = true;
                    });
                  } else {
                    return showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: const Text(
                                  "Not enough money to buy this quiz!!"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("OK"))
                              ],
                            ));
                  }
                });
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
                        children: [
                          Text(
                            widget.QuizName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Image.network(
                widget.QuizImgUrl,
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
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Related To -",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        )
                      ],
                    ),
                    Text(widget.QuizTopics)
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
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Duration",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        )
                      ],
                    ),
                    Text("${widget.QuizDuration} minutes")
                  ],
                ),
              ),
              quizUnlock
                  ? Container()
                  : Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.money),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Money",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 20),
                              )
                            ],
                          ),
                          Text("Rs. ${widget.QuizPrice}")
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
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "About Quiz",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 20),
                        )
                      ],
                    ),
                    Text(widget.QuizAbout)
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
