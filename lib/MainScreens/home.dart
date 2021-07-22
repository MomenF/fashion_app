import 'package:e_commerce_app/Components/Categories.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      drawer: Drawer(

        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountEmail: Text("Momenm4123@gmail.com"),
            accountName: Text("Momen Mahmoud"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.grey,
              child: Icon(Icons.person,color: Colors.white,),
            ),

          ),
          ListTile(
            onTap: (){
              Navigator.pushNamedAndRemoveUntil(context, "/loginPage", (route) => false);
            },
            title: Text("Log out",style: TextStyle(color: Colors.red),),
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Icon(Icons.logout,color: Colors.white,),
            ),

          ),
        ]

        ),

      ),
      body: Column(
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
          )
        ],
      ),
    );
  }
}
