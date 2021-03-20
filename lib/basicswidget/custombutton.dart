import 'package:cleennews/%20basicswidget/texttitel.dart';
import 'package:cleennews/constant.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final Color color;
  final Color colortext;


  CustomButton({this.text=" ", this.onPressed, this.color= Colors.black, this.colortext= Colors.black});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton.extended(
        label: CustomText(
          text: text,
          color: Colors.white,
          alignment: Alignment.center,
        ),
        onPressed: onPressed,
        backgroundColor: color,
      ),
    );
  }
}
