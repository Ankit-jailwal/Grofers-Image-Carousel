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

  grofers_carousel({
    this.images,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.autoplay = true,
    this.autoplayDuration = const Duration(seconds: 2),
    this.onImageTap,
    this.defaultImage,
  });
  @override
  _grofers_carouselState createState() => _grofers_carouselState();
}

class _grofers_carouselState extends State<grofers_carousel> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
