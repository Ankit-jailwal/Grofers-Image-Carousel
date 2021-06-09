import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:grofers_carousel/grofers_carousel.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:toast/toast.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  double _padding = 2;
  double _radius = 8;
  double _height = 200;
  double _width = 400;
  bool _autoPlay = true;
  int _autoPlayDuration=2;
  int _animationDuration=1;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: (){
                Toast.show(
                    "Welcome to Grofers image carousel",
                    context,
                    duration: Toast.LENGTH_SHORT,
                    gravity: Toast.BOTTOM);
              },
              icon: Image.asset("assets/grofersLogo.png",height: 30,)),
          backgroundColor: Colors.black,
          title: Text(
            "Grofers Image Carousel",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              grofers_carousel(
                carouselPadding: _padding,
                carouselHeight: _height,
                carouselWidth: _width,
                carouselRadius: _radius,
                autoplay: _autoPlay,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(seconds: _animationDuration),
                autoplayDuration: Duration(seconds: _autoPlayDuration),
                onTap: (index) {
                  //TODO space to implement function
                  //Example
                  Toast.show("Clicked on Image ${index + 1}", context,
                      duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
                },
                onChange: (prevIndex, nextIndex) {
                  //TODO space to implement function
                  //Example
                  _autoPlay
                      ? null
                      : Toast.show(
                          "Swiped from image ${prevIndex + 1} to ${nextIndex + 1}",
                          context,
                          duration: Toast.LENGTH_SHORT,
                          gravity: Toast.BOTTOM);
                },
                images: [
                  NetworkImage(
                      'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/Homepage_Household-laundry-_8.jpg'),
                  NetworkImage(
                      'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,h=274/layout-engine/2021-06/SSF_june21_masthead2_0.jpg'),
                  NetworkImage(
                      'https://cdn.grofers.com/cdn-cgi/image/f=auto,fit=scale-down,q=50,w=954,h=477/layout-engine/2021-06/HPB-RESIZE-JUNE.jpg'),
                ],
                defaultImage: NetworkImage(
                    'http://fpae.pt/backup/20181025/wp/wp-content/plugins/post-slider-carousel/images/no-image-available-grid.jpg'), //This will be used when there is no images in above list
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
                    onChanged: (dynamic value) {
                      setState(() {
                        _padding = value;
                      });
                    },
                  ),
                  SfSlider(
                    min: 0.0,
                    max: 100.0,
                    value: _radius,
                    interval: 10,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) {
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
                    onChanged: (dynamic value) {
                      setState(() {
                        _width = value;
                      });
                    },
                  ),
                  SfSlider(
                    min: 50.0,
                    max: screenSize.height * 0.5,
                    value: _height,
                    interval: 100,
                    showTicks: true,
                    showLabels: true,
                    enableTooltip: true,
                    minorTicksPerInterval: 1,
                    onChanged: (dynamic value) {
                      setState(() {
                        _height = value;
                      });
                    },
                  ),
                  SizedBox(height:15,),
                  Container(
                    width: screenSize.width*0.91,
                    height: screenSize.height*0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow:[BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 5.0,
                        offset: Offset(0, 3),
                      )]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FlutterSwitch(
                            width: screenSize.width*0.14,
                            height: screenSize.height*0.05,
                            toggleSize: screenSize.height*0.03,
                            value: _autoPlay,
                            borderRadius: 30.0,
                            padding: 6.0,
                            onToggle: (val) {
                              Toast.show(
                                  "Autoplay is turned ${val?"ON":"OFF"}",
                                  context,
                                  duration: Toast.LENGTH_LONG,
                                  gravity: Toast.BOTTOM);
                              setState(() {
                                _autoPlay = val;
                                _autoPlayDuration=2;
                                _animationDuration=val?1:0;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:8.0,bottom: 8.0,right: 20),
                          child: Text("AUTOPLAY",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
