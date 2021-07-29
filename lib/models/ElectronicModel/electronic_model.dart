/// category : {"id":2,"name":"Electronics","avatar":"https://retail.amit-learning.com/images/categories/0dFQMWgiSbwa6Z4pcWw24DkV4Fw5TzJIRuosZz0e.jpg","products":[{"id":5,"name":"LG 32LM630B - 32-inch HD LED Smart TV","title":"LG TV - 32-inch","category_id":2,"description":"An HD screen delivers accurate images in stunning resolution and vivid color, The advanced image processor adjusts color for richer, more natural images. Enjoy the beauty of nature’s true colors on your TV screen.","price":4000,"discount":0,"discount_type":null,"currency":"EGP","in_stock":65,"avatar":"https://retail.amit-learning.com/images/products/G7LX8TpZzABsoYRCwVTOL4pF9o3Kf32BsGrQ1U9n.jpg","price_final":4000,"price_final_text":"4000 EGP"},{"id":6,"name":"Contex LE-55SZ101 - 55-inch UHD 4K D-LED","title":"Smart Display - 55-inch","category_id":2,"description":"4K provides much more detailed and less pixel visible images than 1080p. 4K delivers better-looking image for larger screen sizes.","price":6500,"discount":12,"discount_type":"PERCENTAGE","currency":"EGP","in_stock":12,"avatar":"https://retail.amit-learning.com/images/products/qaFVExb7Anh4liJKPLbElah2SasrC8TWUA3iaAGh.jpg","price_final":5720,"price_final_text":"5720 EGP"}]}
/// products : [{"id":5,"name":"LG 32LM630B - 32-inch HD LED Smart TV","title":"LG TV - 32-inch","category_id":2,"description":"An HD screen delivers accurate images in stunning resolution and vivid color, The advanced image processor adjusts color for richer, more natural images. Enjoy the beauty of nature’s true colors on your TV screen.","price":4000,"discount":0,"discount_type":null,"currency":"EGP","in_stock":65,"avatar":"https://retail.amit-learning.com/images/products/G7LX8TpZzABsoYRCwVTOL4pF9o3Kf32BsGrQ1U9n.jpg","price_final":4000,"price_final_text":"4000 EGP"},{"id":6,"name":"Contex LE-55SZ101 - 55-inch UHD 4K D-LED","title":"Smart Display - 55-inch","category_id":2,"description":"4K provides much more detailed and less pixel visible images than 1080p. 4K delivers better-looking image for larger screen sizes.","price":6500,"discount":12,"discount_type":"PERCENTAGE","currency":"EGP","in_stock":12,"avatar":"https://retail.amit-learning.com/images/products/qaFVExb7Anh4liJKPLbElah2SasrC8TWUA3iaAGh.jpg","price_final":5720,"price_final_text":"5720 EGP"}]

class ElectronicModel {
  Category? _category;
  List<Products>? _products;

  Category? get category => _category;
  List<Products>? get products => _products;

  ElectronicModel({
      Category? category, 
      List<Products>? products}){
    _category = category;
    _products = products;
}

