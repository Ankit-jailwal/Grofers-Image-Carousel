# GROFERS IMAGE CAROUSEL

A Flutter package to implement image carousel.

[![Click here to view package demo](https://static.wikia.nocookie.net/logopedia/images/b/be/Grofers-logo-png-1.png)](https://youtu.be/5OEMfwd_crQ)

### Click on Grofers logo to view package demo.

## Features

* Auto play (boolean)
* Auto play duration (int)
* Carousel Radius (double)
* Carousel Padding (double)
* Carousel Height (double)
* Carousel width (double)
* Animation Curve (Curve)
* Animation Duration (int)

## Supported platforms

* Flutter Android
* Flutter iOS
* Flutter web
* Flutter desktop

## Installation

Add 
```dart
grofers_carousel:
    path: [path of grofers_carousel package]
```
to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:grofers_carousel/grofers_carousel.dart';
```

## How to use

Simply create a `grofers_carousel` widget, and pass the required params.


## Example
```dart
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
```
## Other Features that can be implemented

* Enlarge central image
* Image position indicator
* Vertical carousal
* Infinite Scroll in carousal
* Multiple images in view

## Screenshot

![alt text](https://github.com/Ankit-jailwal/Grofers-Image-Carousel/blob/master/example/assets/WhatsApp%20Image%202021-06-09%20at%204.29.11%20AM%20(1).jpeg)
