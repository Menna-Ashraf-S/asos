import 'package:flutter_app/model.product/current.dart';

class Price {
  Current current;

  Price({required this.current});

  Map<String, dynamic> toJson() {
    return {'current': current.toJson()};
  }

  factory Price.fromJson(Map<String, dynamic> json) {
    return Price(
      current: Current.fromJson(json['current']),
    );
  }
}
