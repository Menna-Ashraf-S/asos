import 'package:flutter_app/model.details/allData.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Api {
  static Future<AllData> getdetails(int id) async {
    Response futuredetails = await get(
        Uri.parse(
            'https://asos2.p.rapidapi.com/products/v3/detail?id=${id}&lang=en-US&store=US&sizeSchema=US&currency=USD'),
        headers: {
          'X-RapidAPI-Key':
              'afa947549dmshb5bc070df85418bp1687c2jsn3e90f2fdcef3',
          'X-RapidAPI-Host': 'asos2.p.rapidapi.com',
        });
    if (futuredetails.statusCode <= 299 && futuredetails.statusCode >= 200) {
      final Map<String, dynamic> jsonBody = jsonDecode(futuredetails.body);
      AllData alldetails = AllData.fromJson(jsonBody);
      return alldetails;
    } else {
      throw Exception('can not get Products ${futuredetails.body}');
    }
  }
}
