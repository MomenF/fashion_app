import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {

  //Todo Variable

  late final  productDetailName;
  late final  productDetailPic;
  late final  productDetailOldPrice;
  late final  productDetailPrice;
  late final  productDetailCondition;



  ProductDetails(
      {this.productDetailName,
      this.productDetailPic,
      this.productDetailOldPrice,
      this.productDetailPrice,
      this.productDetailCondition,

      });

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    double heightMedia= MediaQuery.of(context).size.height;
    double widthMedia= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Fashion App"),
        leading: IconButton(
          icon: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
            Icons.arrow_back,color: Colors.red,),
          ),
          onPressed: () { Navigator.pop(context); },

        ),


      ),
      body: Container(
        margin:  EdgeInsetsDirectional.only(
          start: widthMedia*.02,
          end: widthMedia*.02
        ),
        child: ListView(
          children: [
    //============Image=============
            Container(
              height: 300,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Banner(
                  location: BannerLocation.topStart,
                  message: widget.productDetailCondition,
                  color:  widget.productDetailCondition == "New"?Colors.blue:Colors.red,
                  textStyle: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                  child: GridTile(
                    child: Image.asset("${widget.productDetailPic}"),
                    footer: Container(
                      color: Colors.lightBlueAccent.withOpacity(.4),
                      child: ListTile(
                        leading:Container(
                          width: 200,
                          child:  Text(widget.productDetailName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                        ),
                           maxLines: 4,
                        ),),

                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Text(
                              "\$${widget.productDetailOldPrice}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough,
                                decorationThickness: 2,
                                fontSize: 18

                            ),),
                            Text(
                              "\$${widget.productDetailPrice}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                fontSize: 19

                            ),),
                          ],
                        ),
                      ),
                    ),

                  ),
                ),
              ),
            ),
    //============Buy Now Row =============
            Container(

              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: MaterialButton(
                      color: Colors.red,
                        onPressed: (){},
                      child: Text("Buy Now",style: TextStyle(color: Colors.white),),
                        ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart_outlined,color: Colors.red,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: Colors.red,)),
                ],
              ),
            ),
    //============Size and color  Row =============
            Row(
              children: [
                Expanded(
                  child: MaterialButton(
                    color: Colors.white,
                      textColor: Colors.grey,
                      onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Size"),
                          content: Column(
                            children: [
                              Text("Choose the Size"),
                            ],
                          ),
                          actions: [
                            MaterialButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              child: Text("Cancel"),
                              textColor: Colors.lightBlue,

                            ),
                          ],

                        );
                      });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Size"),
                          Icon(Icons.arrow_drop_down_sharp),
                        ],
                      ),
                      ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: MaterialButton(
                    color: Colors.white,
                      textColor: Colors.grey,
                      onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Colors"),
                          content: Text("Select your Color"),
                          actions: [
                            MaterialButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                              child: Text("Cancel"),
                              textColor: Colors.lightBlue,
                            )
                          ],
                        );
                      });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Color"),
                          Icon(Icons.arrow_drop_down_sharp),
                        ],
                      ),
                      ),
                ),
                SizedBox(
                  width: 2,
                ),
                Expanded(
                  child: MaterialButton(
                    color: Colors.white,
                      textColor: Colors.grey,
                      onPressed: (){
                      showDialog(context: context, builder: (context){
                        return AlertDialog(
                          title: Text("Qantity") ,
                          content: Text("Please Select the Quantity"),
                          actions: [
                            MaterialButton(
                              onPressed: (){
                                Navigator.pop(context);
                              },
                            child: Text("Cancel"),
                              textColor: Colors.lightBlue,
                            )
                          ],
                        );
                      });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Quantity"),
                          Icon(Icons.arrow_drop_down_sharp),
                        ],
                      ),
                      ),
                ),
              ],
            ),
            Divider(
              height:10,
              thickness: 2,
            ),
    //============Product Details =============
            ListTile(
              title: Text("Product Details",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),),
              subtitle: Text("This premium sockliner features higher rebound properties while providing excellent moisture management and a high-level of breathability. ",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),

          ],
        ),
      ),


    );
  }
}
