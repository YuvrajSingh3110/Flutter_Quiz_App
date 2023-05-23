import 'dart:math';

import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:quiz_app/views/quiz_ques.dart';

class Winner extends StatefulWidget {
  String quesMoney;
  String quizID;
  Winner(this.quesMoney, this.quizID);

  @override
  State<Winner> createState() => _WinnerState();
}

class _WinnerState extends State<Winner> {
  late ConfettiController confettiController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {  },
        child: const Text("Share With Friends"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Badhai Ho!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Sahi jawab",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Text(
                  "You Won rs. ${widget.quesMoney}",
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  "Kya kijiega itni dhanrashi ka?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text(
                    "Next Question",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => QuizQues(quizID: widget.quizID, quizMoney: widget.quesMoney)));
                  },
                ),
              ],
            ),
          ),
          buildConfettiWidget(confettiController, pi / 2)
        ],
      ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          maximumSize: const Size(30, 30),
          shouldLoop: false,
          confettiController: controller,
          blastDirection: blastDirection,
          blastDirectionality: BlastDirectionality.explosive,
          maxBlastForce: 20,
          minBlastForce: 10,
          emissionFrequency: 0.1,
          numberOfParticles: 8,
          gravity: 0.4,
        ));
  }
}
