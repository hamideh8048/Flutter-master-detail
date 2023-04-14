import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:turbo_english/component/appbar_widget.dart';
import 'package:turbo_english/component/image_network_widget.dart';
import 'package:turbo_english/component/textbutton_widget.dart';
import 'package:turbo_english/models/course_slider_model.dart';
import 'package:yoyo_player/yoyo_player.dart';

import '../Pages/categories.dart';
import '../Pages/detail_course.dart';


class CourseSlider extends StatefulWidget {
  String headerTitle;
  String footerTitle;
  bool dot;
  bool hasFooterHeader;
  CourseSliderModel  courseSliderModel;
    CourseSlider({Key? key,required this.headerTitle , required  this.footerTitle
      ,    this.dot=false,    this.hasFooterHeader=true,   required  this.courseSliderModel }) : super(key: key);

  @override
  State<CourseSlider> createState() => _CourseSliderState();
}

class _CourseSliderState extends State<CourseSlider> {
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        widget.hasFooterHeader ?
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

            ImageNetworkWidget(src: widget.courseSliderModel.image_src ,height: 30,borderRadius: 200,
               ),
          ],
        ) : Container(),

        Crousel(context),
Container(height: 30,child:
    Stack(children: [

      Align(alignment: Alignment.center,child:
          Container(
            padding: EdgeInsets.only(bottom:  widget.dot ? 5 :15),
          child:
         // widget.courseSliderModel==null||widget.courseSliderModel.videos==null||widget.courseSliderModel.videos.length==0?Container():
          CarouselIndicator(
            count:widget.courseSliderModel.videos.length,
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

        widget.hasFooterHeader ?
        Column(children: [
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
              TextButtonWidget(txt:  widget.courseSliderModel.title_btn,
                textColor:    Color(0xffA21CAF),
                backColor: Color(0xffA21CAF), onTap: () {  },

              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
        ],)  : Container()

      ],
    );
  }

  int pageIndex=0;

  gotoSelectedPage(int selectedPage) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailCourse(post_id: widget.courseSliderModel.link_post, isCategory: true),
      ),
    );
  }
  Widget  Crousel(context){
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child:
          PageView.builder(
            itemBuilder: (context, position) {
              return
                // InkWell(child:  ImageNetworkWidget(src: "https://stream.englishturbo.com/s81coirkzfq6/thumbnail.jpg?size=640x360"
                  InkWell(child:  ImageNetworkWidget(src: widget.courseSliderModel.image_src
                    ,height: 200,hasPlayIcon: true,isCenter: true,)
                    ,onTap: (){
                      gotoSelectedPage(1);
                    }) ;

            },
              onPageChanged: (index){
                setState(() {
                  pageIndex=index;
                });
              },
            itemCount: widget.courseSliderModel.videos.length, // Can be null
          )

          // PageView(
          //   children:
          //
          //   [
          //     InkWell(child:  ImageNetworkWidget(src: "https://stream.englishturbo.com/s81coirkzfq6/thumbnail.jpg?size=640x360"
          //       ,height: 200,hasPlayIcon: true,)
          //       ,onTap: (){
          //         gotoSelectedPage(1);
          //
          //       },)  ,
          //     InkWell(child:  ImageNetworkWidget(src: "https://stream.englishturbo.com/s81coirkzfq6/thumbnail.jpg?size=640x360"
          //       ,height: 200,hasPlayIcon: true,)
          //       ,onTap: (){
          //         gotoSelectedPage(2);
          //
          //       },)  ,
          //     InkWell(child:  ImageNetworkWidget(src: "https://stream.englishturbo.com/s81coirkzfq6/thumbnail.jpg?size=640x360"
          //       ,height: 200,hasPlayIcon: true,)
          //       ,onTap: (){
          //         gotoSelectedPage(3);
          //
          //       },)  ,
          //   ]
          //   ,dragStartBehavior: DragStartBehavior.down,scrollDirection: Axis.horizontal,
          //   reverse: true,
          //
          //
          //   onPageChanged: (index){
          //     setState(() {
          //       pageIndex=index;
          //     });
          //   },
          // ),
        ),

      ],
    );
  }
}
