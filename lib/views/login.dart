import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:quiz_app/services/auth.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),
              ),
              const SizedBox(
                height: 20,
              ),
              SignInButton(Buttons.GoogleDark, onPressed: () async{
                await signInWithGoogle();
              }),
            ],
          ),
        ),
      ),
    );
  }
}
