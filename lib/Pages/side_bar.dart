import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_english/Pages/categories.dart';
import 'package:turbo_english/Pages/home_page.dart';
import 'package:turbo_english/all_requests/panel_request.dart';
import '../component/image_network_widget.dart';
import '../component/text_widget.dart';
import '../component/widget/button.dart';
import 'checkout_page.dart';
import 'login_page.dart';
import 'my_courses.dart';
import 'recent_order_page.dart';



class SideBarWidget extends StatefulWidget {
  @override
  State<SideBarWidget> createState() => _SideBarWidgetState();
}

class _SideBarWidgetState extends State<SideBarWidget> {
  String first_name="";
  String last_name="";

  String token="";
  String wallet_inventory="";
  clearToken() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', "");
    await prefs.clear();
}
      getProfileInfo() async{

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(await prefs.getString('token')!=null)
      {token=(await prefs.getString('token'))!;}
    if(await prefs.getString('first_name')!=null){
    first_name= (await prefs.getString('first_name'))!;

    if(  token!=null && token.length>2) {
      if (first_name == null) {

        PanelRequest(rootContext: context).dashboard_get(page: "1").then((
            value) async {
          if (value.data['status'] == "success") {
            String total_cource_order = value.data['data']['total_cource_order']
                .toString();
            String total_class_order = value.data['data']['total_class_order']
                .toString();
            first_name = value.data['data']['first_name'].toString();
            last_name = value.data['data']['last_name'].toString();
            wallet_inventory =
                value.data['data']['wallet_inventory'].toString();
            await prefs.setString('first_name', first_name);
            await prefs.setString('last_name', last_name);
            await prefs.setString('wallet_inventory', wallet_inventory);
            await prefs.setString('total_cource_order', total_cource_order);
            await prefs.setString('total_class_order', total_class_order);
            setState(() {});
          }
        });
      } else {
        first_name = (await prefs.getString('first_name'))!;
        last_name = (await prefs.getString('last_name'))!;
        wallet_inventory = (await prefs.getString('wallet_inventory'))!;
        setState(() {});
      }
    }
    setState(() {});
    }
    else
      PanelRequest(rootContext: context).dashboard_get(page: "1").then((
          value) async {
        if (value.data['status'] == "success") {
          String total_cource_order = value.data['data']['total_cource_order']
              .toString();
          String total_class_order = value.data['data']['total_class_order']
              .toString();
          first_name = value.data['data']['first_name'].toString();
          last_name = value.data['data']['last_name'].toString();
          wallet_inventory =
              value.data['data']['wallet_inventory'].toString();
          await prefs.setString('first_name', first_name);
          await prefs.setString('last_name', last_name);
          await prefs.setString('wallet_inventory', wallet_inventory);
          await prefs.setString('total_cource_order', total_cource_order);
          await prefs.setString('total_class_order', total_class_order);
          setState(() {});
        }
      });



  }

  int selectedIndex = 0;


  @override
  void initState() {

    getProfileInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child:

    Column(children: [
      Container(height: MediaQuery.of(context).size.height*0.3,),
      Image.asset('assets/images/logoEnglishTurbo.png',height: 50,),
      Container(height: 20,),
      Row(children: [
        Container(height: 60, child:
        ClipRRect(child:
        //ImageNetworkWidget(src: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9HPTntcspqMm1Vy1l_Hkru3Cj_roRgnhqiA&usqp=CAU',
    Image.asset('assets/images/avatar.png',

          height: 60,width: 60, ),borderRadius: BorderRadius.circular(10),

        )
          ,),
Container(width: 10,),
       token!=null && token.length>2?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          TextWidget(color: Colors.grey.shade900, fontSize: 15,
            label:first_name +" "+last_name ,
            fontWeight: FontWeight.bold,textAlign: TextAlign.start,),
          Container(
            margin: EdgeInsets.only(top: 10),
            height: 32,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10 ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 4, 
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ],
            ),child: 
            Row(children: [
              Container(width: 10,),
              Image.asset('assets/images/menu_empty-wallet.png',height: 22,width: 22,color: Colors.black87,),
              Container(width: 10,),
              TextWidget(color: Colors.grey.shade900, fontSize: 10,
                label:  'کیف پول: ${wallet_inventory}تومان',
                fontWeight: FontWeight.normal,textAlign: TextAlign.start,)
            ],)
            ,
          ),

        ],):
  Container()

      ],),
      Container(height: 40,),

      InkWell(child: Row(children: [
        Container(width: 10,),
        Image.asset('assets/images/menu_home.png',height: 25,width: 25,color: Colors.black87,),
        Container(width: 10,),
        TextWidget(color: Colors.grey.shade900, fontSize: 16,
          label:   token!=null && token.length>2? 'پیشخوان':"صفحه اصلی",
          fontWeight: FontWeight.normal,textAlign: TextAlign.start,)
      ],),onTap: token!=null && token.length>2?(){

        Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (_) => HomePage(selectedIndex: "6")));//RecentOrderPage()));
      }:null)
      ,
      Container(height: 20,),

      InkWell(child:  Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
        Container(width: 10,),
       // Image.asset('assets/images/menu_youtube.png',height: 20,width: 20,color: Colors.black87,),
        Image.asset('assets/images/menu_youtube.png',height: 24,width: 24,color: Colors.black87,),
        Container(width: 10,),
        TextWidget(color: Colors.grey.shade900, fontSize: 16,
          label: token!=null && token.length>2?   'دوره های من':"پکیج ها و کتاب های ویدیویی",
          fontWeight: FontWeight.normal,textAlign: TextAlign.start,)
      ],),onTap: token!=null && token.length>2?  (){

        Navigator.of(context).push(MaterialPageRoute(builder: (_) => HomePage(selectedIndex: "5")));
     }:null,)
     ,
      Container(height: 20,),

      InkWell(child:   Row(children: [
        Container(width: 10,),
        Image.asset('assets/images/menu_note.png',height: 25,width: 25,color: Colors.black87,),
        Container(width: 10,),
        TextWidget(color: Colors.grey.shade900, fontSize: 16,
          label: token!=null && token.length>2?  'آخرین تراکنش ها':'کتاب ویدیویی توربوتاک',
          fontWeight: FontWeight.normal,textAlign: TextAlign.start,)
      ],),onTap: (){

        Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (_) => HomePage(selectedIndex: "6")));

        // Navigator
        //     .of(context)
        //     .push(MaterialPageRoute(builder: (_) => RecentOrderPage()));
      },)
    ,
      Container(height: 20,),

      // InkWell(child: Row(children: [
      //   Container(width: 10,),
      //   Image.asset('assets/images/menu_empty-wallet.png',height: 25,width: 25,color: Colors.black87,),
      //   Container(width: 10,),
      //   TextWidget(color: Colors.grey.shade900, fontSize: 18,
      //     label:  'دسته بندی ها',
      //     fontWeight: FontWeight.normal,textAlign: TextAlign.start,)
      // ],) ,onTap: (){},),

     // Container(height: 20,),
      InkWell(child:  Row(children: [
        Container(width: 10,),
        Image.asset('assets/images/menu_empty-wallet.png',height: 25,width: 25,color: Colors.black87,),
        Container(width: 10,),
        TextWidget(color: Colors.grey.shade900, fontSize: 16,
          label:  token!=null && token.length>2?  'تسویه حساب':"توربو اکسپرس",
          fontWeight: FontWeight.normal,textAlign: TextAlign.start,)
      ],),onTap:  token!=null && token.length>2? (){
        Navigator
            .of(context)
            .push(MaterialPageRoute(builder: (_) => HomePage(selectedIndex: "7")));

      }:null,)
     ,
      // Container(height: 20,),
      // Row(children: [
      //   Container(width: 10,),
      //   Image.asset('assets/images/menu_home.png',height: 25,width: 25,color: Colors.black87,),
      //   Container(width: 10,),
      //   TextWidget(color: Colors.grey.shade900, fontSize: 18,
      //     label:  'صفحه اصلی وبسایت',
      //     fontWeight: FontWeight.normal,textAlign: TextAlign.start,)
      // ],),
      Container(height: 20,),
      token!=null && token.length>2?
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Container(
          margin: EdgeInsets.all(20),
          height: 40,
          width: 175,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(10 ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ],
          ),child:
    InkWell(child:
        Row(children: [
          Container(width: 10,),
          Image.asset('assets/images/Turn off.png',height: 25,width: 25,color: Colors.white,),
          Container(width: 10,),
          TextWidget(color: Colors.white, fontSize: 14,
            label:  'خروج از پنل کاربری',
            fontWeight: FontWeight.normal,textAlign: TextAlign.start,)
        ],),onTap: (){
      clearToken();

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );

    },)
          ,
        ),
      ],):Container()
    ],)
      ,);
  }
}

 