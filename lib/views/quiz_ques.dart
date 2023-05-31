import 'dart:async';

import 'package:flutter/material.dart';
import 'package:quiz_app/services/firedb.dart';
import 'package:quiz_app/services/questionModel.dart';
import 'package:quiz_app/services/quizQuesCreator.dart';
import 'package:quiz_app/views/winner.dart';
import 'package:quiz_app/widgets/lifelineSideBar.dart';
import 'looser.dart';

class QuizQues extends StatefulWidget {
  String quizID;
  String quizMoney;
  QuizQues({required this.quizID, required this.quizMoney});

  @override
  State<QuizQues> createState() => _QuizQuesState();
}

class _QuizQuesState extends State<QuizQues> {
  QuestionModel questionModel = new QuestionModel();

  genQuestion() async {
    await QuizQuesCreator.generateQuizQues(
            quizID: widget.quizID, quesMoney: widget.quizMoney)
        .then((quesData) {
      setState(() {
        questionModel.question = quesData["question"];
        questionModel.correctAnswer = quesData["correct_ans"];

        List options = [
          quesData["opt1"],
          quesData["opt2"],
          quesData["opt3"],
          quesData["opt4"],
        ];
        options.shuffle(); //to shuffle the options
        questionModel.opt1 = options[0];
        questionModel.opt2 = options[1];
        questionModel.opt3 = options[2];
        questionModel.opt4 = options[3];
      });
    });
  }

  bool optAlocked = false;
  bool optBlocked = false;
  bool optClocked = false;
  bool optDlocked = false;

  int maxSeconds = 30;
  int seconds = 30;
  Timer? timer;

  QueTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      setState(() => seconds--);
      if (seconds == 0) {
        timer?.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Looser(
                    moneyWon: int.parse(widget.quizMoney) == 100
                        ? 0
                        : (int.parse(widget.quizMoney) ~/ 2),
                    correctAns: questionModel.correctAnswer)));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genQuestion();
    QueTimer();
  }

  @override
  Widget build(BuildContext context) {

    Future<bool?> showWarning(
            {required BuildContext context,
            required String title,
            required String content}) async =>
        showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: Text(title),
                  content: Text(content),
                  actions: [
                    ElevatedButton(
                        onPressed: () => Navigator.pop(context, false),
                        child: Text("No!")),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: Text("Okay!")),
                  ],
                ));

    return WillPopScope(
      onWillPop: () async {
        final exitQuiz = await showWarning(
            context: context,
            title: "DO YOU WANT TO EXIT QUIZ ?",
            content:
                "You will lose all of your prize money");
        return exitQuiz ?? false;
      },
      child: Scaffold(
        onDrawerChanged: (isOpened) {
          timer?.cancel();
          isOpened ? timer?.cancel() : QueTimer();
        },
        appBar: AppBar(
          title: Text("Rs. ${widget.quizMoney}"),
          centerTitle: true,
          backgroundColor: Colors.orangeAccent,
        ),
        floatingActionButton: ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text("Do You Want To Quit!!"),
                        content: Text(
                            "You Will Win Rs.${widget.quizMoney == 100 ? 0 : int.parse(widget.quizMoney) / 2}"),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              await FireDB.updateMoney(widget.quizMoney);
                              timer?.cancel();
                              Navigator.pop(context);
                              Navigator.pop(context);
                            },
                            child: Text("QUIT"),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("CANCEL"),
                          ),
                        ],
                      ));
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
            child: const Text(
              "Quit Game",
              style: TextStyle(fontSize: 20),
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        drawer: LifelineDrawer(
          question: questionModel.question,
          opt1: questionModel.opt1,
          opt2: questionModel.opt2,
          opt3: questionModel.opt3,
          opt4: questionModel.opt4,
          correctAns: questionModel.correctAnswer,
          quizId: widget.quizID,
          quizMoney: widget.quizMoney,
        ),
        body: Container(
          color: Colors.orangeAccent,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      strokeWidth: 10,
                      color: Colors.white,
                      backgroundColor: Colors.deepOrange[400],
                      value: seconds / maxSeconds,
                    ),
                    Center(
                      child: Text(
                        seconds.toString(),
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white70),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  questionModel.question,
                  style: const TextStyle(fontSize: 30),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  print("DOUBLE PRESS TO LOCK THE ANSWER");
                },
                onDoubleTap: () {
                  setState(() {
                    optAlocked = true;
                  });
                  Future.delayed(const Duration(seconds: 1), () async {
                    if (questionModel.opt1 == questionModel.correctAnswer) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Winner(widget.quizMoney, widget.quizID)));
                    } else {
                      await FireDB.updateMoney(widget.quizMoney);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Looser(
                                    moneyWon: int.parse(widget.quizMoney) == 100
                                        ? 0
                                        : (int.parse(widget.quizMoney) ~/ 2),
                                    correctAns: questionModel.correctAnswer,
                                  )));
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optAlocked
                          ? Colors.yellowAccent.withOpacity(0.4)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "A. ${questionModel.opt1}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("DOUBLE PRESS TO LOCK THE ANSWER");
                },
                onDoubleTap: () {
                  setState(() {
                    optBlocked = true;
                  });
                  Future.delayed(const Duration(seconds: 1), () async {
                    if (questionModel.opt2 == questionModel.correctAnswer) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Winner(widget.quizMoney, widget.quizID)));
                    } else {
                      await FireDB.updateMoney(widget.quizMoney);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Looser(
                                    moneyWon:
                                        (int.parse(widget.quizMoney) ~/ 2),
                                    correctAns: questionModel.correctAnswer,
                                  )));
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optBlocked
                          ? Colors.yellowAccent.withOpacity(0.4)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "B. ${questionModel.opt2}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("DOUBLE PRESS TO LOCK THE ANSWER");
                },
                onDoubleTap: () {
                  setState(() {
                    optClocked = true;
                  });
                  Future.delayed(const Duration(seconds: 1), () async {
                    if (questionModel.opt3 == questionModel.correctAnswer) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Winner(widget.quizMoney, widget.quizID)));
                    } else {
                      await FireDB.updateMoney(widget.quizMoney);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Looser(
                                    moneyWon:
                                        (int.parse(widget.quizMoney) ~/ 2),
                                    correctAns: questionModel.correctAnswer,
                                  )));
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optClocked
                          ? Colors.yellowAccent.withOpacity(0.4)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "C. ${questionModel.opt3}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  print("DOUBLE PRESS TO LOCK THE ANSWER");
                },
                onDoubleTap: () {
                  setState(() {
                    optDlocked = true;
                  });
                  Future.delayed(const Duration(seconds: 1), () async {
                    if (questionModel.opt4 == questionModel.correctAnswer) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Winner(widget.quizMoney, widget.quizID)));
                    } else {
                      await FireDB.updateMoney(widget.quizMoney);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Looser(
                                    moneyWon: int.parse(widget.quizMoney) ~/ 2,
                                    correctAns: questionModel.correctAnswer,
                                  )));
                    }
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: optDlocked
                          ? Colors.yellowAccent.withOpacity(0.4)
                          : Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "D. ${questionModel.opt4}",
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
