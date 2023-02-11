import 'package:flutter_app/model.details/brand.dart';
import 'package:flutter_app/model.details/media.dart';
import 'package:flutter_app/model.details/prouductType.dart';
import 'package:flutter_app/model.details/variants.dart';
import 'package:flutter_app/model.details/price.dart';

class AllData {
  int id;
  String name;
  Brand brand;
  Media media;
  List<Variants>? variants;
  PriceDetails price;
  ProductType productType;

  AllData(
      {required this.id,
      required this.name,
      required this.brand,
      required this.media,
      required this.variants,
      required this.price,
      required this.productType});

  Map<String, dynamic> toJson() {
    return {
      'variants': List<dynamic>.from(variants!.map((x) => x.toJson())),
      'id': this.id,
      'name': this.name,
      'brand': brand.toJson(),
      'media': media.toJson(),
      'price': price.toJson(),
      'productType': productType.toJson(),
    };
  }

  factory AllData.fromJson(Map<String, dynamic> json) {
    return AllData(
      variants: List<Variants>.from(
          json['variants'].map((x) => Variants.fromJson(x))),
      id: json['id'],
      name: json['name'],
      brand: Brand.fromJson(json['brand']),
      media: Media.fromJson(json['media']),
      price: PriceDetails.fromJson(json['price']),
      productType: ProductType.fromJson(json['productType']),
    );
  }
}
