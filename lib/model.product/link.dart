class Link {
  int id;

  Link({required this.id});

  Map<String, dynamic> toJson() {
    return {
      'categoryId': this.id,
    };
  }

  factory Link.fromJson(Map<String, dynamic> json) {
    return Link(
      id: json['categoryId'],
    );
  }
}
