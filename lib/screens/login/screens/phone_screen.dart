import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class PhoneLoginScreen extends StatelessWidget {
  // const PhoneLoginScreen({Key? key, required this.formKey, required this.controller}) : super(key: key);
   final GlobalKey<FormState> formKey =  GlobalKey<FormState>();
   final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body:   Column(
      children: [
        TextFormField(
                key: formKey,
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  hintText: 'Enter your Phone Number ',
                  labelText: 'Phone Number'
                ),
                keyboardType: TextInputType.number,
                
              ),
        ElevatedButton(onPressed: (){
          if(controller.text.isNotEmpty){
          FirebaseMethods.signInWithPhone(controller.text, context);
          }else{
            'Please try again';
          }
        }, child: Text('Login'),)
      ],
    ),
    );
        
  }
}