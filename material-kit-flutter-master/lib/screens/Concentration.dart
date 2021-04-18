import 'package:flutter/material.dart';

import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';
import 'package:material_kit_flutter/widgets/slider-product.dart';

List<Map<String, String>> imgArray = [
  {
    "img":
    "assets/img/focus/f1.jpg",
    "title": "Focus Music",
    "description":
    "Focus Music, Binaural Beats Concentration Music for Studying, Super Intelligence",

    "link": "https://www.youtube.com/watch?v=U0eLmyJkQBc"
  },
  {
    "img":
    "assets/img/focus/f2.jpg",
    "title": "Studying",
    "description":
    "90 Minutes of Focused Studying: The Best Binaural Beats",

    "link": "https://www.youtube.com/watch?v=eqKQACO4HAk"
  },
  {
    "img":
    "assets/img/focus/f3.jpg",
    "title": "Alpha waves",
    "description":
    "Study Music Alpha Waves: Relaxing Studying Music, Brain Power, Focus Concentration Music, ☯161",

    "link": "https://www.youtube.com/watch?v=WPni755-Krg"
  },
  {
    "img":
    "assets/img/focus/f4.jpg",
    "title": "Study Music",
    "description":
    "Deep Focus Music - Binaural Beats Concentration Music, Study Music",

    "link": "https://www.youtube.com/watch?v=g1LNTAdIi8k"
  },
  {
    "img":
    "assets/img/focus/f5.jpg",
    "title": "Beta Waves Music",
    "description":
    "Super Intelligence: 14 Hz Binaural Beats Beta Waves Music for Focus, Memory and Concentration",

    "link": "https://www.youtube.com/watch?v=HA6nSQawROM"
  },
  {
    "img":
    "assets/img/focus/f6.jpg",
    "title": "Memory Music",
    "description":
    "Super Intelligence: 🍎 Memory Music, Improve Memory and Concentration, Binaural Beats Focus Music",

    "link": "https://www.youtube.com/watch?v=mg7netw1JuM"
  },
  {
    "img":
    "assets/img/focus/f7.jpg",
    "title": "Improve Memory ",
    "description":
    "BiNaural Beats Study Music - Improve Memory and Concentration",

    "link": "https://www.youtube.com/watch?v=xSnulMePm_8"
  },
  {
    "img":
    "assets/img/icons/more.png",
    "title": "More Suggestions?",
    "description":
    "Click on the image or youtube icon",

    "link": "https://www.youtube.com/results?search_query=focus+binaural+beats"
  },
];

class Concentration extends StatefulWidget {
  @override
  _ConcentrationState createState() => _ConcentrationState();
}

class _ConcentrationState extends State<Concentration>{
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
        title: "Concentration",
        bgColor: Colors.transparent,
      ),
      backgroundColor: Colors.blueAccent,
      drawer: MaterialDrawer(currentPage: "Concentration"),
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
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, top: 25, bottom: 32),
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