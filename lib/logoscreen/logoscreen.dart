
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../calcu/calculator.dart';
import '../widgets/helper.dart';

class LogoScreen extends StatefulWidget{
  @override
  State<LogoScreen> createState()=>_LogoScreenState();
}
class _LogoScreenState extends State<LogoScreen>{
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=>CalculatorScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.white30,
      body:Center(
        child:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            UiHelper.CustomImage(img:"icons8-calculator-250.png"),
            UiHelper.CustomText(text: "Calculator", color: Colors.black,fontweight: FontWeight.bold, fontsize: 30,fontfamily: "bold")
          ],),
      ),
    );
  }
}