import 'package:flutter/material.dart';
import 'package:turbo_english/Pages/checkout_page.dart';
import 'package:turbo_english/Pages/detail_lessonPanel.dart';
import 'package:turbo_english/all_requests/pages_front_request.dart';
import 'package:turbo_english/component/course_detail__slider.dart';
import 'package:turbo_english/component/course_widget.dart';
import 'package:turbo_english/component/text_widget.dart';
import 'package:turbo_english/models/category_model.dart';
import 'package:turbo_english/models/course_slider_model.dart';
import 'package:turbo_english/models/lessonGroupe_model.dart';
import 'package:turbo_english/models/lessonGroupe_model.dart';
import 'package:turbo_english/models/lessonGroupe_model.dart';
import 'package:turbo_english/models/lesson_model.dart';
import 'package:turbo_english/models/orderModel.dart';
import 'package:turbo_english/models/package_model.dart';

import '../component/course_slider.dart';
import '../component/lesson_widget.dart';
import '../component/tab_widget.dart';
import '../component/training_widget.dart';
import 'course_list_page.dart';
class DetailCourse extends StatefulWidget {
 final String post_id;
 final bool isCategory;
  const DetailCourse({Key? key,required this.post_id,required this.isCategory}) : super(key: key);
  @override
  State<DetailCourse> createState() => _DetailCourseState();
}

class _DetailCourseState extends State<DetailCourse> {
  List<CategoryModel>  categories=[];
  List<PackageModel>  packages=[];
  List  videos=[];
  List  lessons=[];
  List  child=[];
  List<String>videoList=[];
  String content="";
  PackageModel? packageModel;
  String title_cat="";
  String description_cat="";
  String selectedTab="";
  bool groupVisible=false;
  bool childVisible=false;
  String price="0";
  String status_buy="";
OrderModel? order;
  List<LessonModel>lessonsList=[];
  LessonModel? lessonItem;
  List<LessonGroupeModel>lessonGroups=[];
  List<LessonGroupeModel>lessonGroupsChild=[];
   LessonGroupeModel? LessonGroupeitem;

