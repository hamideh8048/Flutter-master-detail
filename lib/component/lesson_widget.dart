import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:turbo_english/Pages/detail_lesson.dart';
import 'package:turbo_english/models/orderModel.dart';
import '../Pages/detail_lessonPanel.dart';
import '../component/image_network_widget.dart';
import '../component/text_widget.dart';

import '../component/colors.dart';

class LessonWidget extends StatefulWidget {
  bool hasPrice;
  bool hasGoButton;
  final OrderModel orderModel;
 // const DetailCourse({Key? key,required this.post_id}) : super(key: key);
  LessonWidget({Key? key,this.hasPrice=false,this.hasGoButton=true,required this.orderModel}) : super(key: key);

  @override
  State<LessonWidget> createState() => _LessonWidgetState();
}

class _LessonWidgetState extends State<LessonWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Container(height: 120,
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


            Container(height: 130, child:
            ClipRRect(child:
           // ImageNetworkWidget(src: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx5Xjh3fFiuDpFPmkfR_lB812k05DXc-I84g&usqp=CAU',
            ImageNetworkWidget(src: widget.orderModel.image_src,
              height: 130, ),borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20)),

            )
              ,),
            Container(width: 10,),
            Expanded(child:   Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 10,),

                TextWidget(color: Colors.grey.shade700, fontSize: 10,
                  label: widget.orderModel.title_post, fontWeight: FontWeight.bold,textAlign: TextAlign.start,),

                Container(height: 7,),
                TextWidget(color: Colors.grey.shade700, fontSize: 10,
                  label: widget.orderModel.summary_text,
                  fontWeight: FontWeight.normal,textAlign: TextAlign.start,),
                widget.hasPrice?
                Padding(
                    padding: const EdgeInsets.only(top: 20),
               child:
                TextWidget(color: Colors.grey.shade700, fontSize: 10,
                  label:' مبلغ دوره : ${widget.orderModel.price}تومان ' , fontWeight: FontWeight.bold,textAlign: TextAlign.start,)):Container(),


                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Expanded(child: Container()),
                    !widget.hasGoButton ? Container() :
                    widget.hasPrice ?
                      Container(margin: EdgeInsets.only(left: 10),child:
                      Image.asset('assets/images/arrow-left.png',height: 30,)
                        ,)
                 :
                    Container(
                      height: 32,
                      width: 120,margin: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)
                        ),
                      ),child:
                    Center(child:
                    InkWell(child:
                    TextWidget(color: Colors.white, fontSize: 14,
                      label:'مشاهده دوره',
                      fontWeight: FontWeight.normal,textAlign: TextAlign.start,),onTap:() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                         // builder: (context) => DetailLesson(course_id: widget.orderModel.id_post)
                          builder: (context) => DetailLessonPanel(course_id: widget.orderModel.id_post)
                        ),
                      );  
                    },),
                      
                    ))
                    ,
                  ],),
                Container(height: 5,),
              ],) ),
          ],)

        ,);
  }
}
