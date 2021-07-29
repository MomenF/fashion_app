import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:e_commerce_app/Components/Drower.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElectronicApp extends StatefulWidget {
  const ElectronicApp({Key? key}) : super(key: key);

  @override
  _ElectronicAppState createState() => _ElectronicAppState();
}

class _ElectronicAppState extends State<ElectronicApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Electronic Products"),

      ),
      drawer: Drower(),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: Carousel(
              images: [
                Image.asset('assets/images/elect/dev1.jpg',fit: BoxFit.fill,),
                Image.asset('assets/images/elect/dev2.jpg',fit: BoxFit.fill,),
                Image.asset('assets/images/elect/dev3.jpg',fit: BoxFit.fill,),
                Image.asset('assets/images/elect/dev4.jpg',fit: BoxFit.fill,),


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
              child: Text('All Electronics Products',style: TextStyle(
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline
              ),)),
          Divider(
            thickness: 3,
          ),




        ],
      ),
    );
  }
}
