import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:turbo_english/Pages/detail_course.dart';
import '../component/image_network_widget.dart';
import '../component/text_widget.dart';

import '../component/colors.dart';
import '../models/package_model.dart';

class TrainingWidget extends StatelessWidget {
  PackageModel  packageModel;

  TrainingWidget({Key? key,required  this.packageModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.all(5),
      child:
      Stack(children: [

        Container(height: 100,width:  MediaQuery.of(context).size.width,
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
            Row(children: [
              Expanded(child:
              ImageNetworkWidget(src: packageModel.image_src,width: 100,boxFit: BoxFit.cover,isCenter: false,),
             )
            ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RotationTransition(
                  turns:   AlwaysStoppedAnimation(180 / 360),
                  child: CustomPaint(
                    painter: TrianglePainter(
                      strokeColor: Colors.white,
                      strokeWidth: 10,
                      paintingStyle: PaintingStyle.fill,
                    ),
                    child: Container(
                      height: 110,
                      width: 80,
                    ),
                  ),
                ),

                Container(width:  MediaQuery.of(context).size.width-150),

              ],),

          ],)
          ,),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [

            Container(height: 100,width: MediaQuery.of(context).size.width-110,
              decoration: BoxDecoration(color: Colors.white,borderRadius:
              BorderRadius.only(topLeft: Radius.circular(20),bottomLeft: Radius.circular(20))),
            )
          ],)
        ,InkWell(child:
         Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            Container(margin: EdgeInsets.only(top: 10),child:

            Image.asset('assets/images/Group 4.png',height: 90,)
              ,)
          ],)
        ,onTap: (){
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => DetailCourse(post_id:packageModel.id_post==null? packageModel.link_post!:packageModel.id_post!, isCategory:packageModel.id_post==null?true: false),
    ),
    );
    })

        ,
        Container(margin: EdgeInsets.only(top: 10,right: 70,left: 50),child:

        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 5,),
            Container(padding: EdgeInsets.only(right: 10),child:
            TextWidget(color: Colors.grey.shade700, fontSize: 10,
              label:  packageModel.title_post, fontWeight: FontWeight.bold,)
              ,)
          ,

            Container(height: 12,),
            Container(
              height:35,padding: EdgeInsets.only(right: 25),
              child:
              TextWidget(color: Colors.grey.shade700, fontSize: 10,
                label:   packageModel.description_post.trim() ,
                fontWeight: FontWeight.normal,textAlign: TextAlign.start,textOverflow: TextOverflow.ellipsis,)
            )
           ,


            // Container(height: 7,),
            // TextWidget(color: Colors.grey.shade700, fontSize: 10,
            //   label:'           '+ packageModel.description_post.substring(40,80),
            //   fontWeight: FontWeight.normal,textAlign: TextAlign.start,),
            Container(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(width: 20,),
                Container(child:
                Stack(children: [
                  TextWidget(color: Colors.grey.shade700, fontSize: 10,
                    label:
                   ( packageModel.price_line=='' ?
                   ( double.parse(packageModel.price)+   (  double.parse(packageModel.price)*0.1)).toString() :
                    packageModel.price_line)+ ' تومان',
                    fontWeight: FontWeight.normal,textAlign: TextAlign.start,) ,
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child:

                    RotationTransition(
                      turns:   AlwaysStoppedAnimation(175 / 360),
                      child:
                      Container(height: 1,width: 80,color: Colors.grey.shade500,),
                    )
                    ,)


                ],)

                  ,)
                ,

                Container(width: 10,),
                TextWidget(color: Colors.red.shade700, fontSize: 10,
                  label:packageModel.price+ ' تومان',
                  fontWeight: FontWeight.normal,textAlign: TextAlign.start,),
              ],)
          ],)
          ,)

      ],)
      ,);
  }
}

class TrianglePainter extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;

  TrianglePainter({this.strokeColor = Colors.black, this.strokeWidth = 3, this.paintingStyle = PaintingStyle.stroke});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = strokeColor
      ..strokeWidth = strokeWidth
      ..style = paintingStyle;

    canvas.drawPath(getTrianglePath(size.width, size.height), paint);
  }

  Path getTrianglePath(double x, double y) {
    return Path()
      ..moveTo(0, y)
      ..lineTo(x / 2, 0)
      ..lineTo(x, y)
      ..lineTo(0, y);
  }

  @override
  bool shouldRepaint(TrianglePainter oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}