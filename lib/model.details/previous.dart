class Previous {
  double value;

  Previous({required this.value});

  Map<String, dynamic> toJson() {
    return {
      'value': this.value,
    };
  }

  factory Previous.fromJson(Map<String, dynamic> json) {
    return Previous(
      value: json['value'].toDouble(),
    );
  }
}
