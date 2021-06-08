import 'package:example/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:grofers_carousel/grofers_carousel.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: true,
    title: 'Grofers Image Carousel',
    home: GrofersCarouselPage(),
  ));
}

class GrofersCarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 3,
        navigateAfterSeconds: new homePage(),
        title: new Text('Welcome In Grofers',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
        image: new Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/2/22/Grofers_Logo.png/1200px-Grofers_Logo.png'),
        backgroundColor: Color(0xfff25c2a),
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.white
    );
  }
}
