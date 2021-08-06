import 'package:e_commerce_app/Services/SqlSetting/PurchaseDatabase.dart';
import 'package:e_commerce_app/Services/SqlSetting/PurchaseModel.dart';
import 'package:flutter/material.dart';

class PurchaseList extends StatefulWidget {
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

  @override
  void initState() {
    helper = PurchaseDatabase();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: FutureBuilder(
          future: helper!.allPurchase(),
          builder: (context, AsyncSnapshot snap) {

            if (snap.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else if (snap.hasData) {
              PurchaseModel? model = snap.data;
              return ListView.builder(
                  itemCount: snap.data.length,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 200,
                      child: ListTile(
                        leading: Image.network("${model!.pic}"),
                        title: Text("${model.name}"),
                      ),
                    );
                  });
            } else {
              return Center(
                child: Text("No Data Found"),
              );
            }
          },
        ),
      ),
    );
  }
}
