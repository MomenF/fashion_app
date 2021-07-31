import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commerce_app/Components/AllProductDetails.dart';
import 'package:e_commerce_app/Services/ApiServices/ApiMethod.dart';
import 'package:e_commerce_app/models/ElectronicModel/CategoryModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PhoneProducts extends StatefulWidget {
  const PhoneProducts({Key? key}) : super(key: key);

  @override
  _PhoneProductsState createState() => _PhoneProductsState();
}

class _PhoneProductsState extends State<PhoneProducts> {

  //Todo Variables
  RestApi api = RestApi();

  @override
  void initState() {
    api.fetchData(5);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoryModel?>?>(
        future: api.fetchData(5),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return CircularProgressIndicator();
          } else if (snap.hasData) {
            List<CategoryModel?>? model = snap.data;

            return   GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: snap.data!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2 ,

              ),
              itemBuilder: (context, index) {
                return SingleProduct(
                  productName: model![index]!.name ,
                  Stock: model[index]!.inStock,
                  productPrice:model[index]!.price ,
                  productDiscribtion: model[index]!.description ,
                  productPic:  model[index]!.avatar ,
                );
              },
            );
          } else if (snap.hasError) {
            print("error ${snap.error}");
            return Center(child: Text("${snap.error}"),);
          } else {
            return Center(child: Text("Error Accoured while Sending data"),);
          }
        });
  }
}

class SingleProduct extends StatelessWidget{
  late final  productPic ;
  late final  productPrice ;
  late final  productName ;
  late final  productDiscribtion ;
  late final  Stock ;

  SingleProduct({this.productPic, this.productPrice, this.productName,
    this.productDiscribtion, this.Stock});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AllProductDetails(
          productName: this.productName ,
          productPic: this.productPic ,
          productDiscribtion:  this.productDiscribtion,
          productPrice:  this.productPrice,
          Stock: this.Stock ,
        )));
      },
      child: Card(
        child: GridTile(
          child:CachedNetworkImage(
            imageUrl: '${this.productPic}',
          ) ,
          footer: Container(

            color: Colors.grey.withOpacity(.6),
            child: ListTile(
              title: Text("${this.productName}",
                maxLines: 2,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),),
              trailing: Text("\$${this.productPrice}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.blue,
                    shadows: [
                      Shadow(
                          color: Colors.white,
                          blurRadius: 5,
                          offset: Offset.zero
                      )
                    ]
                ),
              ),
            ),

          ),
        ),
      ),

    );
  }




}