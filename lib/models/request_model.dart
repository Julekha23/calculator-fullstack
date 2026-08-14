class CalculatorRequest {
  final String expression;

  CalculatorRequest({
    required this.expression,
  });

  Map<String, dynamic> toJson() {
    return {
      "result": expression,
    };
  }
}