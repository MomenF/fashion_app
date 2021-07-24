import 'package:e_commerce_app/MainScreens/product_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Products extends StatefulWidget {
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  List<Map<String,dynamic>> productList = [
    {
      "name" : " Running Shoes ",
      "picture" : "assets/images/products/shoes1.jpg",
      "price" : 450 ,
      "old price" : 600 ,
    },
    {
      "name" : " Men's Invader Steel Toe Work Shoe  ",
      "picture" : "assets/images/products/shoes2.jpg",
      "price" : 690 ,
      "old price" : 900 ,
    },
    {
      "name" : " Golden Trouser ",
      "picture" : "assets/images/products/tr1.jpg",
      "price" : 190 ,
      "old price" : 235 ,
    },
    {
      "name" : " Men Raining Jacket ",
      "picture" : "assets/images/products/jac1.jpg",
      "price" : 780 ,
      "old price" : 1095 ,
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


  SingleProduct(
      {required this.productName,
        required this.productPic,
        required this.productOldPrice,
        required this.productPrice
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
          )));
        },
        child: GridTile(

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

