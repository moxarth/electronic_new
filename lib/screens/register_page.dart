import 'package:electronic_new/constants/constants.dart';
import 'package:electronic_new/screens/login_page.dart';
import 'package:electronic_new/services/auth.dart';
import 'package:electronic_new/widgets/custom_action_bar.dart';
import 'package:electronic_new/widgets/custom_button.dart';
import 'package:electronic_new/widgets/custom_inputs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String email = '',
      password = '';
  FocusNode _passwordFocusNode;
  AuthService _auth = AuthService();
  bool isLoading;

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
            padding: EdgeInsets.only(
                top: 45.0
            ),
            child: Text(
              "Create New Account",
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
                btnName: 'Register',
                onPressed: () async {
                  setState(() {
                    isLoading = true;
                  });
                  dynamic result = await _auth.createUserWithEmailAndPass(
                      email, password);
                  if(result == null){
                    setState(() {
                      isLoading = false;
                    });
                  } else {
                    Navigator.pop(context);
                  }
                },
                isOutlineBorder: false,
                isLoading: isLoading,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: CustomButton(
              btnName: 'Back To Login',
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LoginPage()
                    )
                );
              },
              isOutlineBorder: true,
            ),
          ),
        ],
      ),
    );
  }
}

