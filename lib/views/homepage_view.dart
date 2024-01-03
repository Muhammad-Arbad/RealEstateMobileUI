import 'dart:ui';
import 'package:coding_chellange/const/constants.dart';
import 'package:coding_chellange/views/property_detail.dart';
import 'package:coding_chellange/widgets/custom_scaffold.dart';
import 'package:coding_chellange/widgets/search_field.dart';
import 'package:flutter/material.dart';



class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {

  List<HomePageListBigTiles> homeTiles = [
    HomePageListBigTiles(houseAssetName: "house1", propertyName: "213 Susan Road", rating: "4.2", propertyRent: "200", description: "2 rooms"),
    HomePageListBigTiles(houseAssetName: "house2", propertyName: "Eden Garden", rating: "3.2", propertyRent: "180", description: "3 rooms"),
    HomePageListBigTiles(houseAssetName: "house3", propertyName: "Jolte Zahro", rating: "4.5", propertyRent: "280", description: "5 rooms"),
    HomePageListBigTiles(houseAssetName: "house4", propertyName: "Wapda Town", rating: "2.0", propertyRent: "120", description: "1 rooms"),
  ];

  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        appBarTitle: Image.asset("assets/images/logo.png"),
        appBarRightIcon: [Container(
            height:25,
            padding: const EdgeInsets.fromLTRB(20,0,30,0),
            child: Image.asset("assets/icons/bell.png")) ,],
        bodyWidget: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30,0,30,0),
            child: Column(
              children: [
                // ShakeError(child: Icon(Icons.add),),
                SearchField(),
                HomePageListTiles(),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyDetailView(
                        propertyAssetName:homeTiles[0].houseAssetName,
                        propertyName:homeTiles[0].propertyName,
                        rating:homeTiles[0].rating,
                        value:homeTiles[0].propertyRent,
                        description:homeTiles[0].description,
                      )));
                    },
                    child: homeTiles[0]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text("Popular Today",style: CustomAppTexts.blackTextStyle18,),
                  Row(children: [
                    Text("Other",style: CustomAppTexts.primaryClrTextStyle12,),
                    const SizedBox(width: 5,),
                    Icon(Icons.keyboard_arrow_down,color: CustomAppColors.primaryColor,)
                  ],)
                ],),
                ListView.builder(
                  physics:const ClampingScrollPhysics(),
                  shrinkWrap: true,
                    itemCount: homeTiles.length-1,
                    itemBuilder: (context,index){
                      return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>PropertyDetailView(
                              propertyAssetName:homeTiles[index+1].houseAssetName,
                              propertyName:homeTiles[index+1].propertyName,
                              rating:homeTiles[index+1].rating,
                              value:homeTiles[index+1].propertyRent,
                              description:homeTiles[index+1].description,
                            )));
                          },
                          child: homeTiles[index+1]);
                    }),

              ],
            ),
          ),
        ),
        bottomWidget: Theme(
          data: ThemeData(),
          child: BottomNavigationBar(
            type:BottomNavigationBarType.fixed,
            onTap: (index){
              setState(() {
                selectedIndex = index;
              });
            },
            currentIndex: selectedIndex,
            showUnselectedLabels: true,
            selectedItemColor: CustomAppColors.primaryColor,
            unselectedLabelStyle: const TextStyle(color: Colors.black),
            unselectedItemColor: Colors.black,
            items:  const [
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/home.png")),
                  // icon: ShakeError(onTap: () { },
                  // child: ImageIcon(AssetImage("assets/icons/home.png"))),
                  // activeIcon: ShakeError(child: ImageIcon(AssetImage("assets/icons/homeF.png"))),
                  activeIcon : ImageIcon(AssetImage("assets/icons/homeF.png")),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/heart.png")),
                  activeIcon: ImageIcon(AssetImage("assets/icons/heartF.png")),
                  label: "Favorite"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/settings.png")),
                  activeIcon: ImageIcon(AssetImage("assets/icons/settingsF.png")),
                  label: "Setting"),
              BottomNavigationBarItem(
                  icon: ImageIcon(AssetImage("assets/icons/profile.png")),
                  activeIcon: ImageIcon(AssetImage("assets/icons/profileF.png")),
                  label: "Profile"),
            ],

          ),
        ),
    );
  }
}


class HomePageListTiles extends StatelessWidget {
   HomePageListTiles({super.key});

