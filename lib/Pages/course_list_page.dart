import 'package:flutter/material.dart';
import '../component/appbar/turbo_appbar.dart';
import '../component/textbutton_widget.dart' ;

import '../component/colors.dart';

class CourseList extends StatelessWidget {
  const CourseList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FAFC),
      body:Column(children: [
        itemCourseWidget(context)
       // TurboAppbar(label: 'تسویه حساب',),

      ],),
    );
  }
}

// itemCourseWidget start
Widget itemCourseWidget(BuildContext context) {
  return Ink(
    color: Colors.white,
    child: InkWell(
      borderRadius: BorderRadius.circular(10),
      radius: 10,
      onTap: () {},
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('SvgAndPngAssets.pic4'),
                  fit: BoxFit.fill,
                ),
              ),
              height: MediaQuery.of(context).size.height / 7,
              width: MediaQuery.of(context).size.width / 6.5,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 40,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'مکالمه با توربوتاک ترم 1 – استاد قلی زاده(Turbotalk1)',
                    style: TextStyle(
                        color: Color(0xff475569),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        '۲۵۰٬۰۰۰ هزار تومان',
                        style:
                            TextStyle(color: Color(0xff475569), fontSize: 14),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 16,
                      ),
                      Text(
                        '۲۵۰٬۰۰۰ هزار تومان',
                        style: TextStyle(
                            color: Color(0xffEF4444),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
// itemCourseWidget end

// sizedBoxWidget start
Widget sizedBoxWidget(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height / 30,
  );
}
// sizedBoxWidget end

// orderDetails start
Widget orderDetailsWidget() {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'جزئیات سفارش',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'کد تخفیف: ۵۰ هزار',
                  style: TextStyle(color: Color(0xff475569), fontSize: 14),
                ),
                Text(
                  ' کیف پول: ۲۰ هزار',
                  style: TextStyle(color: Color(0xff475569), fontSize: 14),
                ),
                Text(
                  'مجموع کل: ۱۱۰ هزار',
                  style: TextStyle(color: Color(0xff475569), fontSize: 14),
                )
              ],
            ),
          )
        ],
      ));
}
// orderDetails end

// DiscountCode start
Widget discountCodeWidget(BuildContext context) {
  return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Image.asset('SvgAndPngAssets.discount_circle'),
              SizedBox(width: 10),
              Text(
                'آیا کد تخفیف دارید؟',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  obscureText: false,
                  textAlign: TextAlign.start,
                  showCursor: true,
                  decoration: InputDecoration(
                    filled: true,
// suffixIcon:  Icon(Icons.keyboard_arrow_down),
                    hintStyle: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff475569),
                    ),
                    hoverColor: Colors.grey.shade200,
                    fillColor: Color(0xffF8FAFC),
// border: const OutlineInputBorder(
//     borderSide: BorderSide(
//       color: Colors.red,
//       width: 1,
//     ),),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffF8FAFC),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Color(0xffF8FAFC),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'کد تخفیف را وارد کنید!',
                  ),
                ),
              ),
              SizedBox(
                width: 9,
              ),
              TextButtonWidget(txt: 'اعمال'  ,
                textColor:  const Color(0xffA21CAF),
                backColor: Color(0xffA21CAF), onTap: () {  },

              ),
            ],
          ),
        ],
      ));
}
// DiscountCode end

// RadioButton start
class radioButtonWidget extends StatefulWidget {
  @override
  State<radioButtonWidget> createState() => _radioButtonWidgetState();
}

class _radioButtonWidgetState extends State<radioButtonWidget> {
  List<String> lst = [
    ' کیف پول',
    'درگاه پرداخت ملت',
    'پرداخت با تمامی کارت های عضو شتاب'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ),
            customRadio(lst[0], 0),
            customRadio(lst[1], 1),
            customRadio(lst[2], 2),
          ],
        ),
      ],
    );
  }

  void changeIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  Widget customRadio(String txt, int index) {
    return Container(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
          onPressed: () => changeIndex(index),
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            side: BorderSide(
                width: 1.0,
                color:
                    selectedIndex == index ? Color(0xff475569) : Colors.white),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 13,
                  backgroundColor:
                      selectedIndex == index ? Colors.white : Color(0xff475569),
                  child: CircleAvatar(
                    backgroundColor: selectedIndex == index
                        ? Color(0xff475569)
                        : Colors.white,
                    radius: 11,
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Text(
                  txt,
                  style: TextStyle(color: Color(0xff475569)),
                )
              ],
            ),
          )),
    );
  }
}
