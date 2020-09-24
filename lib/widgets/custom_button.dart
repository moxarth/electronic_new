import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isOutlineBorder;
  final String btnName;
  final Function onPressed;
  final bool isLoading;

  CustomButton(
      {this.btnName, this.isOutlineBorder, this.onPressed, this.isLoading});

  @override
  Widget build(BuildContext context) {
    bool _isOutlineBorder = isOutlineBorder ?? false;
    bool _isLoading = isLoading ?? false;

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50.0,
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(vertical: 6.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: _isOutlineBorder ? Colors.transparent : Colors.black,
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        child: Stack(
          children: [
            _isLoading
                ? Container(
                    child: CircularProgressIndicator(),
                    height: 30.0,
                    width: 30.0,
                  )
                : Text(
                    btnName ?? "Custom Button",
                    style: TextStyle(
                      color: _isOutlineBorder ? Colors.black : Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
