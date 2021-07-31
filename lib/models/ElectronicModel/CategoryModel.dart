/// id : 6
/// name : "Contex LE-55SZ101 - 55-inch UHD 4K D-LED"
/// title : "Smart Display - 55-inch"
/// category_id : 2
/// description : "4K provides much more detailed and less pixel visible images than 1080p. 4K delivers better-looking image for larger screen sizes."
/// price : 6500
/// discount : 12
/// discount_type : "PERCENTAGE"
/// currency : "EGP"
/// in_stock : 12
/// avatar : "https://retail.amit-learning.com/images/products/qaFVExb7Anh4liJKPLbElah2SasrC8TWUA3iaAGh.jpg"
/// price_final : 5720
/// price_final_text : "5720 EGP"

class CategoryModel {
  num? _id;
  String? _name;
  String? _title;
  num? _categoryId;
  String? _description;
  num? _price;
  num? _discount;
  String? _discountType;
  String? _currency;
  num? _inStock;
  String? _avatar;
  num? _priceFinal;
  String? _priceFinalText;

  num? get id => _id;
  String? get name => _name;
  String? get title => _title;
  num? get categoryId => _categoryId;
  String? get description => _description;
  num? get price => _price;
  num? get discount => _discount;
  String? get discountType => _discountType;
  String? get currency => _currency;
  num? get inStock => _inStock;
  String? get avatar => _avatar;
  num? get priceFinal => _priceFinal;
  String? get priceFinalText => _priceFinalText;

  CategoryModel({
    num? id,
      String? name, 
      String? title,
    num? categoryId,
      String? description,
    num? price,
    num? discount,
      String? discountType, 
      String? currency,
    num? inStock,
      String? avatar,
    num? priceFinal,
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

  CategoryModel.fromJson(Map<String,dynamic> json) {
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
