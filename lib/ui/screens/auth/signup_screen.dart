// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:upload_test/settings/config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:upload_test/settings/const.dart';
import 'package:upload_test/utils/string_utility.dart';
import '../../../viewmodels/auth_viewmodel.dart';
import '../home/home_screen.dart';
import '../home/navbar.dart';
import 'widgets/auth_button.dart';
import 'widgets/login_field.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  //This key will be used to identify the state of the form.
  final _formKey = GlobalKey<FormState>();
  bool checked = false;
  late String firstname;
  late String name;
  late String email = "";
  late String password;
  late String confirmPassword;
  late bool val = true;

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
            "assets/icons/Sign up.svg",
            color: Const.iconsColor,
            matchTextDirection: true,
          ),
          SizedBox(
            height: context.height * .03,
          ),
          SizedBox(
            width: context.width * .6,
            child: Text(
              "Create Account",
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
          LoginField(
            label: "FirstName",
            //validator:
            getContent: (val) {
              setState(() {
                firstname = val;
              });
            },

          ),
          SizedBox(
            height: context.height * .05,
          ),
          LoginField(
            label: "Name",
            getContent: (val) {
              setState(() {
                name = val;
              });
            },
          ),
          SizedBox(
            height: context.height * .05,
          ),
          LoginField(
            label: "Email",
            getContent: (val) {
              setState(() {
                email = val;
              });
            },
            validator: StringUtility.isEmail,
            error: "The email is invalid",
          ),
          SizedBox(
            height: context.height * .05,
          ),
          LoginField(
              label: "password",
              getContent: (val) {
                setState(() {
                  password = val;
                });
              },
              hidden: true),
          SizedBox(
            height: context.height * .05,
          ),
          LoginField(
            label: "confirm password",
            hidden: true,
            getContent: (val) {
              setState(() {
                confirmPassword = val;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: context.width * .01),
            child: Row(
              children: [
                Checkbox(
                    fillColor: MaterialStateProperty.all(Const.iconsColor),
                    value: checked,
                    onChanged: (val) {
                      setState(() {
                        checked = !checked;
                      });
                    }),
                Text(
                  " I agree to ",
                  style: TextStyle(color: Colors.white),
                ),
                Container(
                    padding: EdgeInsets.only(
                      bottom: .3, // Space between underline and text
                    ),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: Colors.white,
                      width: .5, // Underline thickness
                    ))),
                    child: InkWell(
                      onTap: () {},
                      child: Text(
                        "Terms and Conditions",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
          SizedBox(
            height: context.height * .03,
          ),
          AuthButton(
              bgColor: Const.secondDarkColor,
              content: "Save",
              onPressed: ()async {
                AuthViewModel().signup(firstname,name,email,password).then(
                      (value) {
                        print("before if " + value.toString());
                    if (value) {
                      print('valueee');
                      print(value);
                      Navigator.push(context,MaterialPageRoute(builder: (context) => Navbar()));
                    }
                  },
                );

              }),
          SizedBox(
            height: context.height * .03,
          ),
        ],
      ),
    );
  }
}
