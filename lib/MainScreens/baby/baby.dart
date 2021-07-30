import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:e_commerce_app/Components/Drower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'babyProduct.dart';

class BabyApp extends StatefulWidget {
  const BabyApp({Key? key}) : super(key: key);

  @override
  _BabyAppState createState() => _BabyAppState();
}

class _BabyAppState extends State<BabyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Baby Products"),

      ),
      drawer: Drower(),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Carousel(
              images: [
                Image.asset('assets/images/baby/p1.jpg',fit: BoxFit.fill,),
                Image.asset('assets/images/baby/p2.jpg',fit: BoxFit.fill,),
                Image.asset('assets/images/baby/p3.jpg',fit: BoxFit.fill,),
                Image.asset('assets/images/baby/p4.jpg',fit: BoxFit.fill,),
                Image.asset('assets/images/baby/p5.jpg',fit: BoxFit.fill,),
              ],
              boxFit: BoxFit.cover,
              dotSize: 5,
              autoplay: true,
              autoplayDuration: Duration(seconds: 5),

            ),
          ),
          Divider(
            thickness: 1,
            height: 15,
          ),
          Container(
              alignment: AlignmentDirectional.centerStart,
              margin: const EdgeInsets.only(
                  left: 15
              ),
              padding:const EdgeInsets.only(
                  bottom: 20,
                  top: 10
              ) ,
              child: Text('All Baby Products ',style: TextStyle(
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline
              ),)),
          Divider(
            thickness: 3,
          ),
          BabyProducts()




        ],
      ),
    );
  }
}
