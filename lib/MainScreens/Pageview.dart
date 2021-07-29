import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';

class PageIntro extends StatefulWidget {
  _PageIntroState createState() => _PageIntroState();
}

class _PageIntroState extends State<PageIntro> {
  List<Slide> slides = [];
  String fashionDiscribtion =
      " Fashion is a form of self-expression and autonomy at a particular period and place and in a specific context, of clothing, footwear, lifestyle, accessories, makeup, hairstyle, and body posture.[1] In its everyday use, the term implies a look defined by the fashion industry as that which is trending. Everything that is considered fashion is available and popular by the fashion system (industry and media).In reaction to the increased mass-production of commodities clothing at lower prices and global reach, sustainability has become an urgent issue among politicians, brands, and consumers.[2][3] s noted by fashion scholar Susan B. Kaiser, everyone is forced to appear, that is, there is no unmediated way of being before others.[4] Whether we want it or not, everyone appearing before another is evaluated by the dress, their attire. This most commonly means how one looks, what colors, materials, and silhouette one wears on the body. Even if the garments are all the same, they will appear different; if the item is washed, folded, mended, or new.The term fashion is plagued by its many different uses, and by the unclear application of the concept. For example, the term connotes difference, but also sameness. It signifies the latest distinction, as well as the return of the old. While it may be defined by an insular and esteemed aesthetic elite, who make a look exclusive, this look is often using references from those excluded from making the distinction.  ";

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title:"Welcome To Our App , All the Best Fashion are between your hand with the best price anh High Quality " ,
        maxLineTitle: 5,
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: fashionDiscribtion,
        styleDescription: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
          ),
        marginDescription:
        EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 70.0),
        // centerWidget: Text("Replace this with a custom widget",
        //     style: TextStyle(color: Colors.white)),
        backgroundImage: "assets/images/pageView1.jpg",
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onCenterItemPress: () {},
      ),
    );

    slides.add(
      new Slide(
        title: "Phones Products",
        styleTitle: TextStyle(
            color: Color(0xff7FFFD4),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Special deals on the latest cell phones and smartphones. Get FREE SHIPPING on phones and devices with new activations.",
        styleDescription: TextStyle(
          color: Color(0xff7FFFD4),
          fontSize: 20.0,
          fontStyle: FontStyle.italic,
        ),
        backgroundImage: "assets/images/pageView4.jpg",
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "Baby Products",
        styleTitle: TextStyle(
            color: Color(0xffFFDAB9),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
           ),
        description:
        "Baby Store: Shop for New Born Baby products online at best prices in India. Choose from a wide range of New Born Baby products at Fashion App you will enjoy with best quality and best price",
        styleDescription: TextStyle(
            color: Color(0xffFFDAB9),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            ),
        backgroundImage: "assets/images/pageView3.jpg",
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    // Do what you want
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => HomeScreen()),
    // );
    Navigator.pushNamedAndRemoveUntil(context, "/loginPage", (route) => false);
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffF3B4BA),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Color(0x33F3B4BA)),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33FFA8B0)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: Color(0x33FFA8B0),
      colorActiveDot: Color(0xffFFA8B0),
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.grey,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}

