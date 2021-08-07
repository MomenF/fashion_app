import 'package:bloc/bloc.dart';
import 'package:e_commerce_app/MainScreens/Login.dart';
import 'package:e_commerce_app/MainScreens/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Components/PurcaseList.dart';
import 'MainScreens/Pageview.dart';
import 'MainScreens/Register.dart';
import 'MainScreens/Setting.dart';
import 'MainScreens/SplashScreen.dart';
import 'MainScreens/FashionScreen.dart';
import 'Components/AllProductDetails.dart';
import 'MainScreens/baby/baby.dart';
import 'MainScreens/electronic/electronic.dart';
import 'MainScreens/phones/phones.dart';
import 'MainScreens/product_details.dart';
import 'Services/bloc/blocObserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: {
        "/" : (context)=> SplashScreen(),
        "/pageView" : (context)=> PageIntro(),
        "/loginPage" : (context)=> LoginPage(),
        "/home" : (context)=> HomePage(),
        "/fashionApp" : (context)=> FashionScreen(),
        "/electronicApp" : (context)=> ElectronicApp(),
        "/babyApp" : (context)=> BabyApp(),
        "/phoneApp" : (context)=> PhonesApp(),
        "/Register" : (context)=> RegisterPage(),
        "/productDetails" : (context)=> ProductDetails(),
        "/setting" : (context)=> Setting(),
        "/babyDetails" : (context)=> AllProductDetails(),
        "/purchaseAll" : (context)=> PurchaseList(),
        PurchaseList.id : (context)=> PurchaseList(),
      },
    );
  }
}


