import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_english/Pages/home_page.dart';
import 'package:turbo_english/Pages/my_courses.dart';
import 'package:turbo_english/component/textbutton_widget.dart';

import '../Pages/login_page.dart';
import 'circular_avatar_widget.dart';

class AppBarWidget extends StatelessWidget {
  Function  onMenuClicked;
  bool  logined;
    AppBarWidget({Key? key,required this.onMenuClicked, required this.logined}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Container(height: 80,
      margin: EdgeInsets.only(top: 25,right: 15,left: 5),
      child:
      Row(children: [
        InkWell(child: 
          Image.asset('assets/images/Menu.png',height: 30,),
          onTap: (){
onMenuClicked();
          }
          ,),
        Expanded(child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 40,),
          Image.asset('assets/images/logoturbo.png',height: 30,),
          
        ],)),
        !logined?
        TextButtonWidget(txt:  'ورود / عضویت',
          textColor: const Color(0xffEF4444),
          backColor:   Color(0xffEF4444), onTap: () {
            Navigator
                .of(context)
                .push(MaterialPageRoute(builder: (_) => LoginPage()));
          },
        ):
        TextButtonWidget(txt:  'دوره های من',
          textColor: const Color(0xffEF4444),
          backColor:   Color(0xffEF4444), onTap: () {
            Navigator
                .of(context)
                //.push(MaterialPageRoute(builder: (_) => MyCourses()));
                .push(MaterialPageRoute(builder: (_) => HomePage(selectedIndex: "5",)));
          },
        ),
        logined ? Container(child:
        CircularAvatarWidget(width: 50,height: 50,)
          ,margin: EdgeInsets.only(left: 10),):Container(),
      ],)
      ,);
  }
}