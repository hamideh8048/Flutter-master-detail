
import 'package:flutter/material.dart';

import '../colors.dart';
import '../size.dart';
import '../text.dart';
import '../text_theme.dart';

class Button extends StatelessWidget {
  final bool? border;
  final bool? backgroundColor;
  final Function() onTap;
  final String btnText;
  final String? iconButton;
  final bool? textColor;
  final bool? iconColor;
  final bool widthMul;
  final bool linearGradient;
  final Color? firstColor;
  final Color? secondColor;
  final bool? shadow;
  final bool? siz;

  const Button({
    Key? key,
    this.border = true,
    this.backgroundColor = false,
    required this.btnText,
    required this.onTap,
    this.iconButton,
    this.textColor = true,
    this.iconColor = true,
    required this.widthMul,
    required this.linearGradient,
    this.firstColor,
    this.secondColor,
    this.shadow = false,
    this.siz=false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container( height: 60,
        decoration: border == true
            ? BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(
                    color: redColor, width: 1, style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(12),
                // color:  backgroundColor==true?redColor:Colors.transparent,
              )
            : BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(12),
                color: backgroundColor == true ? redColor : Colors.transparent,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Color(0xffDC2626)
                        .withOpacity(shadow == true ? 0.4 : 0.0),
                    blurRadius: 16,
                    offset: Offset(0, 6),
                  ),
                ],
                gradient: linearGradient == true
                    ? LinearGradient(
                        colors: [
                          firstColor!,
                          secondColor!,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      )
                    : LinearGradient(
                        colors: [
                          redColor,
                          redColor,
                        ],
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ),
              ),
        child: InkWell(
          onTap: onTap,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: EdgeInsets.fromLTRB(19.25, 13.25, 19.25, 13.25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconButton==null ?  Container()  :
                Image.asset(iconButton!,color: border == false ? Colors.white : Color(0xffDC2626),),
                iconButton==null ?  Container()  :  SizedBox(
                  width: 13.25,
                ),
                Text(
                  btnText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: textColor == true ? redColor : white,
                      fontWeight: FontWeight.bold,
                      fontSize: size18, ),
                  // style: textTheme.bodyText2
                ),
              ],
            ),
          ),
        ));
  }
}


