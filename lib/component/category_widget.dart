import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../component/image_network_widget.dart';
import '../component/text_widget.dart';

import '../component/colors.dart';

class CategoryWidget extends StatefulWidget {
  String  src;
  String  label;
  CategoryWidget({Key? key, required  this.src ,required  this.label , }) : super(key: key);

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
  @override
  Widget build(BuildContext context) {
    return
      Container(height: 130, child:
      ClipRRect(child:
      Stack(children: [
        ImageNetworkWidget(src: widget.src,
          height: 130,width: MediaQuery.of(context).size.width,borderRadius:  20 , ),
        Container(

          height: 130,
          decoration:   BoxDecoration(
            gradient:   LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.6),
                  Colors.black54.withOpacity(0.5),
                  /*AppColours.appgradientfirstColour,
                    AppColours.appgradientsecondColour*/
                ],
                begin: const FractionalOffset(0.0, 0.0),
                end: const FractionalOffset(0.0, 0.1),
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
        Center(child:
        Container(padding: EdgeInsets.all(20),child:
        TextWidget(color: Colors.white , fontSize: 12,
          label:  widget.label,
          fontWeight: FontWeight.normal,textAlign: TextAlign.justify,height: 2,)
          ,)
          ,)


      ],) ,borderRadius: BorderRadius.circular(20),

      )
        ,);
  }
}
