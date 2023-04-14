import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:turbo_english/models/transaction_model.dart';
import '../component/image_network_widget.dart';
import '../component/text_widget.dart';

import '../component/colors.dart';

class RecentTransActionWidget extends StatefulWidget {
  bool hasPrice;
  bool recieve;
  final TransactionModel transactionModel;


  RecentTransActionWidget({Key? key,this.hasPrice=false,required this.recieve,required this.transactionModel }) : super(key: key);

  @override
  State<RecentTransActionWidget> createState() => _RecentTransActionWidgetState();
}

class _RecentTransActionWidgetState extends State<RecentTransActionWidget> {
  @override
  Widget build(BuildContext context) {
   Color color=  widget.recieve ?  Colors.red.shade800 : Colors.green.shade800;
    return
      Container(
        padding: EdgeInsets.all(10),margin: EdgeInsets.symmetric(vertical: 10),
        height: 50,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color:
      color.withOpacity(0.1)),
        child: Center(child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
          TextWidget(color: color, fontSize: 11,
            label:  'کد پرداخت :'+widget.transactionModel.id_tr,
            fontWeight: FontWeight.bold,textAlign: TextAlign.start,),

          TextWidget(color: color, fontSize: 11,
            label:   ' تاریخ : '+widget.transactionModel.date_fa.replaceAll('ساعت', ''),
            fontWeight: FontWeight.bold,textAlign: TextAlign.start,),

          TextWidget(color: color, fontSize: 11,
            label:  ' تومان'+ widget.transactionModel.price,
            fontWeight: FontWeight.bold,textAlign: TextAlign.start,),

        ],),),
      );
  }
}
