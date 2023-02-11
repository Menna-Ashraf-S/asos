class ProductType {
  String name;

  ProductType({required this.name});

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
    };
  }

  factory ProductType.fromJson(Map<String, dynamic> json) {
    return ProductType(
      name: json['name'],
    );
  }
}
