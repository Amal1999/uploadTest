// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upload_test/settings/const.dart';
import 'package:upload_test/ui/screens/auth/widgets/auth_button.dart';
import 'package:upload_test/ui/screens/auth/widgets/login_field.dart';
import 'package:upload_test/utils/string_utility.dart';

import '../../../viewmodels/auth_viewmodel.dart';
import '../home/navbar.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //This key will be used to identify the state of the form.
  final _formKey = GlobalKey<FormState>();
  String email="";
  String password="";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: context.height * .05,
          ),
          SvgPicture.asset(
            "assets/icons/Log in.svg",
            color: Const.iconsColor,
            matchTextDirection: true,
          ),
          SizedBox(
            height: context.height * .03,
          ),
          SizedBox(
            width: context.width * .6,
            child: Text(
              "Log In to Account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: context.width * .06,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: context.height * .05,
          ),
          //se déclenche fl onChanged
          LoginField(
            label: "Email",
            getContent: (val) {
            },
            validator: StringUtility.isEmail,
            error: "The email is invalid",
          ),
          SizedBox(
            height: context.height * .05,
          ),
          LoginField(
            label: "password",
            hidden: true,
            getContent: (val) {
            },
          ),
          SizedBox(
            height: context.height * .05,
          ),
          AuthButton(
              bgColor: Const.firstDarkColor,
              content: "Log in",
              onPressed: ()async {
                AuthViewModel().login(email,password).then(
                      (value) {
                    print("before if " + value.toString());
                    if (value) {
                      print('valueee');
                      print(value);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Navbar()));
                    }
                  },
                );
              }
              ),
          SizedBox(
            height: context.height * .03,
          ),
          Row(children: <Widget>[
            Expanded(
                child: Divider(
              indent: context.width * .05,
              color: Colors.white,
            )),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Or",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Expanded(
                child: Divider(
              color: Colors.white,
              endIndent: context.width * .05,
            )),
          ]),
          SizedBox(
            height: context.height * .03,
          ),
          AuthButton(
            imageUrl: "assets/icons/google.svg",
            bgColor: Const.thirdDarkColor,
            content: "Log in with Google",
              onPressed: ()async {
                AuthViewModel().LoginWithGoogle().then(
                      (value) {
                    print("before if " + value.toString());
                    if (value) {
                      print('valueee');
                      print(value);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Navbar()));
                    }
                  },
                );
              }
          )
        ],
      ),
    );
  }
}
