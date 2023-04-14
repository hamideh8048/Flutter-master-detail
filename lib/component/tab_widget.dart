import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../component/image_network_widget.dart';
import '../component/text_widget.dart';

import '../component/colors.dart';

class TabWidget extends StatefulWidget {
  bool hasPrice;
  bool hasGoButton;
  final ValueChanged<String> onChanged;
  TabWidget({Key? key,this.hasPrice=false,this.hasGoButton=true,required this.onChanged}) : super(key: key);

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return
      Column(children: [
        Container(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color:  Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 1), // changes position of shadow
                  ),
                ],
              ),
              child:
              Row(

                children: [
                  InkWell(child:
                  Container(height: 80,padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: selectedIndex==0 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextWidget(color: Colors.grey.shade900, fontSize: 12,
                          label:  'توضیحات دوره',
                          fontWeight: FontWeight.bold, )

                      ],)

                    ,),onTap: (){
                    selectedIndex=0;

                    setState(() {
                      widget.onChanged("0");
                    });
                  },),

                  InkWell(child:  Container(height: 80,padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: selectedIndex==1 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 1),  // changes position of shadow
                        ),
                      ],
                    ),
                    child:
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        TextWidget(color:  Colors.grey.shade900, fontSize: 12,
                          label:  'جلسات دوره',
                          fontWeight: FontWeight.bold, )

                      ],)

                    ,),onTap: (){
                    selectedIndex=1;

                    setState(() {
                      widget.onChanged("1");
                    });
                  },),



                  InkWell(child:   Container(height: 80,padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: selectedIndex==2 ? Colors.white : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
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
                    Row( mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        TextWidget(color: Colors.grey.shade900, fontSize: 12,
                          label:  'نظرات کاربران',
                          fontWeight: FontWeight.bold, )

                      ],)

                    ,),onTap: (){
                    selectedIndex=2;

                    setState(() {
                      widget.onChanged("2");
                    });
                  },),


                ],)

              ,)
          ],),
        Container(height: 20,),

      ],);
  }
}
