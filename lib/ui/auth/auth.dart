import 'package:e_commerce/ui/screens.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthScreen extends StatelessWidget {
  static const String name = 'auth_screen';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidht = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Google'),
        actions: [
          IconButton(
            icon: const Icon(FontAwesomeIcons.doorOpen),
            onPressed: () {
              // GoogleSignInService.signInWithGoogle();
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                splashColor: Colors.transparent,
                minWidth: double.infinity,
                height: screenHeight * 0.04,
                color: Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    Text('  Sign in with Google',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidht * 0.028)),
                  ],
                ),
                onPressed: () {
                  // todo: sign in with google
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
