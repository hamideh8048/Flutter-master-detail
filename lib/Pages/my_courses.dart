import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_english/Pages/login_page.dart';
import 'package:turbo_english/all_requests/panel_request.dart';
import 'package:turbo_english/component/card_widget.dart';
import 'package:turbo_english/models/dashboard_model.dart';
import 'package:turbo_english/models/orderModel.dart';

import '../component/appbar_widget.dart';
import '../component/course_slider.dart';
import '../component/lesson_widget.dart';
import '../component/text_widget.dart';
import '../component/training_widget.dart';




class MyCourses extends StatefulWidget {
  final bool? showClasee;
  const MyCourses({Key? key,this.showClasee}) : super(key: key);

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  DashboardModel?  dashboardModel;
  OrderModel?  orderModel;
  List<OrderModel>  courseOrder=[];
  List<OrderModel>  classOrder=[];
  List<OrderModel>  generalOrder=[];
  String? token="";
  gettoken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(await prefs.getString('token')!=null)
    token= (await prefs.getString('token'))!;
    if(  token!=null && token!.length>2) {
      PanelRequest(rootContext: context).dashboard_get(page: "1").then((value) {
        if (value.data['status'] == "success") {
          List cource_order = value.data['data']['cource_order'];
          List class_order = value.data['data']['class_order'];
          for (int i = 0; i < cource_order.length; i++) {
            courseOrder.add(OrderModel(
                image_src: cource_order[i]['image_src'].toString(),
                title_post: cource_order[i]['title_post'].toString(),
                id_post: cource_order[i]['id_post'].toString(),
                price: cource_order[i]['price'].toString(),
                id_order: cource_order[i]['id_order'].toString(),
                summary_text: cource_order[i]['summary_text'].toString(),
                status_pay: cource_order[i]['status_pay'].toString(),
                status_pay_text: cource_order[i]['status_pay_text']
                    .toString()));
          }
          for (int i = 0; i < class_order.length; i++) {
            classOrder.add(OrderModel(
                image_src: class_order[i]['image_src'].toString(),
                title_post: class_order[i]['title_post'].toString(),
                id_post: class_order[i]['id_post'].toString(),
                price: class_order[i]['price'].toString(),
                id_order: class_order[i]['id_order'].toString(),
                summary_text: class_order[i]['summary_text'].toString(),
                status_pay: class_order[i]['status_pay'].toString(),
                status_pay_text: class_order[i]['status_pay_text'].toString()));
          }
          String total_cource_order = value.data['data']['total_cource_order']
              .toString();
          String total_class_order = value.data['data']['total_class_order']
              .toString();
          ;
          String first_name = value.data['data']['first_name'].toString();
          String last_name = value.data['data']['last_name'].toString();
          String wallet_inventory = value.data['data']['wallet_inventory']
              .toString();
          dashboardModel = DashboardModel(wallet_inventory: wallet_inventory,
              first_name: first_name,
              last_name: last_name,
              cource_order: cource_order,
              total_cource_order: total_cource_order,
              total_class_order: total_class_order,
              class_order: class_order);
          generalOrder = widget.showClasee != null && widget.showClasee == true
              ? classOrder
              : courseOrder;
          setState(() {});
        }
      });
      setState(() {});
    }else
    {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      );
    }
  }
  @override
  void initState() {
    List data;
    List courses;

    gettoken();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(padding: EdgeInsets.all(0),
      child:
          Column(children: [
           // AppBarWidget(onMenuClicked: (){},  logined: token==null||token=="" ? false : true),
           // AppBarWidget(onMenuClicked: (){}, logined: true,),
            Expanded(child:
            SingleChildScrollView(child:
            Container(padding: EdgeInsets.all(10),
                child:  Column(children: [

                  CardWidget(title: ' دوره های مشاهده شده', srcIcon: 'assets/images/wallet_2.png', subTitle:dashboardModel==null?"": dashboardModel!.total_class_order,  buttonTitle: 'مشاهده همه',
                    onTap: () {
                     generalOrder =classOrder;
                     setState(() {});
                    },),

                  CardWidget(title: ' پکیج های خریداری شده', srcIcon: 'assets/images/video-square.png', subTitle:dashboardModel==null?"": dashboardModel!.total_cource_order, buttonTitle: 'مشاهده همه',
                    onTap: () {
                      generalOrder =courseOrder;
                      setState(() {});
                    },),

                  generalOrder!=null &&generalOrder.length>0?  ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: generalOrder.length,shrinkWrap: true,padding: EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) {
                        return Container(margin: EdgeInsets.symmetric(vertical: 10),child:
                        LessonWidget(hasPrice: false,hasGoButton: true,orderModel: generalOrder[index],)
                          ,) ;
                      }):Container()
                  ,

                ],) )
              ,)
            )
          ],)

        ,
      ),
    );
  }
}
