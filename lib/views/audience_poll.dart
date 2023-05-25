import 'dart:math';

import 'package:flutter/material.dart';

class AudiencePoll extends StatefulWidget {
  String ques;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;

  AudiencePoll(
      {required this.ques,
      required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  State<AudiencePoll> createState() => _AudiencePollState();
}

class _AudiencePollState extends State<AudiencePoll> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    votingMachine();
  }

  int opt1votes = 0;
  int opt2votes = 0;
  int opt3votes = 0;
  int opt4votes = 0;
  bool isVoting = true;

  votingMachine() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        if (widget.opt1 == widget.correctAns) {
          opt1votes = Random().nextInt(100);
        } else {
          opt1votes = Random().nextInt(40);
        }
        if (widget.opt2 == widget.correctAns) {
          opt2votes = Random().nextInt(100);
        } else {
          opt2votes = Random().nextInt(40);
        }
        if (widget.opt3 == widget.correctAns) {
          opt3votes = Random().nextInt(100);
        } else {
          opt3votes = Random().nextInt(40);
        }
        if (widget.opt4 == widget.correctAns) {
          opt4votes = Random().nextInt(100);
        } else {
          opt4votes = Random().nextInt(40);
        }
        isVoting = false;
      });
      Future.delayed(Duration(seconds: 10), () {
        Navigator.pop(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: Column(
            children: [
              Text("Audience Poll Lifeline->"),
              Text("Question- ${widget.ques}"),
              Text(isVoting ? "Audience is voting " : "Here are the results"),
              isVoting ? LinearProgressIndicator() : Container(),
              //To Do- Add bars equivalent to votes
              //To Do- display warning of 10 sec
              Text("${widget.opt1}\t\t${opt1votes}votes"),
              Text("${widget.opt2}\t\t${opt2votes}votes"),
              Text("${widget.opt3}\t\t${opt3votes}votes"),
              Text("${widget.opt4}\t\t${opt4votes}votes"),
            ],
          ),
        ),
      ),
    );
  }
}
