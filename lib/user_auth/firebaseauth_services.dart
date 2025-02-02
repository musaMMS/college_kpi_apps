import 'package:college_kpi_apps/login_singup_screen/forgetScreen.dart';
import 'package:college_kpi_apps/user_auth/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';// Correct import

class AuthMethods {
  final FirebaseAuth auth = FirebaseAuth.instance;

  getCurrentUser() async {
    return await auth.currentUser;
  }

  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount  googleSignInAccount = await googleSignIn.singIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      UserCredential result = await firebaseAuth.signInWithCredential(credential);
      User? userDetails = result.user;

      if (userDetails != null) {
        Map<String, dynamic> userInfoMap = {
          "email": userDetails.email,
          "name": userDetails.displayName,
          "imgUrl": userDetails.photoURL,
          "id": userDetails.uid
        };

        await DatabaseMethods().addUser(userDetails.uid, userInfoMap).then((value) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => Forgetscreen()));
        });
      }
    }
  }
}

class GoogleSignInAuthentication {
  get idToken => null;

  get accessToken => null;
}

class GoogleSignInAccount {
  get authentication => null;
}

class GoogleSignIn {
  singIn() {}
}