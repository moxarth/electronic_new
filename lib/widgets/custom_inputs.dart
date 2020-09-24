import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {
  final String hintText;
  final bool obscuredText;
  final FocusNode focusNode;
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final TextInputAction textInputAction;

  CustomInput({this.hintText, this.focusNode, this.onChanged, this.onSubmitted, this.textInputAction, this.obscuredText});

  @override
  Widget build(BuildContext context) {
    bool _obscuredText = obscuredText ?? false;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Color(0x4FC2C2C2),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        ),
        obscureText: _obscuredText,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        focusNode: focusNode,
        textInputAction: textInputAction,
      ),
    );
  }
}
