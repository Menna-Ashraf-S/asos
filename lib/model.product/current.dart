class Current {
  String text;

  Current({required this.text});

  Map<String, dynamic> toJson() {
    return {
      'text': this.text,
    };
  }

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      text: json['text'],
    );
  }
}
