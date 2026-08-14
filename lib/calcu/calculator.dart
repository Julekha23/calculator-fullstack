import 'package:calculator/widgets/helper.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final ApiService api = ApiService();

  String display = "0";
  String history = "";

  double? firstNumber;
  String? operation;
  bool isSecondNumber = false;

  final List<String> buttons = [
    "7", "8", "9", "/",
    "4", "5", "6", "*",
    "1", "2", "3", "-",
    "C", "0", "=", "+",
  ];

  Future<void> onButtonPressed(String value) async {
    // Clear
    if (value == "C") {
      setState(() {
        display = "0";
        history = "";
        firstNumber = null;
        operation = null;
        isSecondNumber = false;
      });
      return;
    }

    // Number
    if (RegExp(r'^[0-9]$').hasMatch(value)) {
      setState(() {
        if (display == "0" || isSecondNumber) {
          display = value;
          isSecondNumber = false;
        } else {
          display += value;
        }
      });
      return;
    }

    // Operator
    if (["+", "-", "*", "/"].contains(value)){
      if (display == "0" && firstNumber == null) return;
      firstNumber = double.parse(display);
      operation = value;

      setState(() {
        history = "$display $value";
        isSecondNumber = true;
      });

      return;
    }

    // Equals
    if (value == "=") {
      if (firstNumber == null || operation == null) return;

      double secondNumber = double.parse(display);
      double answer = 0;

      try {
        switch (operation) {
          case "+":
            answer = await api.add(firstNumber!, secondNumber);
            break;

          case "-":
            answer = await api.sub(firstNumber!, secondNumber);
            break;

          case "*":
            answer = await api.mul(firstNumber!, secondNumber);
            break;

          case "/":
            answer = await api.div(firstNumber!, secondNumber);
            break;
        }

        setState(() {
          history = "$firstNumber $operation $secondNumber =";
          display = answer.toString();

          firstNumber = answer;
          operation = null;
          isSecondNumber = true;
        });
      } catch (e) {
        setState(() {
          display = "Error";
          history = "";
          firstNumber = null;
          operation = null;
          isSecondNumber = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: UiHelper.CustomText(text:"Calculator", color: Colors.white, fontweight: FontWeight.bold, fontsize:30),
        backgroundColor: Colors.black,
        centerTitle: false,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    history,
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    display,
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: buttons.length,
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemBuilder: (context, index) {
                return ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button color
                    foregroundColor: Colors.white, // Text/icon color
                  ),
                  onPressed: () => onButtonPressed(buttons[index]),
                  child: Text(
                    buttons[index],
                    style: const TextStyle(fontSize: 28),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}