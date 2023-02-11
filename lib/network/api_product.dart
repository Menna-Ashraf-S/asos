import 'package:flutter_app/model.product/items.dart';
import 'package:http/http.dart';
import 'dart:convert';

class API {
  static Future<Item> getproduct(int id) async {
    Response futureproduct = await get(
        Uri.parse(
            'https://asos2.p.rapidapi.com/products/v2/list?store=US&offset=0&categoryId=${id}&limit=48&country=US&sort=freshness&currency=USD&sizeSchema=US&lang=en-US'),
        headers: {
          'X-RapidAPI-Key':
              'afa947549dmshb5bc070df85418bp1687c2jsn3e90f2fdcef3',
          'X-RapidAPI-Host': 'asos2.p.rapidapi.com',
        });
    if (futureproduct.statusCode <= 299 && futureproduct.statusCode >= 200) {
      final Map<String, dynamic> jsonBody = jsonDecode(futureproduct.body);
      Item allproducts = Item.fromJson(jsonBody);
      return allproducts;
    } else {
      throw Exception('can not get Products ${futureproduct.body}');
    }
  }
}
