import 'package:electronic_new/screens/nav_page.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NavigationPage(),
          HomePage(),
        ],
      ),
    );
  }
}
