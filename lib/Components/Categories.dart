import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class BrandCategory extends StatelessWidget {

    late final String imageLocation ;
    late final String categoryName ;
    bool onCenter = true;


  BrandCategory({required this.imageLocation , required this.categoryName,onCenter}){
    onCenter = this.onCenter;
  }


  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Container(
        height: 100,
        width: 100,
        child: ListTile(
          title: Image.asset(imageLocation,height: 60,)  ,
          subtitle: Text(categoryName , textAlign:onCenter? TextAlign.center: null,
          maxLines: 3,

          ),
        ),
      ),
    );
  }
}
