import 'dart:io';

import 'package:app_translate/Pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
   void initState() {
    super.initState();
    next();
  }

  void next() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: '',)));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/Group_60.png',
              // height: 100,
            ),
            SizedBox(
              height: 30,
              width: 30,
            ),
            if (Platform.isIOS)
              CupertinoActivityIndicator(
                radius: 30,
              )
            else
              CircularProgressIndicator(
                color: Colors.blue,
              )
          ],
        ),
      ),
    );
}
}