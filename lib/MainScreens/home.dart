import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;


  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,

    );
    controller.forward();
    // controller.addStatusListener((status) {
    //   if(status == AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   }else if (status == AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });

    controller.addListener(() {
      setState(() {});
      controller.value;
    });

    animation = CurvedAnimation(parent: controller, curve: Curves.easeIn);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red.withOpacity(controller.value),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: TextWordAnimated(title: "Fashion App ",),
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
            color: Colors.white.withOpacity(controller.value),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.5), blurRadius: 12)
            ],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(90),
            )),
        child: SingleChildScrollView(
          child: Column(
            children: [
              categoryWord(),
              Divider(
                height: 25,
              ),
              //======== Fashion=============//
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/fashionApp");
                },
                child: Container(
                  width: animation.value * 300,
                  height: animation.value * 100,
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

                      Text("Fashion Category", style: TextStyle(
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
                onTap: () {
                  Navigator.pushNamed(context, "/electronicApp");
                },
                child: Container(
                  width: animation.value * 300,
                  height: animation.value * 100,
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

                      Text("Electrical devices", style: TextStyle(
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
                onTap: () {
                  Navigator.pushNamed(context, "/babyApp");
                },
                child: Container(
                  width: animation.value * 300,
                  height: animation.value * 100,
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

                      Text("Baby Products", style: TextStyle(
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
                onTap: () {
                  Navigator.pushNamed(context, "/phoneApp");
                },
                child: Container(
                  width: animation.value * 300,
                  height: animation.value * 100,
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
                      Text("Phones Products", style: TextStyle(
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


Widget categoryWord() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
      const SizedBox(width: 20.0, height: 20.0),
        const Text(
                      'All Cateogries ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 30.0 , color: Colors.red , fontWeight: FontWeight.bold),
                    ),
  const SizedBox(width: 20.0, height: 5.0),
        DefaultTextStyle(
              style: const TextStyle(
                color: Colors.deepOrange,
              fontSize: 30.0,


              ),
          child: AnimatedTextKit(

            repeatForever: true,
            stopPauseOnTap: true,
            animatedTexts: [
              RotateAnimatedText('Categories'),
              RotateAnimatedText('Fashion'),
            RotateAnimatedText('Electronic Devices'),
            RotateAnimatedText('Baby Products'),
            RotateAnimatedText('Phone Products',),
            ],
                onTap: () {
                print("Tap Event");
                            },
                            ),
                            ),
                            ],
                            );
                            }
class TextWordAnimated extends StatelessWidget {
  String? title;
  TextWordAnimated({
    required  this.title,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 250.0,
          child: DefaultTextStyle(
            style: const TextStyle(
                fontSize: 25,
                fontFamily: "Pacifico-Regular",
                color: Colors.white,
                fontWeight: FontWeight.bold,

                shadows: [
                  Shadow(color: Colors.black, blurRadius: 10)
                ]),
            child: AnimatedTextKit(
              repeatForever: true,
              animatedTexts: [
                TyperAnimatedText("$title",textAlign: TextAlign.center),
              ],
              onTap: () {
                print("Tap Event");
              },
            ),
          ),
        ),
      ],
    );
  }
}
