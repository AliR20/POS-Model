import 'package:flutter/material.dart';
import 'package:pos_model/screens/login/screens/email_login_screen.dart';
import 'package:pos_model/screens/login/screens/phone_screen.dart';
import 'package:pos_model/screens/login/services/firebase_services.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EmailLoginScreen(
                     )));
          }, child: Text('Sign in with Email')),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => PhoneLoginScreen(
                        )));
              },
              child: Text('Sign in with Phone Number')),
        ],
      ),
    );
  }
}
