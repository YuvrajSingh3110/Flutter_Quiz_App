import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:quiz_app/services/auth.dart';
import 'package:quiz_app/services/internetConnection.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //if status of internet changes
    InternetConnectionChecker().onStatusChange.listen((status) {
      final connected = status == InternetConnectionStatus;
      showSimpleNotification(
          Text(connected
              ? "Connected To Internet"
              : "Not Connected To Internet"),
          background: connected ? Colors.green : Colors.red);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "lib/assets/images/login.jpg",
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Welcome To Quiz App",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SignInButton(Buttons.GoogleDark, onPressed: () async {
                await signInWithGoogle();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
