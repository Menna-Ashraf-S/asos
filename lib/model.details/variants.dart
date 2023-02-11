class Variants {
  String brandSize;

  Variants({required this.brandSize});

  Map<String, dynamic> toJson() {
    return {
      'brandSize': this.brandSize,
    };
  }

  factory Variants.fromJson(Map<String, dynamic> json) {
    return Variants(
      brandSize: json['brandSize'],
    );
  }
}
