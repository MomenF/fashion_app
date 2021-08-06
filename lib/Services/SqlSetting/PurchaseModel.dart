class PurchaseModel {
  int? _id;
  String? _name ;
  var  _price ;
  String? _pic ;
  int? _quantity ;

  PurchaseModel(dynamic obj){
    _id = obj["id"];
    _name = obj["name"];
    _price = obj["price"];
    _pic = obj["pic"];
    _quantity = obj["quantity"];
  }

  int? get quantity => _quantity;

  String? get pic => _pic;

  dynamic get prince => _price;

  String? get name => _name;

  int? get id => _id;

  Map<String,dynamic> toMap()=> { "id": _id, "name": _name , "price" : _price , "pic":_pic, "quantity": _quantity };

}
