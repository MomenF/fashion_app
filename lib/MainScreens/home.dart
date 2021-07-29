import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          "Fashion app ",
          style: TextStyle(
              fontSize: 25,
              fontFamily: "MarckScript",
              color: Colors.yellowAccent,
              fontWeight: FontWeight.bold,
              shadows: [
                // Shadow(
                //     color: Colors.black,
                //     blurRadius: 10
                // )
              ]),
        ),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: 12)
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(90),
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "All Categories",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    shadows: [Shadow(color: Colors.black)]),
              ),
              Divider(
                height: 25,
              ),
              //======== Fashion=============//
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/fashionApp");
                },
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ClipRRect(

                          child: Image.asset(
                        "assets/images/fashionCat.gif",
                        fit: BoxFit.fill,
                        width: double.infinity,
                      ),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      Text("Fashion Category",style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Pacifico-Regular",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                blurRadius: 15
                            )
                          ]
                      ),)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //======== electrical Device=============//
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/electronicApp");

                },
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ClipRRect(

                        child: Image.asset(
                          "assets/images/electronicsCat.gif",
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      Text("Electrical devices",style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Pacifico-Regular",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                blurRadius: 15
                            )
                          ]
                      ),)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //======== babes product=============//
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/babyApp");
                },
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ClipRRect(

                        child: Image.asset(
                          "assets/images/babyCat.gif",
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),

                      Text("Baby Products",style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Pacifico-Regular",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                blurRadius: 15
                            )
                          ]
                      ),)
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              //======== Phones product=============//
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/phoneApp");

                },
                child: Container(
                  width: 300,
                  height: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(15)),
                  child: Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      ClipRRect(

                        child: Image.asset(
                          "assets/images/phoneCat.gif",
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      Text("Phones Products",style: TextStyle(
                          fontSize: 25,
                          fontFamily: "Pacifico-Regular",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                blurRadius: 15
                            )
                          ]
                      ),)
                    ],
                  ),
                ),
              ),



            ],
          ),
        ),
      ),
    );
  }
}
