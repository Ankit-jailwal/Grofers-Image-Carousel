import 'package:flutter/material.dart';
import 'package:grofers_carousel/service/grofers_carousel_package.dart';
import 'package:toast/toast.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  double padding=0;
  double radius=0;
  bool autoPlay=false;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          backgroundColor: Colors.black,
          title: Text("Grofers Image Carousel",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
        ),
        body: Column(
          children: [
            grofers_carousel(
              carousalPadding: padding,
              carousalHeight: screenSize.height*0.4,
              carousalWidth: screenSize.width,
              carousalRadius: radius,
              autoplay: autoPlay,
              animationCurve: Curves.fastOutSlowIn,
              animationDuration: Duration(seconds: 1),
              autoplayDuration: Duration(seconds: 2),
              onTap: (index){
                //TODO space to implement function
                Toast.show("Clicked on Image ${index+1}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              },
              onChange: (prevIndex,nextIndex){
                //TODO space to implement function
                //Example
                autoPlay?null:Toast.show("Swiped from image ${prevIndex+1} to ${nextIndex+1}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
              },
              images: [
                NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/Homepage_Household-laundry-_8.jpg'),
                NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,h=274/layout-engine/2021-06/SSF_june21_masthead2_0.jpg'),
                NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/HPB-RESIZE-JUNE.jpg'),
              ],
              defaultImage: NetworkImage('http://fpae.pt/backup/20181025/wp/wp-content/plugins/post-slider-carousel/images/no-image-available-grid.jpg'), //This will be used when there is no images in above list
            ),

          ],
        ),
      ),
    );
  }
}
