class Numbers {
  final double a;
  final double b;

  Numbers({
    required this.a,
    required this.b,
  });

  Map<String, dynamic> toJson() {
    return {
      "a": a,
      "b": b,
    };
  }
}