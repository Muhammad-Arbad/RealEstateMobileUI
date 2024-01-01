import 'package:flutter/material.dart';



class DashboardTextBold extends StatelessWidget {
  DashboardTextBold({
    super.key,
    required this.text,
    required this.textColor
  });

  String text;
  Color textColor;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 30,color: textColor,fontWeight: FontWeight.bold),);
  }
}

class DashboardTextNormal extends StatelessWidget {
  DashboardTextNormal({
    super.key,
    required this.text,
    this.textColor
  });

  String text;
  Color? textColor;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(fontSize: 18,color: textColor!=null? textColor:Color(0Xff88888A)),);
  }
}
