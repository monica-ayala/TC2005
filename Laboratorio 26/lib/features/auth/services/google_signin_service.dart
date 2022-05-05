import 'dart:developer';

import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<String?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();

      if (account == null) {
        return null;
      }

      final GoogleSignInAuthentication googleKey = await account.authentication;

      return googleKey.idToken;
    } catch (e) {
      log("Error en Google Sign in");
      log(e.toString());
      return null;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
