import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/numbers.dart';

class ApiService {
  static const String baseUrl = "http://192.168.56.1:3000/api";

  Future<double> add(double a, double b) async {
    final response = await http.post(
      Uri.parse("$baseUrl/add"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(Numbers(a: a, b: b).toJson()),
    );
    print(response.body);
    // final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["result"] as num).toDouble();
    } else {
      throw Exception(response.body);
    }
  }

  Future<double> sub(double a, double b) async {
    final response = await http.post(
      Uri.parse("$baseUrl/sub"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(Numbers(a: a, b: b).toJson()),
    );
    print(response.body);
    // final data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["result"] as num).toDouble();
    } else {
      throw Exception(response.body);
    }
    // return data["result"];
  }

  Future<double> mul(double a, double b) async {
    final response = await http.post(
      Uri.parse("$baseUrl/mul"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(Numbers(a: a, b: b).toJson()),
    );
    print(response.body);
    // final data = jsonDecode(response.body);
    //
    // return data["result"];
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["result"] as num).toDouble();
    } else {
      throw Exception(response.body);
    }
  }

  Future<double> div(double a, double b) async {
    final response = await http.post(
      Uri.parse("$baseUrl/div"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(Numbers(a: a, b: b).toJson()),
    );
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data["result"] as num).toDouble();
    } else {
      throw Exception(response.body);
    }
  }
}
