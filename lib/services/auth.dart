import 'package:electronic_new/models/userModel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

class AuthService{
  FirebaseAuth _auth = FirebaseAuth.instance;

  // get UserModel Object from FirebaseUser
  UserModel _userFromFirebaseUser(User user){
    return user != null ? UserModel(uid: user.uid, emailId: user.email) : null;
  }

  // get streams of FirebaseAuth
  Stream<UserModel> get userStream{
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  //sign in anon
  Future signInAnon(){
    return _auth.signInAnonymously();
  }

  //sign in using email and pass
  Future signInWithEmailAndPass(String email, String pass) async {
    UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: pass);
    User user = credential.user;
    return _userFromFirebaseUser(user);
  }

  //register with email and pass
  Future createUserWithEmailAndPass(String email, String pass) async {
    UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    User user = credential.user;
    return _userFromFirebaseUser(user);
  }

  //sign in using google auth
  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    // Create a new credential
    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Once signed in, return the UserCredential
    UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
    User user = userCredential.user;
    return _userFromFirebaseUser(user);
  }

  //sign out
  Future signOut(){
    return _auth.signOut();
  }
}