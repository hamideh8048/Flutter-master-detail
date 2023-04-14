import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../component/image_network_widget.dart';
import '../component/text_widget.dart';

import '../component/colors.dart';

class DownloadWidget extends StatefulWidget {
  bool hasPrice;
  bool hasGoButton;
  DownloadWidget({Key? key,this.hasPrice=false,this.hasGoButton=true}) : super(key: key);

  @override
  State<DownloadWidget> createState() => _DownloadWidgetState();
}

class _DownloadWidgetState extends State<DownloadWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Container(height: 110,margin: EdgeInsets.only(top: 10,right: 10,left: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 1), // changes position of shadow
            ),
          ],
        ),
        child:
        Row(

          children: [


            Container(height: 110, child:
            ClipRRect(child:
            ImageNetworkWidget(src: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx5Xjh3fFiuDpFPmkfR_lB812k05DXc-I84g&usqp=CAU',
              height: 130, ),borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),

            )
              ,),
            Container(width: 10,),
            Expanded(child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10,),

                TextWidget(color: Colors.grey.shade700, fontSize: 10,
                  label: 'مکالمه با توربوتاک ترم 1 – استاد قلی زاده ', fontWeight: FontWeight.bold,textAlign: TextAlign.start,),

                Container(height: 7,),
                Row(children: [
                  TextWidget(color: Colors.grey.shade700, fontSize: 10,
                    label: 'قسمت یک  ',
                    fontWeight: FontWeight.normal,textAlign: TextAlign.start,),


                  Expanded(child: Container()),
                  TextWidget(color: Colors.grey.shade700, fontSize: 10,
                    label: '۵۰mb/۲۱.۵mb ',
                    fontWeight: FontWeight.normal,textAlign: TextAlign.start,),
                  Container(width: 10,)
                ],),
                Container(height: 15,),
                Row(children: [
                  
                  Expanded(child:  LinearPercentIndicator(
                    alignment: MainAxisAlignment.end,
                    isRTL : true,
                    padding: EdgeInsets.only(left: 10),
                    lineHeight: 8.0,
                    percent: 0.5,barRadius: Radius.circular(20),
                    backgroundColor: Colors.grey.shade200,
                    progressColor: Colors.red,
                  ))
                ],)
               ,

                Expanded(child: Container()),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                  Container(child:
                  TextWidget(color: Colors.grey.shade700, fontSize: 10,
                    label:  '۶۰ % در حال دانلود...',
                    fontWeight: FontWeight.normal,textAlign: TextAlign.start,)

                    ,)
                    ,
                    Expanded(child: Container()),
                    Container(margin: EdgeInsets.only(left: 10),child:
                    Image.asset('assets/images/pause-circle.png',height: 30,)
                      ,)
                    ,
                  ],),
                Container(height: 5,),
              ],) ),
          ],)

        ,);
  }
}
