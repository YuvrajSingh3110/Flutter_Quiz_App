import 'package:flutter/material.dart';

class FiftyFifty extends StatefulWidget {
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;

  FiftyFifty(
      {required this.opt1,
      required this.opt2,
      required this.opt3,
      required this.opt4,
      required this.correctAns});

  @override
  State<FiftyFifty> createState() => _FiftyFiftyState();
}

class _FiftyFiftyState extends State<FiftyFifty> {
  List wrongOption = [];

  fetchWrongOptiions() {
    setState(() {
      if (widget.opt1 != widget.correctAns) {
        wrongOption.add(widget.opt1);
      }
      if (widget.opt2 != widget.correctAns) {
        wrongOption.add(widget.opt2);
      }
      if (widget.opt3 != widget.correctAns) {
        wrongOption.add(widget.opt3);
      }
      if (widget.opt4 != widget.correctAns) {
        wrongOption.add(widget.opt4);
      }
      wrongOption.shuffle();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchWrongOptiions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 250, horizontal: 20),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Card(
          color: Colors.white,
          elevation: 3,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Fifty Fifty Lifeline->",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "${wrongOption[0]} and ${wrongOption[1]} are INCORRECT OPTIONS",
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
      ),
    );
  }
}
