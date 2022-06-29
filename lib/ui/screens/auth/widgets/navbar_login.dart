// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';

class NavbarLogin extends StatefulWidget {
  void Function(bool) getPressedScreen;

  NavbarLogin({Key? key, required this.getPressedScreen}) : super(key: key);

  @override
  _NavbarLoginState createState() => _NavbarLoginState();
}

class _NavbarLoginState extends State<NavbarLogin> {
  /// if the current screen is "login" then its value = false
  bool signupScreen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: context.height * .05,
        ),
        Row(
          children: [
            SizedBox(
              width: context.width * .04,
            ),
            FlatButton(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  if (signupScreen) {
                    setState(() {
                      signupScreen = false;
                    });
                    widget.getPressedScreen(signupScreen);
                  }
                },
                child: SizedBox(
                  width: context.width * 0.22,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: signupScreen? Colors.white54 : Colors.white, fontSize: context.width * 0.045),
                    textAlign: TextAlign.start,
                  ),
                )),
            SizedBox(
              width: context.width * .005,
            ),
            FlatButton(
                splashColor: Colors.transparent,
                focusColor: Colors.transparent,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  if (!signupScreen) {
                    setState(() {
                      signupScreen = true;
                    });
                    widget.getPressedScreen(signupScreen);
                  }
                },
                child: SizedBox(
                  width: context.width * .22,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        color: !signupScreen? Colors.white54 : Colors.white, fontSize: context.width * .045),
                    textAlign: TextAlign.start,
                  ),
                )),
          ],
        ),
        Stack(
          children: [
            Divider(
              color: Colors.white,
              thickness: .2,
              indent: context.width * .04,
              endIndent: context.width * .04,
            ),
            if (!signupScreen)
              Divider(
                color: Colors.white,
                thickness: 5,
                indent: context.width * .04,
                endIndent: context.width * .75,
              ),
            if (signupScreen)
              Divider(
                color: Colors.white,
                thickness: 5,
                indent: context.width * .27,
                endIndent: context.width * .5,
              ),
          ],
        )
      ],
    );
  }
}
