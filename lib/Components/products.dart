import 'package:e_commerce_app/MainScreens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Products extends StatefulWidget {
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Map<String,dynamic>> productList = [
    {"id":1,
      "name" : " Running Shoes ",
      "picture" : "assets/images/products/shoes1.jpg",
      "price" : 450 ,
      "old price" : 600 ,
      "size":[40,39,41,42],
      // "colors":["red","white","yellow"],
      // "quantity": 15,
      "Condition":"New",
    },
    {"id":2,
      "name" : " Men's Invader Steel Toe Work Shoe  ",
      "picture" : "assets/images/products/shoes2.jpg",
      "price" : 690 ,
      "old price" : 900 ,
      "size":[43,39,45,42],
      // "colors":["Orange","white","yellow"],
      // "quantity": 22,
      "Condition":"New",

    },
    {"id":3,
      "name" : " Golden Trouser ",
      "picture" : "assets/images/products/tr1.jpg",
      "price" : 190 ,
      "old price" : 235 ,
      "size":[35,39,38,42,40],
      // "colors":["Black","White","Gold","Grey"],
      // "quantity": 22,
      "Condition":"Used",

    },
    {"id":4,
      "name" : " Men Raining Jacket ",
      "picture" : "assets/images/products/jac1.jpg",
      "price" : 780 ,
      "old price" : 1095 ,
      "size":[41,43,38,40,44,45],
      // "colors":["Black","White","Gold","Grey"],
      // "quantity": 22,
      "Condition":"Used",


    },
  ];


  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: productList.length,
          itemBuilder: (BuildContext context,index){
            return SingleProduct(
                productName: productList[index]["name"],
                productPic: productList[index]["picture"],
                productPrice: productList[index]["price"],
              productOldPrice: productList[index]["old price"],
              productCondition: productList[index]["Condition"],
            );
          }
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {

  late final String productName ;
  late final String productPic ;
  late final int productPrice ;
  late final int productOldPrice ;
  late final String productCondition ;


  SingleProduct(
      {required this.productName,
        required this.productPic,
        required this.productOldPrice,
        required this.productPrice,
        required this.productCondition,
      });

  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetails(
            productDetailName: this.productName ,
            productDetailOldPrice: this.productOldPrice,
            productDetailPic: this.productPic,
            productDetailPrice: this.productPrice,
            productDetailCondition: this.productCondition,
          )));
        },
        child: GridTile(
          header: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.teal.withOpacity(.4),
                child: Text(productCondition,style: TextStyle(
                fontWeight: FontWeight.bold,
                color: productCondition == "New"?Colors.blue:Colors.red,
              ),),),
            ],
          ),
          footer: Container(
            color: Colors.grey.withOpacity(.4),
            child: ListTile(
              title: Text(
                productName,
                style: TextStyle(
                fontWeight: FontWeight.bold
              ),
                maxLines: 3,

              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\$${productPrice}",style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("\$${productOldPrice}",style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 3,
                  ),),
                ],
              ),
            ),
          ),
          child: Image.asset(productPic),
        ),
      ),
    );
  }
}

