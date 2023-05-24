import 'package:flutter/material.dart';
import 'package:quiz_app/views/audience_poll.dart';

class LifelineDrawer extends StatefulWidget {
  String question;
  String opt1;
  String opt2;
  String opt3;
  String opt4;
  String correctAns;
  LifelineDrawer({
    required this.question,
    required this.opt1,
    required this.opt2,
    required this.opt3,
    required this.opt4,
    required this.correctAns,
  });

  @override
  State<LifelineDrawer> createState() => _LifelineDrawerState();
}

class _LifelineDrawerState extends State<LifelineDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(3),
            child: const Text(
              "LifeLine",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AudiencePoll(
                                  ques: widget.question,
                                  opt1: widget.opt1,
                                  opt2: widget.opt2,
                                  opt3: widget.opt3,
                                  opt4: widget.opt4,
                                  correctAns: widget.correctAns)));
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.orange),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(left: 10),
                      child: const Icon(
                        Icons.people,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Audience\n Poll",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: const Icon(
                      Icons.people,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Audience\n Poll",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: const Icon(
                      Icons.people,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Audience\n Poll",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.orange),
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: const Icon(
                      Icons.people,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Text(
                    "Audience\n Poll",
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            indent: 5,
            endIndent: 5,
            thickness: 3,
            color: Colors.black26,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(3),
            child: const Text(
              "Prizes",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
            ),
          ),
          SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: 15,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        "${index + 1}.",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.grey),
                      ),
                      title: Text(
                        "Rs. ${(index + 1) * 5000}",
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 18),
                      ),
                      trailing: const Icon(
                        Icons.circle,
                        color: Colors.orange,
                      ),
                    );
                  }),
            ),
          )
        ]),
      ),
    );
  }
}
