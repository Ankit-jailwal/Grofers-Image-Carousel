import 'dart:async';
import 'package:flutter/material.dart';

class grofers_carousel extends StatefulWidget {
  final List images;
  final defaultImage;
  final Curve animationCurve;
  final Duration animationDuration;
  final bool autoplay;
  final double carouselHeight;
  final double carouselWidth;
  final double carouselRadius;
  final double carouselPadding;
  final Duration autoplayDuration;
  final void Function(int) onTap;
  final void Function(int, int) onChange;

  final bool enlargeCenterImage; //TODO: This method will enlarge carousel image in focus.
  final bool carousalIndicator; //TODO: This method will provide dot indication of current index of carousel.
  final bool verticalCarousel; //TODO: This method will provide functionality for vertical image carousel.
  final bool infiniteScroll; //TODO: This method will enable seamless scrolling of carousel images with no end point.
  final bool multipleImagesInView; //TODO: This method will be used to display multiple images in view.
  grofers_carousel({
    this.images,
    this.animationCurve = Curves.ease,
    this.animationDuration = const Duration(milliseconds: 300),
    this.autoplay=false,
    this.carouselRadius=0,
    this.carouselPadding=0,
    this.carouselWidth = 300,
    this.carouselHeight = 200,
    this.autoplayDuration = const Duration(seconds: 2),
    this.onTap,
    this.defaultImage,
    this.onChange,

    //TODO methods
    this.enlargeCenterImage,
    this.carousalIndicator,
    this.verticalCarousel,
    this.infiniteScroll,
    this.multipleImagesInView,
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
          return Padding(
            padding: EdgeInsets.all(widget.carouselPadding),
            child: FractionallySizedBox(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(widget.carouselRadius)),
                  image: DecorationImage(
                    image: networkImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          );
        } else if (networkImage is FadeInImage) {
          return ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(widget.carouselRadius)),
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
          borderRadius:BorderRadius.all( Radius.circular(widget.carouselRadius)),
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
          height: widget.carouselHeight,
          width: widget.carouselWidth,
          child: Builder(
            builder: (_) {
              Widget pageView = PageView(
                physics: AlwaysScrollableScrollPhysics(),
                controller: _controller,
                children: listImages,
                onPageChanged: (currentPage) {
                  if (widget.onChange != null) {
                    widget.onChange(_currentImageIndex, currentPage);
                  }
                  _currentImageIndex = currentPage;
                },
              );
              if (widget.onTap == null) {
                return pageView;
              }
              return GestureDetector(
                child: pageView,
                  onTap: () => widget.onTap(_currentImageIndex),
              );
            },
          ),
        );
  }
}


