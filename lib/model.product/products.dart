import 'package:flutter_app/model.product/price.dart';

class Products {
  int id;
  String name;
  Price price;
  String colour;
  String brandName;
  String imageUrl;

  Products(
      {required this.id,
      required this.name,
      required this.colour,
      required this.brandName,
      required this.price,
      required this.imageUrl});

  Map<String, dynamic> toJson() {
    return {
      'price': price.toJson(),
      'id': this.id,
      'name': this.name,
      'brandName': this.brandName,
      'colour': this.colour,
      'imageUrl': this.imageUrl,
    };
  }

  factory Products.fromJson(Map<String, dynamic> json) {
    return Products(
      price: Price.fromJson(json['price']),
      id: json['id'],
      name: json['name'],
      brandName: json['brandName'],
      colour: json['colour'],
      imageUrl: json['imageUrl'],
    );
  }
}
