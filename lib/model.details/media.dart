import 'package:flutter_app/model.details/images.dart';

class Media {
  List<Images>? images;

  Media({required this.images});

  Map<String, dynamic> toJson() {
    return {
      'images': List<dynamic>.from(images!.map((x) => x.toJson())),
    };
  }

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      images: List<Images>.from(json['images'].map((x) => Images.fromJson(x))),
    );
  }
}
