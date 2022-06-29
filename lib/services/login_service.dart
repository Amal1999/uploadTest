
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginService {

  static Future<bool> login(String email, String password ) async{
    bool val = false;
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      User? user = credential.user;
      if (user != null) {
        val = true;
      } else {
        val = false;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return val;
  }

  static Future<bool> signInWithGoogle() async {
    bool val = false;
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    if (credential != null) {
      val = true;
    } else {
      val = false;
    }
    // Once signed in, return the UserCredential
    return val;
  }
}