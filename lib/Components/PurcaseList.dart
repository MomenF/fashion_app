import 'package:e_commerce_app/Services/SqlSetting/PurchaseDatabase.dart';
import 'package:e_commerce_app/Services/SqlSetting/PurchaseModel.dart';
import 'package:e_commerce_app/Services/SqlSetting/PurchaseModel.dart';
import 'package:flutter/material.dart';

class PurchaseList extends StatefulWidget {

 static String id =  "purchaseAll";
  late final purchaseName;

  late final purchasePic;

  late final purchasePrice;

  late final purchaseQuantity;

  // PurchaseList(this.purchaseName, this.purchasePic, this.purchasePrice,
  //     this.purchaseQuantity);

  @override
  _PurchaseListState createState() => _PurchaseListState();
}

class _PurchaseListState extends State<PurchaseList> {
  PurchaseDatabase? helper;
  PurchaseModel? model ;
  static int? m = 0 ;

  @override
  void initState() {
    helper = PurchaseDatabase();
    // TODO: implement initState
    // model = PurchaseModel();
    super.initState();
  }
  void initDb() async {
    model = (await helper!.allPurchase()) as PurchaseModel?;
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Cart List"),
        actions: [
          Row(
            children: [
              Text("The Total Price : "),

            ],
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder (
          future: helper!.allPurchase(),
          builder: (context, AsyncSnapshot? snap) {
            if (snap!.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else if (snap.hasData) {
              print("the snap has Data");
              return ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    height: 25,
                    thickness: 3,
                  );
                },
                  itemCount: snap.data.length,
                  itemBuilder: (context, index) {
                    var model = PurchaseModel.fromMap(snap.data[index]);
                    return Expanded(

                      child: ListTile(

                        leading: Container(
                          height: 200,
                          child: Image.network("${model.pic}",fit: BoxFit.fitWidth,height:100 ,),
                        ),
                        title: Text("${model.name}" , style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("the price : \$${model.price}",style: TextStyle(
                              fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),),
                            Text(" The Quantity :  ${model.quantity}",style: TextStyle(
                                fontWeight: FontWeight.bold,
                              fontSize: 16,

                            ),),
                          ],
                        ),
                        subtitle: Text("The Item is in Progress ... "),
                      ),

                    );
                  }, );
            } else {
              return Center(
                child: Text("No Data Found"),
              );
            }
          },
        ),),
      );

  }
}


/**
 *
 *
 * FutureBuilder<List<PurchaseModel>>(
    future: helper!.allPurchase(),
    builder: (context, AsyncSnapshot? snap) {

    if (snap!.connectionState != ConnectionState.done) {
    return CircularProgressIndicator();
    } else if (snap.hasData) {
    print("the snap has Data");
    return ListView.builder(
    itemCount: snap.data.length,
    itemBuilder: (context, index) {
    var model = PurchaseModel.fromMap(snap.data);
    return Container(
    height: 200,
    child: ListTile(
    leading: Image.network("${model.pic}"),
    title: Text("${model.name} ${model.price} ${model.id}"),
    ),
    );
    });
    } else {
    return Center(
    child: Text("No Data Found"),
    );
    }
    },
    ),**/