  static String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>", multiLine: true,
        caseSensitive: true
    );
    String f= htmlText.replaceAll(exp, '').replaceAll('\n', '').replaceAll('\t', '').replaceAll('nbsp', '').replaceAll('&', '').replaceAll('zwnj', '');
    return f;
  }
  @override
  void initState() {
    List data;
    List courses;
    // Future.delayed(Duration(milliseconds: 200)).then((value) {
    //
    // });
    if(widget.isCategory)
    PagesFrontRequest(rootContext: context).getCourseCategory(post_id: widget.post_id, page_number: '1').then((value)async {
      if(value.statusCode==200) {
        //data = value.data['data'];
        courses = value.data['courses'];
        title_cat = value.data['data'][0]['title_cat'];
        description_cat = value.data['data'][0]['description_cat'];
        videos = value.data['data'][0]['videos'];
        content = description_cat;
        content=removeAllHtmlTags(description_cat);
        for (int i = 0; i < videos.length; i++) {
          String videoItem = videos[i].toString();
          List<String> videoArray = videoItem.split("/");
          PagesFrontRequest(rootContext: context).getCourseVideos(
            media_id: videoArray[3],).then((value) {
            videoList.add(value.data['response'][0]['manifest'].toString());
            setState(() {});
          });
          //videoList.add( videos[i] );

        }
        for (int i = 0; i < courses.length; i++) {
          packages.add(PackageModel(
              id_post: courses[i]['id_post'].toString(),
              image_src: courses[i]['image_src'].toString(),
              price_line: courses[i]['price_line'].toString(),
              price: courses[i]['price'].toString().replaceAll("از", "").trim(),
              title_post: courses[i]['title_post'].toString(),
              link_post: courses[i]['link_post'].toString().replaceAll(
                  "course-category", "").replaceAll("/", "").trim(),
              description_post: courses[i]['summary_text'].toString()));
        }
        // setState(() {
        //
        // });
      }
    });
    else
      PagesFrontRequest(rootContext: context).getCourseSinge(post_id: widget.post_id).then((value)async {
        if(  value.data['status']=="success") {
          value.data['data'][0]['Lessons'][0]['childs_grupe'][0]['childs'];
          lessons = value.data['data'][0]['Lessons'];
          price = value.data['data'][0]['price'].toString();
          status_buy = value.data['data'][0]['status_buy'].toString();
          order=OrderModel(image_src: value.data['data'][0]['image_src'].toString(), title_post: value.data['data'][0]['title_post'].toString(), id_post: widget.post_id, price: price, id_order: "", summary_text: value.data['data'][0]['summary_text'].toString(), status_pay: status_buy, status_pay_text: "");
         videos= value.data['data'][0]['videos'];
          for (int i = 0; i < videos.length; i++) {
            String videoItem = videos[i].toString();
            List<String> videoArray = videoItem.split("/");
            PagesFrontRequest(rootContext: context).getCourseVideos(
              media_id: videoArray[3],).then((value) {
              videoList.add(value.data['response'][0]['manifest'].toString());
              setState(() {});
            });
            //videoList.add( videos[i] );

          }
          for (int j = 0; j < lessons.length; j++) {
            List child_group = lessons[j]['childs_grupe'];
            for (int k = 0; k < child_group.length; k++) {
              child = child_group[k]['childs'];
              for (int m = 0; m < child.length; m++) {
                lessonGroupsChild.add(LessonGroupeModel(

                    title_post: child[m]['title_post'].toString(),
                    type_post: child[m]['type_post'].toString(),
                    id: child[m]['id'].toString(),
                    numb_sort: child[m]['numb_sort'].toString()));
              }
              lessonGroups.add(LessonGroupeModel(id: child_group[k]['id'],
                  title_post: child_group[k]['title_post'].toString(),
                  type_post: child_group[k]['type_post'].toString(),
                  numb_sort: child_group[k]['numb_sort'].toString(),
                  child: lessonGroupsChild));
              lessonGroupsChild = [];
            }
            description_cat = value.data['data'][0]['description'].toString();

            lessonsList.add(LessonModel(
                title_post: lessons[j]['title_post'].toString(),
                type_post: lessons[j]['type_post'].toString(),
                numb_sort: lessons[j]['numb_sort'].toString(),
                childs_grupe: lessonGroups,
                course_id: value.data['data'][0]['id_post']));
            content = description_cat;
            lessonGroups = [];
           setState(() {});
          }
          // lessonGroups=lessons[j]['childs_grupe'];
          // LessonGroupeitem!.child = lessons[j]['childs_grupe'];
        }
      });
        // setState(() {
        //
        // };
    super. initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:widget.isCategory?null:
  Align( alignment: Alignment(0.5,0.7), child:

       // mainAxisAlignment: MainAxisAlignment.end
          Container(
            height: 50,margin: EdgeInsets.only(top: 10,bottom: 10,right: 35,left: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),child:
          Row(children: [
            Expanded(child:
            InkWell(onTap: (){
            if( status_buy=="yes"){

              Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (_) =>  DetailLessonPanel(course_id: widget.post_id.toString(),lesson_id:  '')
              ));}
            else{
              Navigator
                  .of(context)
                  .push(MaterialPageRoute(builder: (_) =>  CheckoutPage(orderModel: order,)
                 // .push(MaterialPageRoute(builder: (_) =>  CourseList()
          ));
            }

            }
   ,child:
    Container(height: 40,padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(right: 5,left: 15),
    decoration: BoxDecoration(
    color: Colors.red.shade800,//selectedIndex==0 ? Colors.white : Colors.transparent,
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
    TextWidget(color: Colors.white, fontSize: 12,
      //Colors.grey.shade900,
    label:status_buy=="yes"?'مشاهده دوره': 'خرید دوره',//'${status_buy}',//
    fontWeight: FontWeight.bold, )

    ],)

    ,)

    ,)
            ),

            Expanded(child:
            InkWell(onTap: (){

              // _selectedIndex=1;
              // setState(() {
              // });

             // _launchapp('https://www.instagram.com/simonscatofficial/');
            },child:

            Container(height:40,padding: EdgeInsets.symmetric(horizontal: 20),
              margin: EdgeInsets.only(right: 5,left: 20),
              decoration: BoxDecoration(
                color: Colors.transparent,//selectedIndex==0 ? Colors.white : Colors.transparent,
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
Center(child:
                  TextWidget(color: Colors.red.shade800, fontSize: 12,
                    label:  '${price}تومان',
                    fontWeight: FontWeight.bold, )
)
              ,)

            ),)

          ],)
            ,
          )
        ,),
      body: Container(padding: EdgeInsets.all(0),
      child:
      SingleChildScrollView(child:
      Column(children: [
      Container(padding: EdgeInsets.all(10),
        child:  Column(children: [
          videoList==null||videoList.length==0?Container():  CourseDetailSlider( courseSliderModel: CourseSliderModel(image_src: '', title_post: '', title_btn: '', id_post: '', color_bg_custom: '', videos: videoList, title_post_fa: '', link_post: ''),videos: videoList,),
        !widget.isCategory?  TabWidget(onChanged: (String value) {
          // content= description_cat
            if(value=="0")
              content=description_cat;
           else  {
               content="";
             }
          //   else if(value=="2")
          //     content="qqqqqqqqq";
            selectedTab=value;
            setState(() {
            });
            },):Container(),
          Container(height: 20,),
          Text(removeAllHtmlTags(content),textAlign: TextAlign.justify,),

          lessons!=null&&   lessons.length>0&& selectedTab=="1"? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: lessonsList.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return   CourseWidget(lessonModel: lessonsList[index],);
              }):Container(),

          SizedBox(
            height: 15
          )

        ],) ),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: packages.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return   TrainingWidget(packageModel: packages[index],);
            }),
        SizedBox(
          height: 20
          ,
        )
        ,
      ],)
        ,)
        ,
      ),
    );
  }
}
