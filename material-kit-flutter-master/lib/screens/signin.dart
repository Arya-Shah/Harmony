import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//widgets
import 'package:material_kit_flutter/constants/Theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_kit_flutter/widgets/input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_kit_flutter/widgets/navbar.dart';
import 'package:material_kit_flutter/widgets/drawer.dart';

class Signin extends StatefulWidget {
  @override
  _SigninState createState() => _SigninState();
}
class _SigninState extends State<Signin>{

  final _auth = FirebaseAuth.instance;

  bool switchValueOne;
  bool switchValueTwo;

  String email;
  String password;

  void signin(){

  }


  void initState() {
    setState(() {
      switchValueOne = true;
      switchValueTwo = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:BoxDecoration(
            image:DecorationImage(
              image:AssetImage("assets/img/Blue3.jpg"),
              fit: BoxFit.cover,
            /*gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops:[0.7,1.0],
            colors: [Colors.indigoAccent[700], Colors.white]*/
            )
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical:30 ,horizontal: 20),
            child: SafeArea(
              maintainBottomViewPadding: true,
              bottom: true,
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,



              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                padding: EdgeInsets.only(top:100,bottom: 20),
                child: Text("Log in ", style: TextStyle(fontSize: 30,color: Colors.white, fontFamily:'Montserrat', fontWeight: FontWeight.w600, letterSpacing: 2),)),


                Padding(
                  padding: const EdgeInsets.only(top: 20.0, bottom: 16),
                  child:Input(
                    placeholder: "Email Address / Username",
                    outlineBorder: true,
                    focusedBorderColor: Colors.white,
                    enabledBorderColor: Colors.white,
                    textColor: MaterialColors.input,
                    autofocus: false,
                    prefixIcon: Icon(Icons.person,color: Colors.white,),
                    hintTextColor: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0,bottom:16),
                  child:Input(
                    placeholder: "Password",
                    outlineBorder: true,
                    obscureText: true,
                    focusedBorderColor: Colors.white,
                    enabledBorderColor: Colors.white,
                    textColor: MaterialColors.input,
                    hintTextColor: Colors.white,
                    prefixIcon: Icon(Icons.lock_rounded, color: Colors.white,),



                  ),
                ),
                SizedBox(
                  width: 250, height: 100,
                  child: Padding(
                    padding:
                    const EdgeInsets.only(left: 34.0, right: 34.0, top: 50),
                    child: RaisedButton(



                      textColor: Colors.black,
                      color: Colors.white,
                      onPressed: () {
                        // Respond to button press
                        Navigator.pushNamed(context, '/home');
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),

                      ),
                      child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0, right: 16.0, top: 12, bottom: 12),
                          child: Text("Sign in",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 16.0,fontFamily:'Montserrat'))),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top:20 ,bottom:20),
                    child: Text("OR ", style: TextStyle(fontSize: 16,color: Colors.white, fontWeight: FontWeight.w600,fontFamily:'Montserrat', letterSpacing: 2),)),
                Padding(
                  padding: const EdgeInsets.only(bottom:400),
                  child: RawMaterialButton(
                    splashColor:MaterialColors.active ,
                    onPressed: () {},
                    elevation: 4.0,
                    fillColor: MaterialColors.gooogle,
                    child: Icon(FontAwesomeIcons.google,
                        size: 24.0, color: Colors.white),
                    padding: EdgeInsets.all(15),
                    shape: CircleBorder(),

                  ),
                ),





              ],
          ),
            ),
          ),
        ),
      )
    );

  }




}