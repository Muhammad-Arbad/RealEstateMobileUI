import 'package:coding_chellange/const/constants.dart';
import 'package:coding_chellange/utils/page_navigation.dart';
import 'package:coding_chellange/views/homepage_view.dart';
import 'package:coding_chellange/widgets/custom_scaffold.dart';
import 'package:coding_chellange/widgets/text_widgets.dart';
import 'package:flutter/material.dart';



class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: Image.asset("assets/images/logo.png") ,
      bodyWidget: Column(
        // crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.fromLTRB(30,0,30,10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    DashboardTextBold(text: "Looking", textColor: Color(0xFF3AB4BC),),
                    DashboardTextBold(text: " for an", textColor: Color(0xFFF3A816),),
                  ],
                ),
                DashboardTextBold(text: "elegant house this", textColor: Colors.black,),
                DashboardTextBold(text: "is the place", textColor: Colors.black,),
                SizedBox(height: 20),
                DashboardTextNormal(text: "Welcome friends, are you looking"),
                DashboardTextNormal(text: "for us?"),
                SizedBox(height: 10),
                DashboardTextNormal(text: "Congratulations you have found us"),
                SizedBox(height: 20),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomAppColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0), // Set border radius to 5px
                      ),
                    ),
                    onPressed: (){

                      Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePageView()));


                    }, child: Container(
                  width: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Next",style: TextStyle(fontSize: 18 ,color: Colors.white),),
                      ImageIcon(AssetImage("assets/icons/arrow.png"),color: Colors.white,)
                    ],
                  ),
                ))

              ],
            ),
          ),
          Image.asset("assets/images/house.png"),
        ],
      ),

    );
  }
}