  ElectronicModel.fromJson(dynamic json) {
    _category = json["category"] != null ? Category.fromJson(json["category"]) : null;
    if (json["products"] != null) {
      _products = [];
      json["products"].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_category != null) {
      map["category"] = _category?.toJson();
    }
    if (_products != null) {
      map["products"] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 5
/// name : "LG 32LM630B - 32-inch HD LED Smart TV"
/// title : "LG TV - 32-inch"
/// category_id : 2
/// description : "An HD screen delivers accurate images in stunning resolution and vivid color, The advanced image processor adjusts color for richer, more natural images. Enjoy the beauty of nature’s true colors on your TV screen."
/// price : 4000
/// discount : 0
/// discount_type : null
/// currency : "EGP"
/// in_stock : 65
/// avatar : "https://retail.amit-learning.com/images/products/G7LX8TpZzABsoYRCwVTOL4pF9o3Kf32BsGrQ1U9n.jpg"
/// price_final : 4000
/// price_final_text : "4000 EGP"

class Products {
  int? _id;
  String? _name;
  String? _title;
  int? _categoryId;
  String? _description;
  int? _price;
  int? _discount;
  dynamic? _discountType;
  String? _currency;
  int? _inStock;
  String? _avatar;
  int? _priceFinal;
  String? _priceFinalText;

  int? get id => _id;
  String? get name => _name;
  String? get title => _title;
  int? get categoryId => _categoryId;
  String? get description => _description;
  int? get price => _price;
  int? get discount => _discount;
  dynamic? get discountType => _discountType;
  String? get currency => _currency;
  int? get inStock => _inStock;
  String? get avatar => _avatar;
  int? get priceFinal => _priceFinal;
  String? get priceFinalText => _priceFinalText;

  Products({
      int? id, 
      String? name, 
      String? title, 
      int? categoryId, 
      String? description, 
      int? price, 
      int? discount, 
      dynamic? discountType, 
      String? currency, 
      int? inStock, 
      String? avatar, 
      int? priceFinal, 
      String? priceFinalText}){
    _id = id;
    _name = name;
    _title = title;
    _categoryId = categoryId;
    _description = description;
    _price = price;
    _discount = discount;
    _discountType = discountType;
    _currency = currency;
    _inStock = inStock;
    _avatar = avatar;
    _priceFinal = priceFinal;
    _priceFinalText = priceFinalText;
}

  Products.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _title = json["title"];
    _categoryId = json["category_id"];
    _description = json["description"];
    _price = json["price"];
    _discount = json["discount"];
    _discountType = json["discount_type"];
    _currency = json["currency"];
    _inStock = json["in_stock"];
    _avatar = json["avatar"];
    _priceFinal = json["price_final"];
    _priceFinalText = json["price_final_text"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["title"] = _title;
    map["category_id"] = _categoryId;
    map["description"] = _description;
    map["price"] = _price;
    map["discount"] = _discount;
    map["discount_type"] = _discountType;
    map["currency"] = _currency;
    map["in_stock"] = _inStock;
    map["avatar"] = _avatar;
    map["price_final"] = _priceFinal;
    map["price_final_text"] = _priceFinalText;
    return map;
  }

}

/// id : 2
/// name : "Electronics"
/// avatar : "https://retail.amit-learning.com/images/categories/0dFQMWgiSbwa6Z4pcWw24DkV4Fw5TzJIRuosZz0e.jpg"
/// products : [{"id":5,"name":"LG 32LM630B - 32-inch HD LED Smart TV","title":"LG TV - 32-inch","category_id":2,"description":"An HD screen delivers accurate images in stunning resolution and vivid color, The advanced image processor adjusts color for richer, more natural images. Enjoy the beauty of nature’s true colors on your TV screen.","price":4000,"discount":0,"discount_type":null,"currency":"EGP","in_stock":65,"avatar":"https://retail.amit-learning.com/images/products/G7LX8TpZzABsoYRCwVTOL4pF9o3Kf32BsGrQ1U9n.jpg","price_final":4000,"price_final_text":"4000 EGP"},{"id":6,"name":"Contex LE-55SZ101 - 55-inch UHD 4K D-LED","title":"Smart Display - 55-inch","category_id":2,"description":"4K provides much more detailed and less pixel visible images than 1080p. 4K delivers better-looking image for larger screen sizes.","price":6500,"discount":12,"discount_type":"PERCENTAGE","currency":"EGP","in_stock":12,"avatar":"https://retail.amit-learning.com/images/products/qaFVExb7Anh4liJKPLbElah2SasrC8TWUA3iaAGh.jpg","price_final":5720,"price_final_text":"5720 EGP"}]

class Category {
  int? _id;
  String? _name;
  String? _avatar;
  List<Products>? _products;

  int? get id => _id;
  String? get name => _name;
  String? get avatar => _avatar;
  List<Products>? get products => _products;

  Category({
      int? id, 
      String? name, 
      String? avatar, 
      List<Products>? products}){
    _id = id;
    _name = name;
    _avatar = avatar;
    _products = products;
}

  Category.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _avatar = json["avatar"];
    if (json["products"] != null) {
      _products = [];
      json["products"].forEach((v) {
        _products?.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["avatar"] = _avatar;
    if (_products != null) {
      map["products"] = _products?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 5
/// name : "LG 32LM630B - 32-inch HD LED Smart TV"
/// title : "LG TV - 32-inch"
/// category_id : 2
/// description : "An HD screen delivers accurate images in stunning resolution and vivid color, The advanced image processor adjusts color for richer, more natural images. Enjoy the beauty of nature’s true colors on your TV screen."
/// price : 4000
/// discount : 0
/// discount_type : null
/// currency : "EGP"
/// in_stock : 65
/// avatar : "https://retail.amit-learning.com/images/products/G7LX8TpZzABsoYRCwVTOL4pF9o3Kf32BsGrQ1U9n.jpg"
/// price_final : 4000
/// price_final_text : "4000 EGP"

class Products {
  int? _id;
  String? _name;
  String? _title;
  int? _categoryId;
  String? _description;
  int? _price;
  int? _discount;
  dynamic? _discountType;
  String? _currency;
  int? _inStock;
  String? _avatar;
  int? _priceFinal;
  String? _priceFinalText;

  int? get id => _id;
  String? get name => _name;
  String? get title => _title;
  int? get categoryId => _categoryId;
  String? get description => _description;
  int? get price => _price;
  int? get discount => _discount;
  dynamic? get discountType => _discountType;
  String? get currency => _currency;
  int? get inStock => _inStock;
  String? get avatar => _avatar;
  int? get priceFinal => _priceFinal;
  String? get priceFinalText => _priceFinalText;

  Products({
      int? id, 
      String? name, 
      String? title, 
      int? categoryId, 
      String? description, 
      int? price, 
      int? discount, 
      dynamic? discountType, 
      String? currency, 
      int? inStock, 
      String? avatar, 
      int? priceFinal, 
      String? priceFinalText}){
    _id = id;
    _name = name;
    _title = title;
    _categoryId = categoryId;
    _description = description;
    _price = price;
    _discount = discount;
    _discountType = discountType;
    _currency = currency;
    _inStock = inStock;
    _avatar = avatar;
    _priceFinal = priceFinal;
    _priceFinalText = priceFinalText;
}

  Products.fromJson(dynamic json) {
    _id = json["id"];
    _name = json["name"];
    _title = json["title"];
    _categoryId = json["category_id"];
    _description = json["description"];
    _price = json["price"];
    _discount = json["discount"];
    _discountType = json["discount_type"];
    _currency = json["currency"];
    _inStock = json["in_stock"];
    _avatar = json["avatar"];
    _priceFinal = json["price_final"];
    _priceFinalText = json["price_final_text"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = _id;
    map["name"] = _name;
    map["title"] = _title;
    map["category_id"] = _categoryId;
    map["description"] = _description;
    map["price"] = _price;
    map["discount"] = _discount;
    map["discount_type"] = _discountType;
    map["currency"] = _currency;
    map["in_stock"] = _inStock;
    map["avatar"] = _avatar;
    map["price_final"] = _priceFinal;
    map["price_final_text"] = _priceFinalText;
    return map;
  }

}