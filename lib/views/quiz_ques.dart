import 'package:flutter/material.dart';
import 'package:quiz_app/services/questionModel.dart';
import 'package:quiz_app/services/quizQuesCreator.dart';
import 'package:quiz_app/widgets/lifelineSideBar.dart';

class QuizQues extends StatefulWidget {
  String quizID;
  String quizMoney;
  QuizQues({required this.quizID, required this.quizMoney});

  @override
  State<QuizQues> createState() => _QuizQuesState();
}

class _QuizQuesState extends State<QuizQues> {

  QuestionModel questionModel = new QuestionModel();

  genQuestion() async{
    await QuizQuesCreator.generateQuizQues(quizID: widget.quizID, quesMoney: widget.quizMoney).then((quesData) {
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
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rs. ${widget.quizMoney}"),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
        child: const Text(
          "Quit Game",
          style: TextStyle(fontSize: 20),
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      drawer: const LifelineDrawer(),
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
                children: const [
                  CircularProgressIndicator(
                    strokeWidth: 10,
                    color: Colors.deepOrange,
                    backgroundColor: Colors.green,
                  ),
                  Center(
                    child: Text(
                      "33",
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
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Text(
                questionModel.question,
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "A. ${questionModel.opt1}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "B. ${questionModel.opt2}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "C. ${questionModel.opt3}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "D. ${questionModel.opt4}",
                style: const TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
