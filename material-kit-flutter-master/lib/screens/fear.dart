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
    "assets/img/fear/f1.jpg",
    "title": "let go of Worries",
    "description":
    "852 Hz - LET GO of Fear, Overthinking & Worries | Cleanse Destructive Energy | Awakening Intuition",
    "price": "View on Youtube",
    "link" : "https://www.youtube.com/watch?v=-vvpsIiUVKY"
  },
  {
    "img":
    "assets/img/fear/f2.jpg",
    "title": "BECOME FEARLESS",
    "description":
    "SOLFEGGIO 396 Hz ⧊ BECOME FEARLESS ⧊ POWERFUL Sleep Meditation Music | Solfeggio Frequencies",
    "price": "View on Youtube",
    "link": "https://www.youtube.com/watch?v=ZeBHeD7gTzI"

  },
  {
    "img":
    "assets/img/fear/f3.jpg",
    "title": "432Hz Deep Relaxation",
    "description":
    "DEEP Theta Binaural Beats ➤ LET GO of Fear, Overthinking & Worries ➤ 432Hz Deep Relaxation",

    "link": "https://www.youtube.com/watch?v=Mgwd_3k3pOw"
  },
  {
    "img":
    "assets/img/fear/f4.jpg",
    "title": "Destroy Unconscious Blockage",
    "description":
    "432 Hz Destroy Unconscious Blockages & Fear, Binaural Beats",

    "link": "https://www.youtube.com/watch?v=3hxvULliUa0"
  },
  {
    "img":
    "assets/img/fear/f5.jpg",
    "title": "Sound Therapy",
    "description":
    "Release Fear,Anxiety And Stress Subliminal - Sound Therapy with Binaural Beats",

    "link": "https://www.youtube.com/watch?v=HrB8DXFAt74"
  },
  {
    "img":
    "assets/img/fear/f6.jpg",
    "title": " Release Subconscious Fear",
    "description":
    "Release Subconscious Fear & Trapped Negative Energy ➤ DEEP Theta BinauralBeat.",

    "link": "https://www.youtube.com/watch?v=3iFN52ok6bs"
  },
  {
    "img":
    "assets/img/fear/f7.jpg",
    "title": "Overcome Phobia & Anxiety: ",
    "description":
    "Overcome Phobia & Anxiety: Cleanse Destructive Energy, Release Fear Binaural Beats | Mood Elevator",

    "link": "https://www.youtube.com/watch?v=Np1SebasvPg"
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

class Fear extends StatefulWidget {
  @override
  _FearState createState() => _FearState();
}

class _FearState extends State<Fear>{

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
        title: "Fear",
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