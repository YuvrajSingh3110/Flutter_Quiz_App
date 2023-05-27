import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Looser extends StatelessWidget {
  String moneyWon;
  String correctAns;
  Looser({required this.moneyWon, required this.correctAns});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {},
        child: const Text("Go to rewards"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Stack(
        children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error_outline_sharp, size: 100, ),
                const Text(
                  "Abey Yrr...Galat Jawab",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
                ),
                Text(
                  "Sahi jawab is- $correctAns",
                  style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                const Text(
                  "You Won",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                Text(
                  "Rs. ${moneyWon == 50 ? 0 : moneyWon}",
                  style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Firse try karega?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  child: const Text(
                    "Retry",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
