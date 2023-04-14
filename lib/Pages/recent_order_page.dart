import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_english/Pages/login_page.dart';
import 'package:turbo_english/all_requests/panel_request.dart';
import 'package:turbo_english/component/appbar_widget.dart';
import 'package:turbo_english/component/card_widget.dart';
import 'package:turbo_english/component/circular_slider_widget.dart';
import 'package:turbo_english/component/image_network_widget.dart';
import 'package:turbo_english/component/textbutton_widget.dart';
import 'package:turbo_english/models/transaction_model.dart';

import '../component/course_slider.dart';
import '../component/recent_transaction_widget.dart';
import '../component/text_widget.dart';
import '../component/widget/button.dart';

class RecentOrderPage extends StatefulWidget {
  const RecentOrderPage({Key? key}) : super(key: key);
  @override
  State<RecentOrderPage> createState() => _RecentOrderPageState();
}
class _RecentOrderPageState extends State<RecentOrderPage> {
  String total_tr="0";
  String wallet="0";
  List<TransactionModel>  transactionList=[];
  List transactions=[];
  String token="";
  TransactionModel? transactionModel;

  gettoken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(await prefs.getString('token')!=null){
    token= (await prefs.getString('token'))!;}
    if(  token!=null && token.length>2) {
      PanelRequest(rootContext: context).wallet_info_get(page: "1").then((value) async {
         if (value.data['status'] == "success") {
        transactions = value.data['data']['transaction_list'];
        total_tr = value.data['data']['total_tr'].toString();
        wallet = value.data['data']['wallet_inventory'].toString();
        for (int i = 0; i < transactions.length; i++) {
          transactionList.add(
              TransactionModel(date_fa: transactions[i]['date_fa'],
                  id_tr: transactions[i]['_id_tr'],
                  id_post: transactions[i]['id_post'],
                  price: transactions[i]['price']));
        }
        try {
          setState(() {});
        }
        catch(e)
        {}
      }
      });

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
    gettoken();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FAFC),
      body:
      Column(children: [

       // AppBarWidget(onMenuClicked: (){},  logined: token==null||token=="" ? false : true),
        Expanded(child:
       SingleChildScrollView(child:
        Container(padding: EdgeInsets.all(10),child:
        Column(children: [

          CardWidget(title: ' تراکنش های انجام شده', srcIcon: 'assets/images/wallet_2.png', subTitle: total_tr, buttonTitle: 'شارژ کیف پول',
            onTap: () {  },),

          CardWidget(title: ' کیف پول ', srcIcon: 'assets/images/wallet_2.png', subTitle: wallet, buttonTitle: 'افزایش موجودی کیف پول',
            onTap: () {  },),
Container(height: 20,),
          TextWidget(color: Colors.grey.shade800, fontSize: 14,
            label:  'تراکنش های اخیر',
            fontWeight: FontWeight.bold,textAlign: TextAlign.start,),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: transactionList.length,shrinkWrap: true,padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) {
                if(index%3==0){
                  return     RecentTransActionWidget(recieve: true, transactionModel: transactionList[index],);

                }else{

                  return     RecentTransActionWidget(recieve: false,transactionModel: transactionList[index]);
                }
              })


        ],)
          ,)
         ,)
        )
      ],)
     ,
    );
  }
}

Widget textbtn(String txt){
  return TextButton(
      onPressed: () {},
      child: Text(txt,
          style: TextStyle(
            color: Color(0xff475569),
            fontSize: 15,
          )));
}