class CartData {
  int? idSQL;
  String? image;
  String? brand;
  String? type;
  String? price;
  int? count;

  CartData(dynamic obj) {
    if (obj['idSQL'] != null) {
      idSQL = obj['idSQL'];
    }
    image = obj['image'];
    brand = obj['brand'];
    type = obj['type'];
    price = obj['price'];
    count = obj['count'];
  }

  CartData.fromMap(Map<dynamic, dynamic> data) {
    if (data['idSQL'] != null) {
      idSQL = data['idSQL'];
    }
    image = data['image'];
    brand = data['brand'];
    type = data['type'];
    price = data['price'];
    count = data['count'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> Data = {
      'image': image,
      'brand': brand,
      'type': type,
      'price': price,
      'count': count,
    };
    if (idSQL != null) {
      Data['idSQL'] = idSQL;
    }
    return Data;
  }
}
