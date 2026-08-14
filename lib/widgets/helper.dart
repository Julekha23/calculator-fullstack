import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppColors {
  static const Color scaffoldbackground=Color(0XFFF7CB45);
}
class UiHelper {
  static CustomImage({required String img}) {
    return Image.asset("assets/images/$img");
  }

  static CustomText({
    required String text,
    required Color color,
    required FontWeight fontweight,
    String? fontfamily,
    required double fontsize,
  }) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontsize,
        fontFamily: fontfamily ?? "regular",
        fontWeight: fontweight,
        color: color,
      ),
    );
  }
  static CustomButton(VoidCallback callback){
    return Container(
      height: 18,
      width: 30,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
              color: Color(0XFF27AF34)
          ),
          borderRadius: BorderRadius.circular(4)
      ),
      child: Center(child: Text("Add",style: TextStyle(fontSize: 8,color: Color(0XFF27AF34)),),),
    );
  }
}
