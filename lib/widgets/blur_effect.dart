import 'dart:ui';
import 'package:flutter/material.dart';




class CustomBlurEffect extends StatelessWidget {
  const CustomBlurEffect({
    super.key,
  });


  final double blurEffect = 2;

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: blurEffect, sigmaY: blurEffect),
      child: Container(
        color: Colors.transparent,
      ),
    );
  }
}