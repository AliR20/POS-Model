import 'package:flutter/material.dart';
import 'package:pos_model/screens/main_view.dart';

import '../services/firebase_services.dart';

class EmailLoginScreen extends StatefulWidget {
  //  EmailLoginScreen({Key? key, required this.formKey, required this.emailController, required this.passwordController}) : super(key: key);

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  bool hasAccount = true;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> passFormKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            key: formKey,
            controller: emailController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                hintText: 'Enter your Email ',
                labelText: 'Email'),
            keyboardType: TextInputType.number,
          ),
          TextFormField(
            key: passFormKey,
            controller: passwordController,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                hintText: 'Enter your password ',
                labelText: 'Password'),
            obscureText: true,
            keyboardType: TextInputType.number,
          ),
          ElevatedButton(
            onPressed: () async {
              if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty &&
                  hasAccount == true) {
               await FirebaseMethods.signInWithEmail(
                    email: emailController.text,
                    password: passwordController.text);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainView()));
              } else if (emailController.text.isNotEmpty &&
                  passwordController.text.isNotEmpty &&
                  hasAccount == false) {
                await FirebaseMethods.createUserWithEmail(
                    email: emailController.text,
                    password: passwordController.text);
              }
               Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainView()));
            },
            child: Text(hasAccount ? 'Login' : 'SignUp'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                hasAccount = !hasAccount;
              });
            },
            child: Text(hasAccount
                ? 'Dont have an account?Sign Up instead'
                : 'Already have an account?Login'),
          ),
        ],
      ),
    );
  }
}
