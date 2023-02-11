class Brand {
  String name;

  Brand({required this.name});

  Map<String, dynamic> toJson() {
    return {
      'name': this.name,
    };
  }

  factory Brand.fromJson(Map<String, dynamic> json) {
    return Brand(
      name: json['name'],
    );
  }
}
