import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  static Future<GoogleSignInAccount> signInWithGoogle() async {
    try {
      final GoogleSignInAccount account = _googleSignIn.signIn;

      print(account);

      return account;
    } catch (e) {
      print(e);
      return Future.error('Error en google sign in: $e');
    }
  }
}
