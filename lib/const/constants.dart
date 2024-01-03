
import 'package:flutter/material.dart';





class CustomAppColors{
  
  
  static final Color primaryColor = Color(0xFF3ab4bc);
  static final Color greyColor = Color(0xFFBDBBBC);
  static final Color white = Colors.white;
  static final Color black = Colors.black;
}

class CustomAppTexts{

  static  TextStyle whiteTextStyle18 = TextStyle(
    fontSize: 18,
    color: CustomAppColors.white,
    fontWeight: FontWeight.bold
  );

  static  TextStyle blackTextStyle18 = TextStyle(
      fontSize: 18,
      color: CustomAppColors.black,
      fontWeight: FontWeight.bold
  );

  static  TextStyle blackTextStyle25 = TextStyle(
      fontSize: 25,
      color: CustomAppColors.black,
      fontWeight: FontWeight.bold
  );

  static  TextStyle whiteTextStyle12 = TextStyle(
      fontSize: 12,
      color: CustomAppColors.greyColor,
      fontWeight: FontWeight.bold
  );

  static  TextStyle normalTextStyle15 = TextStyle(
      fontSize: 15,
      color: CustomAppColors.greyColor,
  );

  static  TextStyle primaryClrTextStyle12 = TextStyle(
      fontSize: 12,
      color: CustomAppColors.primaryColor,
      fontWeight: FontWeight.bold
  );
}