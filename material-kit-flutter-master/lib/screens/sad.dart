import 'package:flutter/material.dart';

import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:material_kit_flutter/widgets/drawer2.dart';
import 'package:material_kit_flutter/widgets/slider-product.dart';

List<Map<String, String>> imgArray = [
  {
    "img":
    "assets/img/sad/s1.jpg",
    "title": "Sad Piano Meditation Therapy",
    "description":
    "MUSIC FOR CRYING! Sad Piano Meditation Therapy Binaural Waves",
    "price": "View on Youtube",
    "link" : "https://www.youtube.com/watch?v=PjQLkOXlqKI"
  },
  {
    "img":
    "assets/img/sad/s2.jpg",
    "title": "Heal Your Past",
    "description":
    "Heal Your Past & Let Go Of Your Pain - Binaural Beats & Isochronic Tones (With Subliminal Messages)",
    "price": "View on Youtube",
    "link": "https://www.youtube.com/watch?v=0oQ-EAS3b7w"

  },
  {
    "img":
    "assets/img/sad/s3.jpg",
    "title": "LIVE",
    "description":
    "this beat will make you cry",

    "link": "https://www.youtube.com/watch?v=gjgcSLuy2V8"
  },

  {
    "img":
    "assets/img/icons/more.png",
    "title": "More Suggestions?",
    "description":
    "Click on the image or youtube icon",

    "link": "https://www.youtube.com/results?search_query=depression+binaural+beats"
  },
];

class Sad extends StatefulWidget {
  @override
  _SadState createState() => _SadState();
}

class _SadState extends State<Sad>{

  bool switchValueOne;
  bool switchValueTwo;

  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Navbar(
        title: "Sad",
        bgColor: Colors.transparent,



      ),
      //backgroundColor: Colors.blueAccent,
      drawer: MaterialDrawer(currentPage: "Depressed"),
      body: Container(
          decoration:BoxDecoration(
              image:DecorationImage(
                image:AssetImage("assets/img/Blue3.jpg"),
                fit: BoxFit.cover,
                /*gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops:[0.7,1.3],
                colors: [Colors.indigoAccent[700], Colors.white]*/
              )
          ),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top:100),
                    child: Text("Suggestions", style: TextStyle(fontSize: 30, letterSpacing: 2,fontWeight: FontWeight.w600, color: Colors.white))),
                //Divider(height:30, color: Colors.grey,thickness: 3,),
                Padding(
                  padding:  EdgeInsets.only(left: 8.0, top: 25, bottom: 32),
                  child: Align(
                    alignment: Alignment.centerLeft,

                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 50),
                  child: ProductCarousel(imgArray: imgArray),
                )


              ],
            ),
          )

      ),


    );
  }

}