import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Components/Drower.dart';
import 'package:e_commerce_app/Services/ApiServices/ApiMethod.dart';
import 'package:e_commerce_app/models/ElectronicModel/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AllProductDetails extends StatefulWidget {

  @override
  _AllProductDetailsState createState() => _AllProductDetailsState();

  late final  productPic ;
  late final  productPrice ;
  late final  productName ;
  late final  productDiscribtion ;
  late final  Stock ;

  AllProductDetails({this.productPic, this.productPrice, this.productName,
    this.productDiscribtion, this.Stock});


}


class _AllProductDetailsState extends State<AllProductDetails> {

  //Todo Variables
  RestApi api = RestApi();
   int itemCount = 1 ;


  @override
  void initState() {
    api.fetchData(3);
    // TODO: implement initState
    super.initState();
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
        margin: const EdgeInsetsDirectional.all(5),
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
                        onPressed: (){},
                        child: Text("Buy Now",style: TextStyle(color: Colors.white),),
                      ),
                    ),
                    IconButton(onPressed: (){

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
                        labelText:" "
                            "${ (widget.productPrice * itemCount).toString()} EGP",
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
