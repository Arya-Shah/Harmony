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
    "assets/img/happy/h1.jpg",
    "title": "Serotonin Release Music",
    "description":
    "Happiness Frequency 💚 Serotonin Release Music with Binaural Beats, Relaxing Music for Happiness",
    "price": "View on Youtube",
    "link" : "https://www.youtube.com/watch?v=GbKkMCGLDpw"
  },
  {
    "img":
    "assets/img/happy/h2.jpg",
    "title": "Happiness & Motivation",
    "description":
    "Confidence, Happiness & Motivation - Binaural Beats & Isochronic Tones (Subliminal Messages)",
    "price": "View on Youtube",
    "link": "https://www.youtube.com/watch?v=GXeAOtb1VeA"

  },
  {
    "img":
    "assets/img/happy/h3.jpg",
    "title": "True Inner Peace",
    "description":
    "True Inner Peace - Heal Your Soul - Binaural Beats & Isochronic Tones (With Subliminal Messages)",

    "link": "https://www.youtube.com/watch?v=Kfy-dwPBtKU"
  },
  {
    "img":
    "assets/img/happy/h4.jpg",
    "title": "Remove Mental Blockages",
    "description":
    "Remove Mental Blockages & Subconscious Negativity ☯ Dissolve Negative Patterns ☯ Binaural Beats",

    "link": "https://www.youtube.com/watch?v=IIfw9kAbMlc"
  },
  {
    "img":
    "assets/img/happy/h5.jpg",
    "title": "Alpha Waves for Serotonin",
    "description":
    "Serotonin Release - Alpha Waves for Serotonin & Endorphins - Binaural Beats - Meditation Music",

    "link": "https://www.youtube.com/watch?v=dPqCRyzhXn8"
  },
  {
    "img":
    "assets/img/happy/h6.jpg",
    "title": " Endorphin Release Music",
    "description":
    "Happiness Frequency: Serotonin, Dopamine, Endorphin Release Music, Release Negativityn",

    "link": "https://www.youtube.com/watch?v=8M143iRrbgw"
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

class Happy extends StatefulWidget {
  @override
  _HappyState createState() => _HappyState();
}

class _HappyState extends State<Happy>{

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
        title: "Happy",
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