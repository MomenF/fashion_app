import 'package:e_commerce_app/MainScreens/Login.dart';
import 'package:flutter/material.dart';

import 'MainScreens/Register.dart';
import 'MainScreens/SplashScreen.dart';
import 'MainScreens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: {
        "/" : (context)=> SplashScreen(),
        "/loginPage" : (context)=> LoginPage(),
        "/home" : (context)=> HomePage(),
        "/Register" : (context)=> RegisterPage(),
      },
    );
  }
}


