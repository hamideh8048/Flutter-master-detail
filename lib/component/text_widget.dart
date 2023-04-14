
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  String label;
  FontWeight fontWeight;
  double fontSize;
  Color color;
  double letterSpacing;
  double height;
  TextAlign textAlign;
  TextOverflow textOverflow;
    TextWidget({Key? key, required this.label ,required this.fontWeight ,
    required this.fontSize ,required this.color ,  this.letterSpacing =0.03,
      this.height =1.2,this.textAlign= TextAlign.left,this.textOverflow= TextOverflow.visible}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return  Text(label,style: TextStyle(color: color,fontSize: fontSize,fontWeight: fontWeight,letterSpacing: letterSpacing,height: height ,),

      textAlign: textAlign,
     overflow: textOverflow,
    );
  }


}