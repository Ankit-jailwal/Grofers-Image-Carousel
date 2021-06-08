import 'package:example/screen/homePage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Grofers Image Carousel',
    home: GrofersCarouselPage(),
  ));
}

class GrofersCarouselPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SplashScreen(
          seconds: 3,
          navigateAfterSeconds: new homePage(),
          title: new Text('Welcome to Grofers',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
          image: new Image.asset('assets/grofersLogo.png'),
          backgroundColor: Color(0xfff27437),
          styleTextUnderTheLoader: new TextStyle(),
          photoSize: 100.0,
          loaderColor: Colors.white
      ),
    );
  }
}
