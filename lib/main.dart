import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pos_model/screens/home/home_screen.dart';
import 'package:pos_model/screens/login/login_screen.dart';
import 'package:pos_model/services/navigation_provider.dart';
import 'package:pos_model/utils/constant.dart';
import 'package:provider/provider.dart';

import 'screens/main_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // name: 'POS Model',
    options: 
     FirebaseOptions(
      
      apiKey: 'AIzaSyDpfkCzFzI1xt3dF7XMPg69SmP6dIBbXOw',
      appId: '1:117477998734:web:cfd370110ea9f6ea5c09df',
      messagingSenderId: '117477998734',
      projectId: 'pos-model',
      storageBucket: 'pos-model.appspot.com',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ((context) => NavigationProvider())),
        ChangeNotifierProvider(create: ((context) => TopRowProvider())),
        ChangeNotifierProvider(create: ((context) => CategoryProvider())),
      ],
      child: MaterialApp(
        title: 'POS Model',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: textTheme,
          colorScheme: const ColorScheme.light().copyWith(
            primary: accentColor,
            background: seperatorsColor,
            outline: highlightColor,
            secondary: popColor,
            onBackground: darkColor,
            onPrimary: fadedColor,
          ),
        ),
        home:StreamBuilder(stream: FirebaseAuth.instance.authStateChanges(),builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          if(snapshot.hasData){
            return MainView();
          }
          return LoginScreen();
        },),
      ),
    );
  }
}
