import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:turbo_english/component/appbar_widget.dart';
import 'package:turbo_english/component/image_network_widget.dart';
import 'package:turbo_english/component/textbutton_widget.dart';

import '../component/widget/button.dart';

class OrderSlider extends StatefulWidget {
  String headerTitle;
  String footerTitle;
  bool dot;
    OrderSlider({Key? key,required this.headerTitle , required  this.footerTitle
      ,    this.dot=false }) : super(key: key);

  @override
  State<OrderSlider> createState() => _OrderSliderState();
}

class _OrderSliderState extends State<OrderSlider> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
             widget.headerTitle,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 3,
            ),

            ImageNetworkWidget(src: 'https://englishturbo.com/wp-content/uploads/2022/02/5449801-150x150.jpg',height: 30,borderRadius: 200,),

          ],
        ),
        Crousel(context),
Container(height: 30,child:
    Stack(children: [

      Align(alignment: Alignment.center,child:
          Container(
            padding: EdgeInsets.only(bottom:  widget.dot ? 5 :15),
          child:
          CarouselIndicator(
            count: _demo.length,
            index: pageIndex,color: Colors.grey,activeColor: Colors.red,
            width: widget.dot ? 8 : 20 ,height: widget.dot ? 8 : 5,
          )
            ,)

    ,),
  Container(
    child:
  Row(children: [
    InkWell(child: Image.asset('assets/images/arrow-right.png',height: 30,),onTap: (){},),
    Expanded(child: Container()),
    InkWell(child: Image.asset('assets/images/arrow-left.png',height: 30),onTap: (){},),

  ],)
    ,)

    ],)

  ,)
,
        SizedBox(
          height: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.footerTitle,
                style: TextStyle(
                  color: Color(0xff475569),
                  fontSize: 16,fontWeight: FontWeight.bold
                )),
            TextButtonWidget(txt:  'انتخاب ترم و ثبت نام',
              textColor:  const Color(0xffA21CAF),
              backColor: Color(0xffA21CAF), onTap: () {  },

            ),
          ],
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  int pageIndex=0;

  List<Widget> _demo=[
  ImageNetworkWidget(src: "https://stream.englishturbo.com/s81coirkzfq6/thumbnail.jpg?size=640x360",height: 200,hasPlayIcon: true,),

    ImageNetworkWidget(src: "https://stream.englishturbo.com/s81coirkzfq6/thumbnail.jpg?size=640x360",height: 200,hasPlayIcon: true,),
    ImageNetworkWidget(src: "https://stream.englishturbo.com/s81coirkzfq6/thumbnail.jpg?size=640x360",height: 200,hasPlayIcon: true,),
  ];

  Widget  Crousel(context){
    return  Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child: PageView(
            children: _demo,dragStartBehavior: DragStartBehavior.down,scrollDirection: Axis.horizontal,reverse: true,

            onPageChanged: (index){
              setState(() {
                pageIndex=index;
              });
            },
          ),
        ),

      ],
    );
  }
}
