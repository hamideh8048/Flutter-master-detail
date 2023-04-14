import 'package:flutter/material.dart';
import 'package:turbo_english/all_requests/pages_front_request.dart';
import 'package:turbo_english/all_requests/panel_request.dart';
import 'package:turbo_english/component/course_detail__slider.dart';
import 'package:turbo_english/component/single_course_detail__slider.dart';
import 'package:turbo_english/models/category_model.dart';
import 'package:turbo_english/models/course_slider_model.dart';
import 'package:turbo_english/models/package_model.dart';

import '../component/course_slider.dart';
import '../component/lesson_widget.dart';
import '../component/tab_widget.dart';
import '../component/training_widget.dart';

class DetailLesson extends StatefulWidget {
 final String course_id;
 final String? lesson_id;
  const DetailLesson({Key? key,required this.course_id,this.lesson_id}) : super(key: key);
  @override
  State<DetailLesson> createState() => _DetailLessonState();
}

class _DetailLessonState extends State<DetailLesson> {
  List<CategoryModel>  categories=[];
  List<PackageModel>  packages=[];
  List  videos=[];
  List<String>videoList=[];
  PackageModel? packageModel;
  String title_post="";
  String title_lesson="";
  String lesson="";
  @override
  void initState() {
    List data;
    List courses;
    // Future.delayed(Duration(milliseconds: 200)).then((value) {
    //
    // });
    if(widget.lesson_id==null)
     lesson="";
    else
      lesson= widget.lesson_id.toString();
    PanelRequest(rootContext: context).course_view(course_id: widget.course_id,lesson_id: lesson).then((value) {//2367
    if(  value.data['status']=="success") {
     // value.data['data'][0]['Lessons'][0]['childs_grupe'][0]['childs'];
      data = value.data['data'];
      String videoItem = value.data['data'][0]['video_lesson'];
      title_lesson = value.data['data'][0]['title_lesson'];
      title_post = value.data['data'][0]['title_post'];
      List<String> videoArray = videoItem.split("/");
      PagesFrontRequest(rootContext: context).getCourseVideos(
        media_id: videoArray[3],).then((value) {
        videoList.add(value.data['response'][0]['manifest'].toString());
        setState(() {});
      });
    }

    });

    super. initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.all(0),
      child:
      SingleChildScrollView(child:
      Column(children: [
      Container(padding: EdgeInsets.all(10),
        child:  Column(children: [
          videoList==null||videoList.length==0?Container():
          SingleCourseDetailSlider( courseSliderModel: CourseSliderModel(image_src: '', title_post: '', title_btn: '', id_post: '', color_bg_custom: '', videos: videoList, title_post_fa: '', link_post: ''),videos: videoList,),
          //CourseDetailSlider( courseSliderModel: CourseSliderModel(image_src: '', title_post: '', title_btn: '', id_post: '', color_bg_custom: '', videos: videoList, title_post_fa: '', link_post: ''),videos: videoList,),
         // TabWidget(),
          Container(height: 20,),
          Text(title_post
             ,textAlign: TextAlign.justify,),

        ],) ),
        // ListView.builder(
        //     physics: NeverScrollableScrollPhysics(),
        //     itemCount: lessonsList.length,
        //     shrinkWrap: true,
        //     itemBuilder: (context, index) {
        //       return   CourseWidget(lessonModel: lessonsList[index],);
        //     })
      ],)
        ,)
        ,
      ),
    );
  }
}
