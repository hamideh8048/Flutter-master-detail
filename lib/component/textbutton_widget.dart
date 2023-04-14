import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TextButtonWidget extends StatefulWidget {
  String txt;
  Color textColor;
  Color backColor;
  Function () onTap;
  TextButtonWidget({Key? key,required this.txt , required  this.textColor
    , required   this.backColor ,required  this.onTap}) : super(key: key);

  @override
  State<TextButtonWidget> createState() => _TextButtonWidgetState();
}

class _TextButtonWidgetState extends State<TextButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: Container(
        decoration: BoxDecoration(

          borderRadius: BorderRadius.circular(50),
          // boxShadow: [
          //   BoxShadow(
          //       color: shadow,
          //       spreadRadius:2,
          //       blurRadius: 3,
          //       offset:
          //       const Offset(0, 1) // changes position of shadow
          //   )
          // ],
        ),
        child: TextButton(
          onPressed: () {
widget.onTap();
          },
          child: Text(
            widget.txt,
            style: TextStyle(
                color:Colors.white,fontSize: 12
            ),
          ),
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: widget.backColor,
          ),
        ),
      ),
    );
  }

}
