import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/Views/login.dart';
import 'package:quiz_app/services/localdb.dart';
import 'package:quiz_app/views/home.dart';

Future <void> main() async{
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
        if(value.toString() != "null"){
          isLogin = true;
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLoggedinState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return OverlaySupport.global(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: isLogin ? const Home() : const Login(),
        // AnimatedSplashScreen(
        //   duration: 2000,
        //   splash: 'lib/assets/images/mushroom.png', splashIconSize: 100,
        //   nextScreen: isLogin ? const Home() : const Login(),
        //   splashTransition: SplashTransition.fadeTransition,
        // )
      ),
    );
  }
}