  double margin = 15;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, margin, 0, margin),
      height: 120,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("assets/house/house1.png"),
          fit: BoxFit.cover,
        ),
        color: Colors.red,
        borderRadius: BorderRadius.circular(20.0),
      ),

      child: Container(
        // height: 120,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Let's buy a hose",style: CustomAppTexts.whiteTextStyle18,),
              Text("here",style: CustomAppTexts.whiteTextStyle18,),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Diskon 10%",style: CustomAppTexts.whiteTextStyle12,),
                  Text("01 January 2024",style: CustomAppTexts.whiteTextStyle12,),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}


class HomePageListBigTiles extends StatelessWidget {
   HomePageListBigTiles({super.key,required this.houseAssetName,required this.propertyName,required this.rating,required this.propertyRent,required this.description});

   double margin = 15;

   String houseAssetName,propertyName,propertyRent,rating,description;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, margin, 0, margin),
      height: 200,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/house/$houseAssetName.png"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(20.0)
      ),

      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 90,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  padding: const EdgeInsets.all(20),
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    color: Colors.black.withOpacity(0.3), // Change this to your desired color
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            propertyName,
                            style:CustomAppTexts.whiteTextStyle18,
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Colors.white, // Change this to your desired color
                              ),
                            child: Row(
                              children: [
                                const ImageIcon(AssetImage("assets/icons/star.png",),color: Colors.orange,size: 15,),
                                const SizedBox(width: 10,),
                                Text("$rating")
                              ],
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$ $propertyRent/mo",
                            style:  CustomAppTexts.whiteTextStyle12,
                          ),
                          Text(
                            "$description",
                            style: CustomAppTexts.whiteTextStyle12,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}




class ShakeError extends StatefulWidget {
   ShakeError({
    Key? key,
    required this.child,
    required this.onTap,
    this.duration = const Duration(milliseconds: 1000),
    this.deltaX = 10,
    this.curve = Curves.easeInOut,
  }) : super(key: key);

  final Widget child;
  final Duration duration;
  final double deltaX;
  final Curve curve;


  void Function() onTap;

  @override
  State<ShakeError> createState() => _ShakeErrorState();
}

class _ShakeErrorState extends State<ShakeError>
    with SingleTickerProviderStateMixin<ShakeError> {
  late AnimationController controller;
  late Animation<double> offsetAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: widget.duration);
    offsetAnimation = Tween<double>(begin: 0.0, end: 1.0)
        .chain(CurveTween(curve: widget.curve))
        .animate(controller);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  double shake(double animation) {
    double transformed = widget.curve.transform(animation);
    return transformed;
  }

  void _startAnimation() async{
    controller.reset();
    controller.forward();
    await Future.delayed(const Duration(milliseconds: 500));
    controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () {
      //   _startAnimation();
      // },
      onTap: widget.onTap,
      child: AnimatedBuilder(
        animation: offsetAnimation,
        builder: (BuildContext context, Widget? child) {
          return Transform.translate(
            offset: Offset(widget.deltaX * shake(offsetAnimation.value), 0),
            child: child,
          );
        },
        child: widget.child,
      ),
    );
  }
}

// class _ShakeErrorState extends State<ShakeError>
//     with SingleTickerProviderStateMixin<ShakeError> {
//   late AnimationController controller;
//   late Animation<double> offsetAnimation;
//
//   @override
//   void initState() {
//     super.initState();
//     controller = AnimationController(vsync: this, duration: widget.duration);
//     offsetAnimation = Tween<double>(begin: 0.0, end: 1.0)
//         .chain(CurveTween(curve: widget.curve))
//         .animate(controller);
//     controller.repeat(reverse: true);
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   double shake(double animation) {
//     double transformed = widget.curve.transform(animation);
//
//     // Normalize the values to stay within 0 to 1 range
//     while (transformed < 0.0 || transformed > 1.0) {
//       if (transformed < 0.0) {
//         transformed = 1.0 + transformed;
//       } else if (transformed > 1.0) {
//         transformed = transformed - 1.0;
//       }
//     }
//
//     return transformed;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AnimatedBuilder(
//       animation: offsetAnimation,
//       builder: (BuildContext context, Widget? child) {
//         return Transform.translate(
//           offset: Offset(widget.deltaX * shake(offsetAnimation.value), 0),
//           child: child,
//         );
//       },
//       child: widget.child,
//     );
//   }
// }







