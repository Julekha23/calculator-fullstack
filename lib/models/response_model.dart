class CalculatorResponse {
  final String result;

  CalculatorResponse({
    required this.result,
  });

  factory CalculatorResponse.fromJson(Map<String, dynamic> json) {
    return CalculatorResponse(
      result: json["result"].toString(),
    );
  }
}