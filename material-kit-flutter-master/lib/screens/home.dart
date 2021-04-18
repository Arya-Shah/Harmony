import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//widgets
import 'package:material_kit_flutter/widgets/navbar.dart';

import 'package:material_kit_flutter/widgets/drawer.dart';



class Home extends StatelessWidget {
  Color bcolor = Colors.blue[900];
  // final GlobalKey _scaffoldKey = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: Navbar(
          title: "Home",
          bgColor: Colors.transparent,


        ),
        backgroundColor: MaterialColors.bgColorScreen,
        // key: _scaffoldKey,
        drawer: MaterialDrawer(currentPage: "Home"),
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
          padding: EdgeInsets.only(bottom: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.only(top:100,bottom: 70, left: 30, right: 30),
                    child: Text("How are you Feeling today? ", style: TextStyle(fontSize: 30,color: Colors.white,  fontWeight: FontWeight.w900, letterSpacing: 2), textAlign: TextAlign.center,)),
                Padding(
                  padding:  EdgeInsets.only(bottom: 25,),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,

                    children: [

                      RawMaterialButton(

                        onPressed: () {
                          Navigator.pushNamed(context, '/detection');

                        },
                        elevation: 4.0,
                        fillColor: bcolor,
                        splashColor: Colors.deepPurpleAccent[400],

                        child: Icon(FontAwesomeIcons.cameraRetro,color: Colors.blueGrey[200], size: 50),
                        padding: EdgeInsets.all(45.0),
                        shape: CircleBorder(),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 20),
                        child: RawMaterialButton(
                          onPressed: () {

                            Navigator.pushNamed(context, '/depressed');
                          },
                          elevation: 4.0,
                          fillColor: bcolor,
                          splashColor: Colors.deepPurpleAccent[400],
                          child: Image(image: AssetImage("assets/img/icons/depressed2.png")),
                          padding: EdgeInsets.all(40.0),
                          shape: CircleBorder(),
                        ),
                      ),

                    ],

                  ),

                ),
                Padding(
                  padding:  EdgeInsets.only(left: 20,bottom: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 20, right: 30),
                        child: Text("Detect", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight:FontWeight.w900 , letterSpacing: 2), textAlign: TextAlign.center,),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 50, right: 30),
                        child: Text("Depressed", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight:FontWeight.w900 , letterSpacing: 2), textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding:  EdgeInsets.only(top: 20.0, bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(right: 15),
                        child: RawMaterialButton(
                          onPressed: () {

                            Navigator.pushNamed(context, '/Concentration');
                          },
                          elevation: 4.0,
                          fillColor: bcolor,
                          splashColor: Colors.deepPurpleAccent[400],
                          child: Image(image: AssetImage("assets/img/icons/focus.png")),
                          padding: EdgeInsets.all(25.0),
                          shape: CircleBorder(),
                        ),
                      ),
                      RawMaterialButton(
                        onPressed: () {

                          Navigator.pushNamed(context, '/Relaxed');
                        },
                        elevation: 4.0,
                        fillColor: bcolor,
                        splashColor: Colors.deepPurpleAccent[400],
                        child: Image(image: AssetImage("assets/img/icons/man_sofa1.png")),
                        padding: EdgeInsets.all(40.0),
                        shape: CircleBorder(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(left: 15,bottom: 200),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 20, right: 50),
                        child: Text("Focus", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight:FontWeight.w900 , letterSpacing: 2), textAlign: TextAlign.center,),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 50, right: 30),
                        child: Text("Relaxed", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight:FontWeight.w900 , letterSpacing: 2), textAlign: TextAlign.center,),
                      ),
                    ],
                  ),
                ),



              ],
            ),

          ),

        ));
  }
}
