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
    "assets/img/angry/a1.jpg",
    "title": "No More Anger",
    "description":
    "No More Anger - Binaural Beats & Isochronic Tones (Subliminal Messages).",

    "link" : "https://www.youtube.com/watch?v=Fh3Y9vTCOGQ"
  },
  {
    "img":
    "assets/img/angry/a2.jpg",
    "title": "Anger & Stress Relief",
    "description":
    "Anger & Stress Relief - Binaural Beats Session - By Minds in Unison",
    "price": "View on Youtube",
    "link": "https://www.youtube.com/watch?v=0fG1IK57VhQ"

  },
  {
    "img":
    "assets/img/angry/a3.jpg",
    "title": "(432 Hz) : Heal Anxiety",
    "description":
    "Let Go of Resentment & Anger (432 Hz) : Heal Anxiety, Guilt, Bitterness - Reprogram Your Mind",

    "link": "https://www.youtube.com/watch?v=8wVtNyJN-pA"
  },
  {
    "img":
    "assets/img/angry/a4.jpg",
    "title": "Anger Management , Reduce Fear",
    "description":
    "Anger Management , Reduce Fear, Anti Depression, Stress Relief Binaural Beats Music",

    "link": "https://www.youtube.com/watch?v=j56coeJEeX4"
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

class Angry extends StatefulWidget {
  @override
  _AngryState createState() => _AngryState();
}

class _AngryState extends State<Angry>{

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
        title: "Angry",
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