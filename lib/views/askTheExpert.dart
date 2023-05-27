import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AskTheExpert extends StatefulWidget {
  String quizQues;
  String ytURL;
  AskTheExpert({required this.quizQues, required this.ytURL});

  @override
  State<AskTheExpert> createState() => _AskTheExpertState();
}

class _AskTheExpertState extends State<AskTheExpert> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 20), () {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 250, horizontal: 20),
          child: Card(
            color: Colors.white,
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Ask The Expert",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Question -> ${widget.quizQues}",
                  style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                  textAlign: TextAlign.center,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: YoutubePlayer(
                    controller: YoutubePlayerController(
                      initialVideoId: widget.ytURL,
                      flags: YoutubePlayerFlags(
                          hideControls: false,
                          controlsVisibleAtStart: false,
                          autoPlay: true,
                          mute: true),
                    ),
                    showVideoProgressIndicator: true,
                  ),
                ),
                //Add counter here
                Text(
                  "You Will Be Redirected To Quiz Screen In 20 Seconds.",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
