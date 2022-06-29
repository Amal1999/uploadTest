import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:upload_test/services/signup_service.dart';

import '../services/login_service.dart';

class AuthViewModel extends ChangeNotifier
{
  Future<bool> login(String email, String password) async{
    var login = await LoginService.login(email,password);
    return login;
  }
  Future<bool> signup(String firstname,String name, String email, String password)  async {
      var signedUp =  await SignupService.signup(firstname,name,email,password);
      return signedUp;
  }
  Future<bool> LoginWithGoogle() async {
    var log = await LoginService.signInWithGoogle();
    return log;
  }
}