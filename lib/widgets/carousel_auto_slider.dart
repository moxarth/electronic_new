import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselAutoSlider extends StatefulWidget {
  final double height;
  final bool enlargeCenterPage, autoPlay;
  final Function(int) onPageChanged;
  final Function onProductClicked;
  final List productList;
  final EdgeInsets margin;

  CarouselAutoSlider({@required this.height,
    this.enlargeCenterPage,
    this.autoPlay,
    this.onPageChanged,
    @required this.margin,
    @required this.productList,
    this.onProductClicked
  });

  @override
  _CarouselAutoSliderState createState() => _CarouselAutoSliderState();
}

class _CarouselAutoSliderState extends State<CarouselAutoSlider> {
  @override
  Widget build(BuildContext context) {
    bool _enlargeCenterPage = widget.enlargeCenterPage ?? false;
    bool _autoPlay = widget.autoPlay ?? false;

    return Container(
      margin: widget.margin,
      child: CarouselSlider(
        options: CarouselOptions(
            height: widget.height,
            enlargeCenterPage: _enlargeCenterPage,
            autoPlay: _autoPlay,
            autoPlayInterval: Duration(seconds: 5),
            autoPlayAnimationDuration: Duration(milliseconds: 1000),
            autoPlayCurve: Curves.easeInOut,
            onPageChanged: (index, reason) {
              widget.onPageChanged(index);
            }
        ),
        items: widget.productList.map((product) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: widget.onProductClicked,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: product,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
