import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:turbo_english/all_requests/pages_front_request.dart';
import 'package:turbo_english/component/appbar_widget.dart';
import 'package:turbo_english/component/image_network_widget.dart';
import 'package:turbo_english/component/textbutton_widget.dart';
import 'package:turbo_english/models/course_slider_model.dart';
import 'package:yoyo_player/yoyo_player.dart';

import '../Pages/categories.dart';
import '../Pages/detail_course.dart';


class CourseDetailSlider extends StatefulWidget {

  final List<String>  videos;
  CourseSliderModel  courseSliderModel;
  CourseDetailSlider({Key? key,required  this.courseSliderModel ,required this.videos}) : super(key: key);

  @override
  State<CourseDetailSlider> createState() => _CourseDetailSliderState();
}

class _CourseDetailSliderState extends State<CourseDetailSlider> {
  List<String>  videoList=[];
  @override
 initState()  {

    // for (int i = 0; i < widget.videos.length; i++) {
    //   String videoItem =widget. videos[i].toString();
    //   List<String> videoArray = videoItem.split("/");
    //   PagesFrontRequest(rootContext: context).getCourseVideos(
    //     media_id: videoArray[3],).then((value) {
    //     //  data=value.data['data'];
    //  //   if (value.data['data'] != null ) {
    //
    //       setState(() {
    //         videoList.add(value.data['response'][0]['manifest'].toString());
    //       });
    //    // }
    //   });
    // }

    super. initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200)).then((value) {

    });
    return  Column(
      children: [

        widget.videos==null||widget.videos.length==0?Container():


      Crousel(context),
    Container(height: 30,child:
    Stack(children: [
      Align(alignment: Alignment.center,child:
          Container(
          padding: EdgeInsets.only(bottom: 15),
          child:

        widget.videos==null||widget.videos.length==0?Container():  CarouselIndicator(
            count:widget.videos.length,
            index: pageIndex,
            color: Colors.grey,
            activeColor: Colors.red,
            width:  20 ,height: 5,
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
      ],
    );
  }

  int pageIndex=0;


  Widget  Crousel(context){
    return  Column(
      children: [
        Container(
          height: 200,
          width: double.infinity,
          child:

          PageView.builder(
            itemBuilder: (context, position) {
              return

                YoYoPlayer(
                  aspectRatio: 16 / 9,
               //  url: widget.videos[position],
                url:"https://assets.afcdn.com/video49/20210722/v_645516.m3u8", //"https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
                  videoStyle: VideoStyle(),
                  videoLoadingStyle: VideoLoadingStyle(),
               );
            },
            itemCount:widget.videos.length,
              onPageChanged: (index){
                setState(() {
                  pageIndex=index;
                });
              },// Can be null
          )

        ),

      ],
    );
  }
}
