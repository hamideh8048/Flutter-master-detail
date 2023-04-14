import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:turbo_english/Pages/detail_lesson.dart';
import 'package:turbo_english/models/lesson_model.dart';
import '../Pages/detail_lessonPanel.dart';
import '../component/image_network_widget.dart';
import '../component/text_widget.dart';

import '../component/colors.dart';
import '../models/package_model.dart';

class CourseWidget extends StatefulWidget {
  LessonModel lessonModel;

  //CourseWidget({Key? key, required this.packageModel}) : super(key: key);
  CourseWidget({Key? key,required this.lessonModel}) : super(key: key);
  @override
  _CourseWidgetState createState() => _CourseWidgetState();
}
class _CourseWidgetState extends State<CourseWidget> {
  bool groupVisible=false;
  bool childVisible=false;
  String selectedId="";
  @override
  Widget build(BuildContext context) {
    return     Container(
      margin: EdgeInsets.all(5),
      child:
      Stack(children: [

        Container(width:  MediaQuery.of(context).size.width,
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
          Stack(children: [
            Padding(padding:
            const EdgeInsets.only(left: 10,right: 10),child:
            InkWell (child:
            Row(
                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.lessonModel.title_post,style: TextStyle(
                    fontSize: 12,  fontWeight: FontWeight.w700,
                  )),
                  Image.asset('assets/images/Group 4.png',height: 60,),
                ]),onTap: (){
              groupVisible=!groupVisible;
              setState(() {
              });

            },))

            ,Visibility(
                visible: groupVisible,
                child:Padding(padding:
                const EdgeInsets.only(top: 30,right: 20),child:
    ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    itemCount: widget.lessonModel.childs_grupe.length,
    shrinkWrap: true,
    itemBuilder: (context, index2) {
    return
      Container(
        margin: EdgeInsets.all(5),
        child:
        Stack(children: [

          Container(width:  MediaQuery.of(context).size.width*0.9,
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
            Stack(children: [
              Padding(padding:
              const EdgeInsets.only(left: 10,right: 10),child:
              InkWell(child:
              Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.lessonModel.childs_grupe[index2].title_post,style: TextStyle(
                      fontSize: 12,  fontWeight: FontWeight.w700,
                    )),
                    Image.asset('assets/images/Group 4.png',height: 60,),
                  ])
                ,onTap: (){
                  selectedId=widget.lessonModel.childs_grupe[index2].id.toString();
                  childVisible=!childVisible;
                  setState(() {
                  });
                },
              ),

              ),
              Visibility(
                  visible:widget.lessonModel.childs_grupe[index2].id==selectedId&&childVisible? true:false,child:
              Padding(padding:
              const EdgeInsets.only(top: 30,right: 20),child:
    ListView.builder(
    physics: NeverScrollableScrollPhysics(),
    itemCount: widget.lessonModel.childs_grupe[index2].child!.length,
    shrinkWrap: true,
    itemBuilder: (context, index3) {
      return Container(
      margin: EdgeInsets.all(5),
      child:
      Stack(children: [

      Container(width: MediaQuery.of(context).size.width*0.8,
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
      Stack(children: [
      Padding(padding:
      const EdgeInsets.only(left: 10,right: 10),child:
      InkWell(child:
      Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width*0.5 ,child:
      Text(widget.lessonModel.childs_grupe[index2].child![index3].title_post,style: TextStyle(
          fontSize: 10,fontWeight: FontWeight.w700,color:Colors.grey
         ))),
      Image.asset('assets/images/Group 4.png',height: 60,),
      ]),
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
               // builder: (context) => DetailLesson(course_id: widget.lessonModel.course_id.toString(),lesson_id:  widget.lessonModel.childs_grupe[index2].child![index3].id.toString())
                builder: (context) => DetailLessonPanel(course_id: widget.lessonModel.course_id.toString(),lesson_id:  widget.lessonModel.childs_grupe[index2].child![index3].id.toString())
            ),
          );

        },)
          //DetailLesson
      )
      ],)
      ,)


      ],)
      ,);
    })

              )
              )

            ],)
            ,)


        ],)
        ,);
    })

                ))
          ],)
          ,)




      ],)
      );
  }
}
