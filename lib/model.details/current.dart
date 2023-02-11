class Current {
  String text;
  double value;

  Current({required this.text, required this.value});

  Map<String, dynamic> toJson() {
    return {'text': this.text, 'value': this.value};
  }

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      text: json['text'],
      value: json['value'],
    );
  }
}
