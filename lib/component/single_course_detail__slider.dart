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


class SingleCourseDetailSlider extends StatefulWidget {

  final List<String>  videos;
  CourseSliderModel  courseSliderModel;
  SingleCourseDetailSlider({Key? key,required  this.courseSliderModel ,required this.videos}) : super(key: key);

  @override
  State<SingleCourseDetailSlider> createState() => _SingleCourseDetailSliderState();
}

class _SingleCourseDetailSliderState extends State<SingleCourseDetailSlider> {
  List<String>  videoList=[];
  @override
 initState()  {
    super. initState();
  }
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 200)).then((value) {

    });
    return  Column(
      children: [
    widget.videos!=null&&widget.videos.length>0?
    YoYoPlayer(
      aspectRatio: 16 / 9,
      //url:
   //  widget.videos[0],
      url:"", //

      videoStyle: VideoStyle(),
      videoLoadingStyle: VideoLoadingStyle(),
    ):Container()

      ],
    );
  }

  int pageIndex=0;


}
