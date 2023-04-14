import 'package:flutter/material.dart';
import 'package:turbo_english/component/text_widget.dart';
import 'appbar/turbo_appbar.dart';
import 'lesson_widget.dart';
import 'textbutton_widget.dart';


class CardWidget extends StatelessWidget {
  String srcIcon;
  String title;
  String subTitle;
  String buttonTitle;
  Function ()  onTap;
    CardWidget({Key? key,required this.srcIcon,
      required this.title,required this.subTitle,required this.buttonTitle,
      required this.onTap,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10 ),padding: EdgeInsets.all(10),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),child:
    Column(

      children: [
      Row(children: [
        Image.asset(srcIcon,height: 30,),
        Container(width: 5,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextWidget(color: Colors.grey.shade600, fontSize: 12,
            label: title,
            fontWeight: FontWeight.normal,textAlign: TextAlign.start,),
          Container(height: 10,),
          TextWidget(color: Colors.grey.shade800, fontSize: 12,
            label:  subTitle,
            fontWeight: FontWeight.bold,textAlign: TextAlign.start,),

          Container(height: 10,),
        ],)

      ],),
      InkWell(child:
      Container(height: 30,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.grey.shade800),
        child: Center(child: TextWidget(color: Colors.white, fontSize: 16,
          label:  buttonTitle,
          fontWeight: FontWeight.normal,textAlign: TextAlign.start,),),
      ) ,onTap: (){
        onTap();
      }
        ,)

    ],)
      ,
    );
  }
}


