import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pos_model/screens/login/widgets/otp_dialog.dart';

class FirebaseMethods {
  static Future<String> storeMobileImage(Uint8List image,String childName)async{
    final ref = FirebaseStorage.instance.ref();
    final child = ref.child(childName).child(FirebaseAuth.instance.currentUser!.uid);
    final uploadTask = child.putData(image);
   final snap = await uploadTask;
   final downloadUrl = await snap.ref.getDownloadURL();
   return downloadUrl;
  }
   static Future<String> storeWebImage(Uint8List image,String childName)async{
    final ref = FirebaseStorage.instance.ref();
    final child = ref.child(childName).child(FirebaseAuth.instance.currentUser!.uid);
    final uploadTask = child.putData(image);
   final snap = await uploadTask;
   final downloadUrl = await snap.ref.getDownloadURL();
   return downloadUrl;
  }
  
  static Future<void> signInWithEmail({required String email,required String password})async {
    final auth = FirebaseAuth.instance;
    if(email.isNotEmpty && password.isNotEmpty){
await  auth.signInWithEmailAndPassword(email: email, password: password);
   }


  }
  static Future<void> createUserWithEmail({required String email,required String password})async {
    final auth = FirebaseAuth.instance;
    if(email.isNotEmpty && password.isNotEmpty){

   await  auth.createUserWithEmailAndPassword(email: email, password: password);
    }
  }

  static Future<void> signOut()async{
    await FirebaseAuth.instance.signOut();
  }















  static Future<void> signInWithPhone(
      String phoneNumber, BuildContext context) async {
    final auth = FirebaseAuth.instance;
      TextEditingController controller = TextEditingController();
    if (kIsWeb) {
       ConfirmationResult result = await auth.signInWithPhoneNumber(phoneNumber,);
        otpDialog(
                controller: controller,
                context: context,
                    onPressed: ()async{
      PhoneAuthCredential cred = PhoneAuthProvider.credential(
          verificationId: result.verificationId, smsCode: controller.text.trim());
       result.confirm(controller.text);
      await auth.signInWithCredential(cred);
          Navigator.of(context).pop();
                    },
                  );
    
    } else {
      await auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential cred) async {
          await auth.signInWithCredential(cred);
        },
        verificationFailed: (FirebaseAuthException error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                error.message.toString(),
              ),
            ),
          );
        },
        codeSent: (String verificationId, int? resendToken)async{
        otpDialog(
                controller: controller,
                context: context,
                    onPressed: ()async{
                      PhoneAuthCredential cred = PhoneAuthProvider.credential(
                          verificationId: verificationId,
                          smsCode: controller.text.trim());
                    await auth.signInWithCredential(cred);
          Navigator.of(context).pop();
                    },
                  );
        },
        codeAutoRetrievalTimeout: (value) {},
      );
    }
  }
}
