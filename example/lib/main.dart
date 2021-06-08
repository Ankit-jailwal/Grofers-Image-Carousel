import 'package:flutter/material.dart';
import 'package:grofers_carousel/grofers_carousel.dart';

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
    return Scaffold(
      body: Center(
        child: grofers_carousel(
          carousalPadding: 4,
          autoplay: true,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(milliseconds: 1000),
          images: [
            NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/Homepage_Household-laundry-_8.jpg'),
            NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,h=274/layout-engine/2021-06/SSF_june21_masthead2_0.jpg'),
            NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/HPB-RESIZE-JUNE.jpg'),
          ],
        ),
      ),
    );
  }
}