



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class CustomScaffold extends StatelessWidget {
  CustomScaffold({super.key,required this.bodyWidget,this.bottomWidget,this.appBarRightIcon,required this.appBarTitle});

  Widget? bodyWidget,appBarTitle;
  Widget? bottomWidget;
  List<Widget>? appBarRightIcon;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7F9),
      appBar:
      appBarTitle!=null?
      AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        centerTitle: false,
        title:
        Container(
            padding: const EdgeInsets.fromLTRB(20,0,30,0),
            child: appBarTitle),
        actions: appBarRightIcon,
      ):null,
      body: bodyWidget,

      bottomNavigationBar: bottomWidget,

    );
  }
}
