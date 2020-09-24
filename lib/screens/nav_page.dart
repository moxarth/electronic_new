import 'package:electronic_new/constants/constants.dart';
import 'package:electronic_new/models/userModel.dart';
import 'package:electronic_new/widgets/custom_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  @override
  _NavigationPageState createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                top: 35.0, bottom: 10.0, left: 18.0, right: 18.0),
            height: 70.0,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 18.0, right: 5.0),
                  child: Text(
                    "Hello,\n${FirebaseAuth.instance.currentUser.email}",
                    style:
                        TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: CircleAvatar(
                    child: Text(
                        "${FirebaseAuth.instance.currentUser.email[0].toUpperCase()}"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
    );
  }
}
