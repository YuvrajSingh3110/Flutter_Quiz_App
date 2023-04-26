import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/Views/login.dart';
import 'package:quiz_app/services/localdb.dart';
import 'package:quiz_app/views/home.dart';
import 'package:quiz_app/views/looser.dart';
import 'package:quiz_app/views/profile.dart';
import 'package:quiz_app/views/quiz_intro.dart';
import 'package:quiz_app/views/quiz_ques.dart';
import 'package:quiz_app/views/winner.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLogin = false;

  getLoggedinState() async{
    await LocalDB.getUserId().then((value) {
      setState(() {
        isLogin = true;
      });
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: isLogin ? Home() : Profile(),
      ),
    );
  }
}

