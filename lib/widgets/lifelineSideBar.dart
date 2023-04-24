import 'package:flutter/material.dart';

class LifelineDrawer extends StatefulWidget {
  const LifelineDrawer({Key? key}) : super(key: key);

  @override
  State<LifelineDrawer> createState() => _LifelineDrawerState();
}

class _LifelineDrawerState extends State<LifelineDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(children: [
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.all(3),
            child: const Text("LifeLine", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),),
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
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
                  const SizedBox(height: 5,),
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
                  const SizedBox(height: 5,),
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
                  const SizedBox(height: 5,),
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
                  const SizedBox(height: 5,),
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
          )
        ]),
      ),
    );
  }
}
