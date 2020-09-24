import 'package:electronic_new/constants/constants.dart';
import 'package:electronic_new/models/userModel.dart';
import 'package:electronic_new/screens/register_page.dart';
import 'package:electronic_new/services/auth.dart';
import 'package:electronic_new/widgets/custom_action_bar.dart';
import 'package:electronic_new/widgets/custom_button.dart';
import 'package:electronic_new/widgets/custom_inputs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email = '', password = '';
  bool isLoading;
  FocusNode _passwordFocusNode;
  AuthService _auth = AuthService();

  @override
  void initState() {
    _passwordFocusNode = FocusNode();
    isLoading = false;
    super.initState();
  }

  @override
  void dispose() {
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(top: 45.0),
            child: Text(
              "Welcome User, \n Login To Your Account",
              style: Constants.boldHeading,
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            children: [
              CustomInput(
                hintText: 'Email',
                textInputAction: TextInputAction.next,
                onChanged: (val) {
                  email = val;
                },
                onSubmitted: (val) {
                  _passwordFocusNode.requestFocus();
                },
              ),
              CustomInput(
                hintText: 'Password',
                obscuredText: true,
                onChanged: (val) {
                  password = val;
                },
                focusNode: _passwordFocusNode,
              ),
              CustomButton(
                btnName: 'Login',
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  dynamic user =
                      await _auth.signInWithEmailAndPass(email, password);
                  if (user == null) {
                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    print('Email:' + user.emailId);
                  }
                },
                isOutlineBorder: false,
                isLoading: isLoading,
              ),
              GestureDetector(
                onTap: () async {
                  UserModel user = await _auth.signInWithGoogle();
//                  if (user != null) {
//                    print(user.emailId);
//                  }
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12.0),
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                    margin:
                        EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
                    padding: EdgeInsets.symmetric(
                      vertical: 8.0,
                    ),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Image.asset(
                            "assets/images/google.png",
                            height: 32.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "sign in with google",
                            style: Constants.regularHeading
                                .copyWith(fontSize: 20.0),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CustomButton(
              btnName: 'Create New Account',
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterPage()));
              },
              isOutlineBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}
