import 'package:flutter/material.dart';
// screens
import 'package:material_kit_flutter/screens/Concentration.dart';
import 'package:material_kit_flutter/screens/Relaxed.dart';
import 'package:material_kit_flutter/screens/angry.dart';
import 'package:material_kit_flutter/screens/depressed.dart';
import 'package:material_kit_flutter/screens/fear.dart';
import 'package:material_kit_flutter/screens/happy.dart';
import 'package:material_kit_flutter/screens/home.dart';
import 'package:material_kit_flutter/screens/profile.dart';
import 'package:material_kit_flutter/screens/sad.dart';
import 'package:material_kit_flutter/screens/settings.dart';
import 'package:material_kit_flutter/screens/components.dart';
import 'package:material_kit_flutter/screens/onboarding.dart';
import 'package:material_kit_flutter/screens/pro.dart';
import 'package:material_kit_flutter/screens/signin.dart';
import 'package:material_kit_flutter/screens/detection.dart';

void main() => runApp(MaterialKitPROFlutter());

class MaterialKitPROFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Harmony",
        theme: ThemeData(fontFamily: 'Montserrat'),
        debugShowCheckedModeBanner: false,
        initialRoute: "/signin",
        routes: {

          "/pro": ( context) =>  new Pro(),
          "/home": ( context) =>  new Home(),
          "/components": ( context) =>  new Components(),
          "/profile": ( context) =>  new Profile(),
          "/settings": ( context) =>  new Settings(),
          "/signin": ( context) =>  new Signin(),
          "/depressed":( context) =>  new Depressed(),
          "/Concentration":( context) =>  new Concentration(),
          "/Relaxed":( context) =>  new Relaxed(),
          "/detection":( context) =>  new detection(),
          "/happy":(context) => new Happy(),
          "/sad":(context) => new Sad(),
          "/fear":(context) => new Fear(),
          "/angry":(context) => new Angry(),
    });

  }
}
