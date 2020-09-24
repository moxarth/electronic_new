import 'package:electronic_new/services/auth.dart';
import 'package:electronic_new/widgets/carousel_auto_slider.dart';
import 'package:electronic_new/widgets/custom_action_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double xOffset = 0, yOffset = 0, scaleType = 1;
  bool isDrawerOpen = false;
  int _productIndex = 0;
  List _colors = [
    Colors.blueAccent,
    Colors.redAccent,
    Colors.purple,
    Colors.amber,
    Colors.cyan
  ];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(scaleType),
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 110.0),
            child: Column(
              children: [
                CarouselAutoSlider(
                  margin: EdgeInsets.symmetric(
                    vertical: 8.0,
                  ),
                  height: 200.0,
                  productList: _colors,
                  autoPlay: true,
                  enlargeCenterPage: false,
                  onPageChanged: (index) {
//              Fluttertoast.showToast(msg: "$index");
                    setState(() {
                      _productIndex = index;
                    });
                  },
                  onProductClicked: () {
                    Fluttertoast.showToast(msg: "$_productIndex");
                  },
                ),
                GridView.count(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: _colors.map((color) {
                    return Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    );
                  }).toList(),
                ),
                RaisedButton(
                  child: Text("Log out"),
                  onPressed: () {
                    AuthService().signOut();
                  },
                )
              ],
            ),
          ),
          CustomActionBar(
            hasNavBtn: true,
            icon: isDrawerOpen
                ? Icon(EvaIcons.arrowIosBack)
                : Icon(EvaIcons.menu2Outline),
            onNavigationPressed: () {
              isDrawerOpen
                  ? setState(() {
                      xOffset = 0.0;
                      yOffset = 0.0;
                      scaleType = 1;
                      isDrawerOpen = false;
                    })
                  : setState(() {
                      xOffset = 225.0;
                      yOffset = 120.0;
                      scaleType = 0.7;
                      isDrawerOpen = true;
                    });
            },
            onCartPressed: () {
              Fluttertoast.showToast(msg: "CART");
            },
          ),
        ],
      ),
    );
  }
}
