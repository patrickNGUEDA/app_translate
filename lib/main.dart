//import 'package:app_translate/Pages/home_page.dart';
import 'package:app_translate/Pages/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'TranslateApp',
      theme: ThemeData(

          //primarySwatch: Colors.blue,
          ),
      home: const Splash(),
    );
  
  }
}
