import 'package:flutter/material.dart';
import 'package:grofers_carousel/service/grofers_carousel_package.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toast/toast.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  double _padding=2;
  double _radius=8;
  double _height=200;
  double _width=400;
  bool _autoPlay=false;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              grofers_carousel(
                carousalPadding: _padding,
                carousalHeight: _height,
                carousalWidth: _width,
                carousalRadius: _radius,
                autoplay: _autoPlay,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(seconds: 1),
                autoplayDuration: Duration(seconds: 2),
                onTap: (index){
                  //TODO space to implement function
                  //Example
                  Toast.show("Clicked on Image ${index+1}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                },
                onChange: (prevIndex,nextIndex){
                  //TODO space to implement function
                  //Example
                  _autoPlay?null:Toast.show("Swiped from image ${prevIndex+1} to ${nextIndex+1}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.BOTTOM);
                },
                images: [
                  NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/Homepage_Household-laundry-_8.jpg'),
                  NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,h=274/layout-engine/2021-06/SSF_june21_masthead2_0.jpg'),
                  NetworkImage('https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/HPB-RESIZE-JUNE.jpg'),
                ],
                defaultImage: NetworkImage('http://fpae.pt/backup/20181025/wp/wp-content/plugins/post-slider-carousel/images/no-image-available-grid.jpg'), //This will be used when there is no images in above list
              ),
            Column(
            children: [

            SfSlider(
              min: 0.0,
              max: 50.0,
              value: _padding,
              interval: 5,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value){
                setState(() {
                  _padding = value;
                });
              },
            ),
            SfSlider(
              min: 0.0,
              max: 50.0,
              value: _radius,
              interval: 5,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value){
                setState(() {
                  _radius = value;
                });
              },
            ),
            SfSlider(
              min: 50.0,
              max: screenSize.width,
              value: _width,
              interval: 50,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value){
                setState(() {
                  _width = value;
                });
              },
            ),
            SfSlider(
              min: 50.0,
              max: screenSize.height*0.5,
              value: _height,
              interval: 100,
              showTicks: true,
              showLabels: true,
              enableTooltip: true,
              minorTicksPerInterval: 1,
              onChanged: (dynamic value){
                setState(() {
                  _height = value;
                });
              },
            ),
          ],)
            ],
          ),
        ),
      ),
    );
  }
}
