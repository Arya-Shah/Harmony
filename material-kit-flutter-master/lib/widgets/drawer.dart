import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

import 'package:material_kit_flutter/constants/Theme.dart';

import 'package:material_kit_flutter/widgets/drawer-tile.dart';

class MaterialDrawer extends StatelessWidget {
  final String currentPage;

  MaterialDrawer({this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
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
          child: Column(children: [
            /*DrawerHeader(
              decoration: BoxDecoration(color: MaterialColors.info),
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://image.shutterstock.com/image-vector/default-avatar-profile-icon-vector-260nw-1745180411.jpg"),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0, top: 16.0),
                  child: Text("Person Name",
                      style: TextStyle(color: Colors.white, fontSize: 21)),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: MaterialColors.socialFacebook),
                            child: Text("Logged in",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16))),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 16.0),
                        child: Text(" :)",
                            style: TextStyle(
                                color: MaterialColors.muted, fontSize: 16)),
                      ),

                    ],
                  ),
                )
              ],
            ))),*/
            Expanded(
              child: ListView(
              padding: EdgeInsets.only(top: 50, left: 8, right: 8),
              children: [
                DrawerTile(
                icon: Icons.home,
                onTap: () {
                  if (currentPage != "Home")
                    Navigator.pushReplacementNamed(context, '/home');
                },
                iconColor: Colors.white,
                title: "Home",
                isSelected: currentPage == "Home" ? true : false),


                /*DrawerTile(
                icon: Icons.settings_input_component,
                onTap: () {
                  if (currentPage != "Components")
                    Navigator.pushReplacementNamed(context, '/components');
                },
                iconColor: Colors.black,
                title: "Components",
                isSelected: currentPage == "Components" ? true : false),
                DrawerTile(
                icon: Icons.account_circle,
                onTap: () {
                  if (currentPage != "Profile")
                    Navigator.pushReplacementNamed(context, '/profile');
                },
                iconColor: Colors.black,
                title: "User",
                isSelected: currentPage == "Profile" ? true : false),*/

                /*DrawerTile(
                icon: Icons.open_in_browser,
                onTap: () {
                  if (currentPage != "Sign Up")
                    Navigator.pushReplacementNamed(context, '/signup');
                },
                iconColor: Colors.black,
                title: "Sign Up",
                isSelected: currentPage == "Sign Up" ? true : false),*/

                DrawerTile(
                    icon: Icons.arrow_forward_sharp,
                    onTap: () {
                      if (currentPage != "Depressed")
                        Navigator.pushReplacementNamed(context, '/depressed');
                    },
                    iconColor: Colors.white,
                    title: "Depressed",
                    isSelected: currentPage == "Depressed" ? true : false),
                DrawerTile(
                    icon: Icons.arrow_forward_sharp,
                    onTap: () {
                      if (currentPage != "Relaxed")
                        Navigator.pushReplacementNamed(context, '/Relaxed');
                    },
                    iconColor: Colors.white,
                    title: "Relaxed",
                    isSelected: currentPage == "Relaxed" ? true : false),
                DrawerTile(
                    icon: Icons.arrow_forward_sharp,
                    onTap: () {
                      if (currentPage != "Concentration")
                        Navigator.pushReplacementNamed(context, '/Concentration');
                    },
                    iconColor: Colors.white,
                    title: "Concentration",
                    isSelected: currentPage == "Concentration" ? true : false),
                DrawerTile(
                    icon: Icons.exit_to_app,
                    onTap: () {
                      if (currentPage != "Sign In")
                        Navigator.pushReplacementNamed(context, '/signin');
                    },
                    iconColor: Colors.white,
                    title: "Sign Out",
                    isSelected: currentPage == "Sign In" ? true : false),
          ],
        ))
      ])),
    );
  }
}
