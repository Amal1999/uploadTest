import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class SignupService {
  static Future<bool> signup(String firstname, String name, String email, String password) async {
    bool val = false;
    try {
      var result = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;
      print('userrrrr');
      print(user);
      print(user != null);

      // I use displayName for firstname and name
      user?.updateProfile(displayName: firstname + " " + name);
      if (user != null) {
        val = true;
      } else {
        val = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print('eruuur ajout ajout');
      print(e);
    }
    return val;
  }
}
