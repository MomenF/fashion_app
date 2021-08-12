import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Components/Drower.dart';
import 'package:e_commerce_app/Services/ApiServices/ApiMethod.dart';
import 'package:e_commerce_app/Services/SqlSetting/PurchaseDatabase.dart';
import 'package:e_commerce_app/Services/SqlSetting/PurchaseModel.dart';
import 'package:e_commerce_app/models/ElectronicModel/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PurcaseList.dart';

class AllProductDetails extends StatefulWidget {

  @override
  _AllProductDetailsState createState() => _AllProductDetailsState();

  late final  productPic ;
   late int?  productPrice ;
  late final  productName ;
  late final  productDiscribtion ;
  late final  Stock ;
  int? getPrice() => this.productPrice ;


  AllProductDetails({this.productPic, this.productPrice, this.productName,
    this.productDiscribtion, this.Stock});


}


class _AllProductDetailsState extends State<AllProductDetails> with SingleTickerProviderStateMixin{


  // late AnimationController controller ;

  //Todo Variables
  RestApi api = RestApi();
   int itemCount = 1 ;
   PurchaseModel? model;
  PurchaseDatabase? helper ;
  AllProductDetails? details ;

  @override
  void initState() {
    // controller = AnimationController(
    //   upperBound: widget.productPrice!.toDouble(),
    //   duration: Duration(
    //       seconds: 3),
    //   vsync: this,);
    // controller.forward();
    // controller.addListener(() {
    //   setState(() {
    //
    //   });
    //   print(controller.value);
    // });

    api.fetchData(3);
    // TODO: implement initState
    super.initState();
    helper = PurchaseDatabase();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("Electronic Products"),

      ),
      body: Container(
      child: Container(
        margin: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: GridTile(
                    child: CachedNetworkImage(
                        imageUrl: "${widget.productPic}"),
                    footer: Container(
                      height: 80,
                      color: Colors.lightBlueAccent.withOpacity(.4),
                      child: ListTile(
                        title: Container(
                          width: 50,
                          child:  Text(widget.productName,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,

                            ),
                            maxLines: 3,
                          ),),

                        trailing: Container(
                          color: Colors.red,
                          child: Text(
                            "\$${widget.productPrice}",style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 19,
                          ),
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
                        onPressed: () async {
                          PurchaseModel simple = PurchaseModel(
                            {
                              "name":widget.productName,
                              "price":widget.productPrice,
                              "pic":widget.productPic,
                              "quantity":widget.Stock,
                            }
                          );
                          print("Ana Geeet");
                         int? id = await helper!.createPurchase(simple);
                         print("$id the data in model");
                         Navigator.pushNamed(context, PurchaseList.id);

                        },
                        child: Text("Buy Now",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    IconButton(onPressed: (){
                    Navigator.pushNamed(context, PurchaseList.id);
                    }, icon: Icon(Icons.shopping_cart_outlined,color: Colors.red,)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border,color: Colors.red,)),
                  ],
                ),
              ),
              //============Count Bannar ===========
              Row(
                children: [
                  Text("The Price" ,style: TextStyle(
                    color: Colors.red,
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                  ) ,),
                  SizedBox(
                    width: 5,
                  ),

                  Container(
                    height: 30,
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText:
                            "${ (widget.productPrice! * itemCount).toString()} EGP",
                        labelStyle: TextStyle(
                          color: Colors.black
                      )
                      ),

                      enabled: false,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),


                  Text("Add to Cart" ,style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ) ,),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 30,
                    width: 60,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: itemCount.toString(),
                          labelStyle: TextStyle(
                              color: Colors.black
                          )
                      ),

                      enabled: false,
                    ),
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                          child: IconButton(onPressed: (){
                            if (itemCount < widget.Stock && itemCount >= 1 ){
                              setState(() {
                                itemCount++;
                              });
                            }
                          }, icon: Icon(Icons.add,color: Colors.white,size: 15,))),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.red,
                          child: IconButton(onPressed: (){
                            if (itemCount > 1){
                              setState(() {
                                itemCount--;
                              });
                            }
                          }, icon: Icon(Icons.remove,color: Colors.white,size: 15,))),

                    ],
                  ),


                ],
              ),
              ListTile(
                title: Text("Product Details",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),),
                  subtitle: Text(widget.productDiscribtion == null ? widget.productName:widget.productDiscribtion,
                  style: TextStyle(
                    fontSize: 20,

              ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),) ;
  }
}
