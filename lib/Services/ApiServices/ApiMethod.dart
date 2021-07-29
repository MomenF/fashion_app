import 'dart:convert';

import 'package:e_commerce_app/Components/products.dart';
import 'package:e_commerce_app/models/ElectronicModel/electronic_model.dart';
import 'package:http/http.dart' as http;

class RestApi {

Future<Products?> fetchElectronicData() async{
  List<Products> modelList = [];
  var url = Uri.parse("https://retail.amit-learning.com/api/categories/2");
  var response = await http.get(url);
  if(response.statusCode == 200){
    var data =await jsonDecode(response.body);
for(var item in data){
  modelList.add(Products)
}

  }else{print(" error Status Code ${response.statusCode}"); }
}

}