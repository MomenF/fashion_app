import 'dart:convert';

import 'package:e_commerce_app/Components/products.dart';
import 'package:e_commerce_app/models/ElectronicModel/CategoryModel.dart';
import 'package:http/http.dart' as http;

class RestApi {

Future<List<CategoryModel?>?> fetchElectronicData(int? ID) async{
  List<CategoryModel?> modelList = [];
  var url = Uri.parse("https://retail.amit-learning.com/api/categories/$ID" );
  var response = await http.get(url);
  if(response.statusCode == 200){

    var data =await jsonDecode(response.body);
    var prod= data['products'];
for(var item in prod){
  modelList.add(CategoryModel.fromJson(item));
}
    return modelList;

  }else{print(" error Status Code ${response.statusCode}"); }

  print(modelList);
  return modelList;
}


}