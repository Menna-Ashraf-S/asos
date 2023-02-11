class FavData {
  int? idSQL;
  String? image;
  String? brand;
  String? type;
  String? price;

  FavData(dynamic obj) {
    if (obj['idSQL'] != null) {
      idSQL = obj['idSQL'];
    }
    image = obj['image'];
    brand = obj['brand'];
    type = obj['type'];
    price = obj['price'];
  }

  FavData.fromMap(Map<String, dynamic> data) {
    if (data['idSQL'] != null) {
      idSQL = data['idSQL'];
    }
    image = data['image'];
    brand = data['brand'];
    type = data['type'];
    price = data['price'];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> Data = {
      'image': image,
      'brand': brand,
      'type': type,
      'price': price,
    };
    if (idSQL != null) {
      Data['idSQL'] = idSQL;
    }
    return Data;
  }
}
