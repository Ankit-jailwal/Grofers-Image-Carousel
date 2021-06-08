import 'package:flutter/material.dart';
import 'package:grofers_carousel/service/grofers_carousel_package.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: grofers_carousel(
          carousalPadding: 5,
          carousalHeight: screenSize.height*0.4,
          carousalWidth: screenSize.width,
          carousalRadius: 80,
          autoplay: false,
          animationCurve: Curves.fastOutSlowIn,
          animationDuration: Duration(seconds: 1),
          autoplayDuration: Duration(seconds: 2),
          onTap: (index){
            //TODO space to implement any function
          },
          onChange: (prevIndex,nextIndex){
            //TODO space to implement any function
          },
          images: [
            NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/Homepage_Household-laundry-_8.jpg'),
            NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,h=274/layout-engine/2021-06/SSF_june21_masthead2_0.jpg'),
            NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/HPB-RESIZE-JUNE.jpg'),
          ],
          defaultImage: NetworkImage('http://fpae.pt/backup/20181025/wp/wp-content/plugins/post-slider-carousel/images/no-image-available-grid.jpg'), //This will be used when there is no images in above list
        ),
      ),
    );
  }
}
