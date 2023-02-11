import 'package:flutter_app/model.product/products.dart';

class Item {
  String categoryName;
  List<Products>? products;

  Item({required this.products, required this.categoryName});

  Map<String, dynamic> toJson() {
    return {
      'products': List<dynamic>.from(products!.map((x) => x.toJson())),
      'categoryName': this.categoryName,
    };
  }

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      products: List<Products>.from(
          json['products'].map((x) => Products.fromJson(x))),
      categoryName: json['categoryName'],
    );
  }
}
