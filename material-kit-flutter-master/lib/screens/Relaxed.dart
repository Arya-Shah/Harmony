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
    "assets/img/relax/r1.jpg",
    "title": "Stress Relief Music",
    "description":
    "RELAXING : GENTLE VIBRATIONS - Feel Calm and Centered with Binaural Beats",

    "link": "https://www.youtube.com/watch?v=7GSre2_s2uo"
  },
  {
    "img":
    "assets/img/relax/r2.jpg",
    "title": "Happiness ",
    "description":
    "Happiness Frequency: Serotonin, Dopamine, Endorphin Release Music, Binaural Beats Meditation Music",

    "link": "https://www.youtube.com/watch?v=LFGsZ6ythQQ"
  },
  {
    "img":
    "assets/img/relax/r3.jpg",
    "title": "Theta Waves (15 min)",
    "description":
    "Relaxing Theta Waves (15 min) - Binaural Beats - Slow Down Your Brainwaves",

    "link": "https://www.youtube.com/watch?v=dxGU80Ny0JQ"
  },
  {
    "img":
    "assets/img/relax/r4.jpg",
    "title": "Isochronic Tones",
    "description":
    "Relaxation - Feel Your Inner Peace - Binaural Beats & Isochronic Tones (With Subliminal Messages)",

    "link": "https://www.youtube.com/watch?v=l-iqK69JULo"
  },
  {
    "img":
    "assets/img/relax/r5.jpg",
    "title": "3.2Hz Delta Brain Waves",
    "description":
    "The DEEPEST Healing Sleep | 3.2Hz Delta Brain Waves | REM Sleep Music - Binaural Beats",

    "link": "https://www.youtube.com/watch?v=xsfyb1pStdw"
  },
  {
    "img":
    "assets/img/relax/r6.jpg",
    "title": "INSOMNIA RELIEF",
    "description":
    "INSOMNIA RELIEF [Fall Asleep Fast] 'The Blue Forest' Binaural Beats Sleep Music",

    "link": "https://www.youtube.com/watch?v=FIMdEPd98xs"
  },
  {
    "img":
    "assets/img/relax/r7.jpg",
    "title": "lofi beats",
    "description":
    "code-fi / lofi beats to code/relax to",

    "link": "https://www.youtube.com/watch?v=f02mOEt11OQ"
  },
  {
    "img":
    "assets/img/icons/more.png",
    "title": "More Suggestions?",
    "description":
    "Click on the image or youtube icon",

    "link": "https://www.youtube.com/results?search_query=relaxed+binaural+beats"
  },
];

class Relaxed extends StatefulWidget {
  @override
  _RelaxedState createState() => _RelaxedState();
}

class _RelaxedState extends State<Relaxed>{
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
        title: "Relaxed",
        bgColor: Colors.transparent,
      ),
      //backgroundColor: Colors.indigoAccent[700],
      drawer: MaterialDrawer(currentPage: "Relaxed"),
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
                ),



              ],
            ),
          )

      ),


    );
  }

}