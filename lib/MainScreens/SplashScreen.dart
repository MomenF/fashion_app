import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Todo Variables

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(
          seconds: 5,
        ),
        () => Navigator.pushNamedAndRemoveUntil(
            context, "/pageView", (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(

          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/s1.jpg"),
                fit: BoxFit.fill
              )
          ),
          // decoration: BoxDecoration(
          //   gradient: SweepGradient(
          //     colors: [Colors.yellowAccent,Colors.greenAccent,Colors.red,Colors.orangeAccent,Colors.blueAccent,Colors.yellowAccent],
          //   )
          // ),
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.7)
                ),
              ),
              Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Image.asset(
                'assets/images/s.png',
                      height: 200,
                      width: 300,
              ),
                      Text("Fashion App",
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "MarckScript",
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 5,
                          shadows: [
                            // Shadow(
                            //     color: Colors.black,
                            //     blurRadius: 4
                            // ),
                          ]


                      ),
                        textAlign: TextAlign.center,
                      ),
                    //Todo Text NAme App with Anew Fonts
                    SpinKitCircle(
                        color: Colors.red,
                      ),

                    ],
    ),
            ],
          ),
        ));
  }
}
