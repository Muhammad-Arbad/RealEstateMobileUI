import 'package:coding_chellange/const/constants.dart';
import 'package:coding_chellange/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class PropertyDetailView extends StatefulWidget {
  PropertyDetailView(
      {super.key,
      required this.propertyAssetName,
      required this.propertyName,
      required this.description,
      required this.rating,
      required this.value});

  String propertyName, propertyAssetName, rating, description, value;

  @override
  State<PropertyDetailView> createState() => _PropertyDetailViewState();
}

class _PropertyDetailViewState extends State<PropertyDetailView> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBarTitle: null,
      bodyWidget: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Image.asset(
                      "assets/house/${widget.propertyAssetName}.png",
                      fit: BoxFit.cover,
                    )),
                Positioned(
                    top: 70,
                    left: 20,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: CustomAppColors.white,
                      child: IconButton(
                        splashRadius: 20,
                        icon: const ImageIcon(
                          AssetImage("assets/icons/backArrow.png"),
                          size: 15,
                          // color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    itemSize: 30,
                    initialRating: double.parse(widget.rating),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    ignoreGestures: true,
                    onRatingUpdate: (rating) {
                      // print(rating);
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text(widget.propertyName,style: CustomAppTexts.blackTextStyle25,),
                    ImageIcon(AssetImage("assets/icons/heart1.png"))
                  ],),
                  SizedBox(height: 20,),
                  Text("Description",style: CustomAppTexts.blackTextStyle18,),
                  SizedBox(height: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries",style: CustomAppTexts.normalTextStyle15,textAlign: TextAlign.justify,
                      maxLines: flag?3:null,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            child:  Row(

                              children: <Widget>[
                                 Text(
                                  flag ? "Read More" : "Read Less",
                                  style: new TextStyle(color: Colors.blue),
                                ),
                              ],
                            ),
                            onTap: () {
                              setState(() {
                                flag = !flag;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(
                      height: MediaQuery.of(context).size.width/2,
                      child: Image.asset(
                        "assets/images/maps.png",
                        fit: BoxFit.cover,
                      )),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomWidget: Container(
        height: 100,
        color: CustomAppColors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Price",style: CustomAppTexts.blackTextStyle18,),
                  Text("\$ "+widget.value,style: CustomAppTexts.blackTextStyle25,),
                ],
              ),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomAppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0), // Set border radius to 5px
                    ),
                  ),
                  onPressed: (){

                  }, child: Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                // width: 100,
                child: Text("Pay now",style: TextStyle(fontSize: 18 ,color: Colors.white),),
              )),
            ],
          ),
        )
      ),
    );
  }
}
