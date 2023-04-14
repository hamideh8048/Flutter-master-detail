import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_english/Pages/main_page.dart';
import 'package:turbo_english/Pages/my_courses.dart';
import 'package:turbo_english/Pages/profile.dart';
import 'package:turbo_english/Pages/recent_order_page.dart';
import 'package:turbo_english/Pages/side_bar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../component/appbar_widget.dart';
import 'checkout_page.dart';
import 'download_list_page.dart';



class HomePage extends StatefulWidget {
  String? selectedIndex;
  HomePage({Key? key, this.selectedIndex}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  String?  token="";

  gettoken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(await prefs.getString('token')!=null)
    token= (await prefs.getString('token'));
    setState(() {});
  }

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  final zoomDrawerController = ZoomDrawerController();


  @override
  void initState() {
    if(widget.selectedIndex!=null)
    _selectedIndex=int.parse( widget.selectedIndex.toString());
    setState(() {
    });
    gettoken();
  }

  @override
  Widget build(BuildContext context) {

    return
      WillPopScope(
        onWillPop: () async {
      final isFirstRouteInCurrentTab = !await _navigatorKeys[_selectedIndex].currentState!.maybePop();
      return isFirstRouteInCurrentTab;
    },
    child:  Scaffold(body:
    ZoomDrawer(
      controller: zoomDrawerController,
      style: DrawerStyle.defaultStyle,
      menuScreen:
      SideBarWidget(),
      mainScreen:  Scaffold(
        backgroundColor: Colors.white,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 65,margin: EdgeInsets.only(top: 10,bottom: 10,right: 35,left: 5),
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
                _selectedIndex=0;
                setState(() {
                });

              },child: Image.asset('assets/images/menu_home.png',height: 30,
                color:_selectedIndex==0 ? Colors.red.shade800 : Colors.grey.shade800,),)
              ),

              Expanded(child:
              InkWell(onTap: (){

                // _selectedIndex=1;
                // setState(() {
                // });

                _launchapp('https://www.instagram.com/simonscatofficial/');
              },child: Image.asset('assets/images/menu_instagram.png',height: 30,
                color:_selectedIndex==1 ? Colors.red.shade800 : Colors.grey.shade800,),)
              ),

              Expanded(child:
              InkWell(onTap: (){

                // _selectedIndex=2;
                // setState(() {
                // });
                _launchapp('https://wa.me/?text=hi');
              },child: Image.asset('assets/images/menu_whatsapp.png',height: 30,
                color:_selectedIndex==2 ? Colors.red.shade800 : Colors.grey.shade800,),)
              ),

              Expanded(child:
              InkWell(onTap: (){

                _selectedIndex=3;
                setState(() {
                });
              },child: Image.asset('assets/images/menu_download.png',height: 30,
                color:_selectedIndex==3 ? Colors.red.shade800 : Colors.grey.shade800,),)
              ),

              Expanded(child:
              InkWell(onTap: (){

                _selectedIndex=4;
                setState(() {
                });
              },child: Image.asset('assets/images/menu_user.png',height: 30,
                color:_selectedIndex==4 ? Colors.red.shade800 : Colors.grey.shade800,),)
              ),
            ],)
              ,
            )
            ,

          ],),
        body:
        Column(children: [
          AppBarWidget(onMenuClicked: (){
            print('dd');
            zoomDrawerController.toggle!();
            zoomDrawerController.stateNotifier;
          //}, logined: _selectedIndex==4 ? true : false,),
          }, logined: token==null||token=="" ? false : true,),
          Expanded(child:  IndexedStack(
            children: [
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
              _buildOffstageNavigator(3),
              _buildOffstageNavigator(4),
              _buildOffstageNavigator(5),
              _buildOffstageNavigator(6),
              _buildOffstageNavigator(7)
            ],index: _selectedIndex,
          ) )
        ],)
        ,
      ),
      borderRadius: 24.0,
      showShadow: true,isRtl: true,
      angle: -12.0,
      drawerShadowsBackgroundColor: Colors.grey,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
    )
      ,))

      ;
  }
  // https://www.instagram.com/<INSTAGRAM_PROFILE>/
  // https://wa.me/?text=hi
  _launchapp( url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  Widget _buildOffstageNavigator(int index) {

    return Offstage(
      offstage: false,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) {
              return [
                MainPage(),
                Container(),
                Container(),
                DownloadListPage(),
               Profile(),
                MyCourses(),
                RecentOrderPage(),CheckoutPage()
              ].elementAt(index);
            },
          );
        },
      ),
    );
  }
}
