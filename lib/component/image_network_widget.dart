import 'package:flutter/material.dart';
import 'package:turbo_english/component/appbar_widget.dart';

import '../component/widget/button.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageNetworkWidget extends StatelessWidget {
  String src;
  double borderRadius;
  double? height;
  double? width;
  final bool isCenter;
  bool  hasPlayIcon;
  BoxFit boxFit;
    ImageNetworkWidget({Key? key,required this.src,  this.borderRadius=10,  this.height ,  this.width
      ,  this.hasPlayIcon=false,  this.boxFit=BoxFit.fill,this.isCenter=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(height: height
      ,width: width
      ,child:
        Stack(children: [
    isCenter==true?  Center(child:
          ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius),
              child: CachedNetworkImage(
                imageUrl: src,fit: boxFit,width: width,height: height,
                placeholder: (context, url) => Center(child:
                  Container(width: 20,height: 20,child: CircularProgressIndicator(),)
                  ,),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ))): ClipRRect(
       // borderRadius: BorderRadius.circular(borderRadius),
        child: CachedNetworkImage(
          imageUrl: src,fit: boxFit,width: width,height: height,
          placeholder: (context, url) => Center(child:
          Container(width: 20,height: 20,child: CircularProgressIndicator(),)
            ,),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ))

          ,
          hasPlayIcon ?
          Align(alignment: Alignment.center,child:

          Image.asset('assets/images/videoplay.png',height: 70,)
            ,) :  Container()
        ],)

      ,);
  }
}
