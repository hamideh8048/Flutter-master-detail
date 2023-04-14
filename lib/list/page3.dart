
import 'package:flutter/material.dart';

import 'item.dart';

class page3 extends StatelessWidget {
  const page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: items_Modelitem.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.fromLTRB(11, 11, 11, 1),
                    elevation: 6,
                    shadowColor: Color(0xffE5E5E5),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xffF8FAFC),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Wrap(
                                  runSpacing: 10,
                                  children: [
                                    SizedBox(
                                      height: 115,
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            topLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                          child: items_Modelitem[index].image),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 12.0),
                                    child: Wrap(
                                      runSpacing: 10,
                                      children: [
                                        Text(
                                          items_Modelitem[index].title,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff475569)),
                                        ),
                                        Text(
                                          items_Modelitem[index].drscription,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Color(0xff334155)),
                                          maxLines: 3,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'هزار تومان' +
                                                  items_Modelitem[index].price,
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xffEF4444)),
                                            ),
                                            IconButton(
                                              splashRadius: 6,
                                              onPressed: () {
                                                // Navigator.of(context).push(MaterialPageRoute(
                                                //     builder: (context) => item(
                                                //         pages: items_Modelitem[index])));
                                              },
                                              icon: Icon(
                                                Icons.arrow_forward,
                                              ),
                                              color: Color(0xff475569),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                item(pages: items_Modelitem[index])));
                      },
                    ));
              }),
        ],
      ),
    );
  }
}
// Padding(
// padding: const EdgeInsets.fromLTRB(11, 11, 11, 1),
// child: Container(
// decoration: BoxDecoration(
// color: Color(0xffF8FAFC),
// borderRadius: BorderRadius.circular(20)),
// child: Row(
// children: [
// Expanded(
// flex: 1,
// child: Wrap(
// runSpacing: 10,
// children: [
// SizedBox(
// height: 110,
// child: ClipRRect(
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(0),
// topLeft: Radius.circular(0),
// bottomRight: Radius.circular(20),
// topRight: Radius.circular(20),
// ),
// child: Image.asset(
// fit: BoxFit.cover,
// SvgAndPngAssets.pic4,
// )),
// ),
// ],
// ),
// ),
// Expanded(
// flex: 3,
// child: Padding(
// padding: const EdgeInsets.only(top:12.0),
// child: Wrap(
// runSpacing: 10,
// children: [
// Text(
// 'هزار تومان',
// style: TextStyle(
// fontSize: 12,
// fontWeight: FontWeight.bold,
// color: Color(0xff475569)),
// ),
// Text(
// 'پرفروش ترين و كاربردي ترين دوره مكالمه زبان انگليسي. قيمت ترم ١ رو در پايين ترين حد ممكن گذاشتيم كه همه بتونن ورود كنند',
// style: TextStyle(
// fontSize: 10, color: Color(0xff334155)),
// maxLines: 3,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// Text(
// '۲۵۰٬۰۰۰ هزار تومان',
// style: TextStyle(
// fontSize: 14,
// fontWeight: FontWeight.bold,
// color: Color(0xffEF4444)),
// ),
// IconButton(
// splashRadius: 6,
// onPressed: () {},
// icon: Icon(
// Icons.arrow_forward,
// ),
// color: Color(0xff475569),
// )
// ],
// )
// ],
// ),
// ))
// ],
// )),
// )
