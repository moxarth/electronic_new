import 'package:electronic_new/landing_page.dart';
import 'package:electronic_new/models/userModel.dart';
import 'package:electronic_new/screens/home_page.dart';
import 'package:electronic_new/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserModel>.value(
      value: AuthService().userStream,
      child: MaterialApp(
        home: LandingPage(),
        title: 'ElectroApp',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
