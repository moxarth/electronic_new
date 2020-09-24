import 'package:electronic_new/models/userModel.dart';
import 'package:electronic_new/screens/home_page.dart';
import 'package:electronic_new/screens/login_page.dart';
import 'package:electronic_new/screens/main_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {

//  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    final _user = Provider.of<UserModel>(context);

    if(_user == null){
      return LoginPage();
    } else {
      return MainScreen();
    }

//    return FutureBuilder<FirebaseApp>(
//      future: _initialization,
//      builder: (context, snapshot) {
//        if(snapshot.hasError){
//          return Scaffold(
//            body: Center(
//              child: Text("${snapshot.error}"),
//            ),
//          );
//        }
//
//        return StreamBuilder(
//          stream: FirebaseAuth.instance.authStateChanges(),
//          builder: (context, authSnapshot) {
//            if(authSnapshot.hasError){
//              return Scaffold(
//                body: Center(
//                  child: Text("${authSnapshot.error}"),
//                ),
//              );
//            }
//
//            if(authSnapshot.connectionState == ConnectionState.active){
//              User _user = authSnapshot.data;
//
//              if(_user == null){
//                return LoginPage();
//              } else {
//                return HomePage();
//              }
//            }
//
//            return Scaffold(
//              body: Center(
//                child: CircularProgressIndicator(),
//              ),
//            );
//          },
//        );
//      },
//    );
  }
}
