import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

class grofers_carousel extends StatefulWidget {
  final List images;
  final defaultImage;
  final Curve animationCurve;
  final Duration animationDuration;
  final bool autoplay;
  final Duration autoplayDuration;
  final void Function(int) onImageTap;
  final void Function(int, int) onImageChange;

  grofers_carousel({
    this.images,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.autoplay = true,
    this.autoplayDuration = const Duration(seconds: 2),
    this.onImageTap,
    this.defaultImage,
    this.onImageChange,
  });
  @override
  _grofers_carouselState createState() => _grofers_carouselState();
}

class _grofers_carouselState extends State<grofers_carousel> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> listImages = (widget.images != null && widget.images.isNotEmpty)
        ? widget.images.map<Widget>(
          (netImage) {
        if (netImage is ImageProvider) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                image: netImage,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else if (netImage is FadeInImage) {
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8.0)),
            child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                    stops: [0.0, 0.5],
                    colors: [Colors.grey[800].withOpacity(1.0),
                             Colors.grey[800].withOpacity(0.0)
                    ],
                  ),
                ),
                child: netImage),
          );
        } else {
          return netImage;
        }
      },
    ).toList()
        : [Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.all( Radius.circular(8.0)),
          image: DecorationImage(
            //colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: widget.defaultImage,
            fit: BoxFit.cover,
          ),
        ),
      )
      ,
    ];
    return
        Container(

        );
  }
}
