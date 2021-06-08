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
  Timer timer;
  int _currentImageIndex = 0;
  PageController _controller = PageController();

  @override
  void initState() {
    super.initState();
    if (widget.images != null && widget.images.isNotEmpty) {
      if (widget.autoplay) {
        timer = Timer.periodic(widget.autoplayDuration, (_){
          if (_controller.hasClients) {
            if (_controller.page.round() == widget.images.length - 1) {
              _controller.animateToPage(0,
                duration: widget.animationDuration,
                curve: widget.animationCurve,
              );
            } else {
              _controller.nextPage(
                  duration: widget.animationDuration,
                  curve: widget.animationCurve);
            }
          }
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller = null;
    timer?.cancel();
    timer = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listImages = (widget.images != null && widget.images.isNotEmpty)
        ? widget.images.map<Widget>(
          (networkImage) {
        if (networkImage is ImageProvider) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                image: networkImage,
                fit: BoxFit.cover,
              ),
            ),
          );
        } else if (networkImage is FadeInImage) {
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
                child: networkImage),
          );
        } else {
          return networkImage;
        }
      },
    ).toList()
        : [Container(
        decoration: BoxDecoration(
          borderRadius:BorderRadius.all( Radius.circular(8.0)),
          image: DecorationImage(
            image: widget.defaultImage,
            fit: BoxFit.cover,
          ),
        ),
      )
      ,
    ];
    return
        Container(
          child: Builder(
            builder: (_) {
              Widget pageView = PageView(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _controller,
                children: listImages,
                onPageChanged: (currentPage) {
                  if (widget.onImageChange != null) {
                    widget.onImageChange(_currentImageIndex, currentPage);
                  }
                  _currentImageIndex = currentPage;
                },
              );
              if (widget.onImageTap == null) {
                return pageView;
              }
              return GestureDetector(
                child: pageView,
                  onTap: () => widget.onImageTap(_currentImageIndex),
              );
            },
          ),
        );
  }
}
