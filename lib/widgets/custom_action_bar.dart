import 'package:electronic_new/constants/constants.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomActionBar extends StatelessWidget {
  final String title;
  final bool hasTitle, hasNavBtn;
  final Function onNavigationPressed, onCartPressed;
  final Icon icon;

  CustomActionBar({this.title, this.hasTitle, this.hasNavBtn, this.onCartPressed, this.onNavigationPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    bool _hasTitle = hasTitle ?? true;
    bool _hasNavBtn = hasNavBtn ?? false;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white
      ),
      padding:
          EdgeInsets.only(top: 45.0, left: 24.0, right: 24.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasNavBtn)
            GestureDetector(
              onTap: onNavigationPressed,
              child: Container(
                width: 45.0,
                height: 45.0,
                alignment: Alignment.center,
                child: icon,
                decoration: BoxDecoration(
                  color: Color(0xFFEAEAEA),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          if (_hasTitle)
            Text(
              title ?? "Action Bar",
              style: Constants.boldHeading,
            ),
          GestureDetector(
            onTap: onCartPressed,
            child: Container(
              width: 45.0,
              height: 45.0,
              alignment: Alignment.center,
              child: Icon(
                EvaIcons.shoppingBagOutline
              ),
              decoration: BoxDecoration(
                color: Color(0xFFEAEAEA),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          )
        ],
      ),
    );
  }
}
