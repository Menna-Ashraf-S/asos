class Images {
  String url;

  Images({required this.url});

  Map<String, dynamic> toJson() {
    return {
      'url': this.url,
    };
  }

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
      url: json['url'],
    );
  }
}
