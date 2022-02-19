import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:material_kit_flutter/constants/Theme.dart';

class ProductCarousel extends StatefulWidget {
  final List<Map<String, String>> imgArray;

  const ProductCarousel({
    Key key,
    @required this.imgArray,
  }) : super(key: key);

  @override
  _ProductCarouselState createState() => _ProductCarouselState();
}

class _ProductCarouselState extends State<ProductCarousel> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.imgArray
          .map((item) => Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () => launch(item["link"]),
                        child: Container(
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.4),
                                blurRadius: 8,
                                spreadRadius: 0.3,
                                offset: Offset(0, 3))
                          ]),
                          child: AspectRatio(
                            aspectRatio: 2 / 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset(
                                item["img"],
                                fit: BoxFit.cover,
                                alignment: Alignment.topCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(child: Icon(FontAwesomeIcons.youtube, color: MaterialColors.youtube,size: 19), onTap: () => launch(item["link"]),),
                              Padding(
                                padding:  EdgeInsets.only(left: 8.0),
                                child: InkWell(
                                  child: Text("Youtube",

                                    style: TextStyle(
                                        fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),),
                                  onTap: () => launch(item["link"]),),
                              ),
                            ]
                          ),


                          Text(item["title"],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 32, color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, right: 16.0, top: 10),
                            child: Text(
                              item["description"],
                              style: TextStyle(
                                  fontSize: 16, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ))
          .toList(),
      options: CarouselOptions(
          height: 530,
          autoPlay: false,
          enlargeCenterPage: false,
          aspectRatio: 4 / 4,
          enableInfiniteScroll: false,
          initialPage: 0,
          // viewportFraction: 1.0,
          onPageChanged: (index, reason) {
            setState(() {
              _current = index;
            });
          }),
    );
  }
}
