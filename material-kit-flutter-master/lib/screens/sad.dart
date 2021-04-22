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
    "assets/img/depressed/t1.png",
    "title": "Theta Binural Beats",
    "description":
    "4 HOURS of ULTRA DEEP RELAXATION. Binaural Beat (432Hz Music) Theta Wave.",
    "price": "View on Youtube",
    "link" : "https://www.youtube.com/watch?v=EKX-j4VWXcE&t=191s"
  },
  {
    "img":
    "assets/img/depressed/t2.png",
    "title": "Healing Music",
    "description":
    "Overcome Depression - Binaural Beats Music to Boost Serotonin, Dopamine and Endorphin, Healing Music",
    "price": "View on Youtube",
    "link": "https://www.youtube.com/watch?v=3pNpHZ1yv3I"

  },
  {
    "img":
    "assets/img/depressed/t3.png",
    "title": "LIVE",
    "description":
    "Calming Music Healing 24/7 💤 | Sleeping Music 528Hz | Positive Energy Cleanse | Sleep Deep Music",
    "price": "\$300",
    "link": "https://www.youtube.com/watch?v=Ih5E-2Kg95U"
  },
  {
    "img":
    "assets/img/depressed/d1.jpg",
    "title": "Brainwave Music",
    "description":
    "Binaural Beats for Depression Healing, Overcome Depression with Brainwave Music",

    "link": "https://www.youtube.com/watch?v=7GSre2_s2uo"
  },
  {
    "img":
    "assets/img/depressed/d2.jpg",
    "title": "Anxiety Relief ",
    "description":
    "Depression Removal | Anxiety Relief | Binaural Beats",

    "link": "https://www.youtube.com/watch?v=o-8vOjYU-W0"
  },
  {
    "img":
    "assets/img/depressed/d3.jpg",
    "title": " Sleep Hypnosis",
    "description":
    "Instant Depression Removal - Anxiety Relief | Sleep Hypnosis Binaural Beats Session",

    "link": "https://www.youtube.com/watch?v=91OKIDf3i48"
  },
  {
    "img":
    "assets/img/depressed/d4.jpg",
    "title": "LOFI HIPHOP ",
    "description":
    "LOFI HIPHOP with Healing Binaural Beats for Depression | BINAURAL BEAT THERAPY",

    "link": "https://www.youtube.com/watch?v=zJPGW1faKPY"
  },
  {
    "img":
    "assets/img/depressed/d5.jpg",
    "title": "Neurosis Relief ",
    "description":
    "15.5 Hz Depression Disorders, Neurosis - Relief ❁ Binaural Beats ☯ PURE BRAINWAVE ENTRAINMENT",

    "link": "https://www.youtube.com/watch?v=RP_GtoywU24"
  },
  {
    "img":
    "assets/img/depressed/d6.jpg",
    "title": "Delta Binaural Beats",
    "description":
    "Anti-Depression - Delta Binaural Beats - Pure 1.5Hz",

    "link": "https://www.youtube.com/watch?v=AKjD6q19R5M"
  },
  {
    "img":
    "assets/img/depressed/d7.jpg",
    "title": "Depression healing ",
    "description":
    "Overcome Depression and Anxiety with Binaural Beats (Powerful)",

    "link": "https://www.youtube.com/watch?v=PwRi49t5TjM"
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