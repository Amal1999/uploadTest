import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';
import 'package:upload_test/settings/const.dart';
import 'package:upload_test/ui/screens/auth/login_screen.dart';
import 'package:upload_test/ui/screens/auth/signup_screen.dart';
import 'widgets/navbar_login.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  /// initially in the login screen
  bool signup = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: signup ? Const.firstDarkColor : Const.secondDarkColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            NavbarLogin(getPressedScreen: (val) {
              setState(() {
                signup = val;
              });
            }),
            SizedBox(
                height: context.height * .8,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      if (!signup) LoginScreen(),
                      if (signup) SignupScreen()
                    ],
                  ),
                )),
          ],
        ),
      ),
    ));
  }
}
