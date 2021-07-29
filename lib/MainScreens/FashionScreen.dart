import 'package:e_commerce_app/Components/Categories.dart';
import 'package:e_commerce_app/Components/Drower.dart';
import 'package:e_commerce_app/Components/products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

class FashionScreen extends StatefulWidget {

  @override
  _FashionScreenState createState() => _FashionScreenState();
}

class _FashionScreenState extends State<FashionScreen> {
  // Todo Variables
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Fashion App"),

      ),
      drawer: Drower(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Carousel(
                images: [
                  Image.asset('assets/images/1.jpg',fit: BoxFit.fill,),
                  Image.asset('assets/images/2.jpg',fit: BoxFit.fill,),
                  Image.asset('assets/images/3.jpg',fit: BoxFit.fill,),
                  Image.asset('assets/images/4.jpg',fit: BoxFit.fill,),

                ],
                boxFit: BoxFit.cover,
                  dotSize: 5,
                autoplay: true,
                autoplayDuration: Duration(seconds: 5),

              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.only(
                left: 10
              ),
                child: Text('Categories',style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),)),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                BrandCategory(
                  categoryName: "T-shirts " ,
                  imageLocation: "assets/images/T-Shirt.png" ,
                ),
                BrandCategory(
                  categoryName: "Jackets " ,
                  imageLocation: "assets/images/Jacket.png" ,
                ),
                BrandCategory(
                  categoryName: "Shirts " ,
                  imageLocation: "assets/images/shirt.png" ,
                ),
                BrandCategory(
                  categoryName: "Trouser " ,
                  imageLocation: "assets/images/Trouser.png" ,
                ),
                BrandCategory(
                  categoryName: "Babes Dress" ,
                  imageLocation: "assets/images/girlsBabyDress.jpg" ,
                ),
                BrandCategory(
                  categoryName: "Babes Wear" ,
                  imageLocation: "assets/images/babesWear.png" ,
                ),
                BrandCategory(
                  categoryName: "Shoes" ,
                  imageLocation: "assets/images/Shoes.png" ,
                ),

              ],
                ),
            ),
            Divider(
              thickness: 1,
              height: 15,
            ),
            Container(
                margin: const EdgeInsets.only(
                    left: 15
                ),
                padding:const EdgeInsets.only(
                  bottom: 20,
                  top: 10
                ) ,
                child: Text('Recent Products',style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),)),
            Container(
              color: Colors.redAccent.withOpacity(.5),
              child: Products(),
            )


          ],
        ),
      ),
    );
  }
}
