import 'package:flutter_app/model.details/current.dart';
import 'package:flutter_app/model.details/previous.dart';

class PriceDetails {
  Previous previous;
  Current current;

  PriceDetails({required this.current, required this.previous});

  Map<String, dynamic> toJson() {
    return {
      'current': current.toJson(),
      'previous': previous.toJson(),
    };
  }

  factory PriceDetails.fromJson(Map<String, dynamic> json) {
    return PriceDetails(
      current: Current.fromJson(json['current']),
      previous: Previous.fromJson(json['previous']),
    );
  }
}
