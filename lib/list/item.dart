import 'package:flutter/material.dart';



class item extends StatelessWidget {
  final Modelitem pages;

  const item({Key? key, required this.pages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffccc4da),
          title: Text(pages.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Image.asset(
                fit: BoxFit.cover,
                'SvgAndPngAssets.pic4',
              ),
              Text(pages.title),
              Text(pages.drscription),
            ],
          ),
        ));
  }
}

class Modelitem {
  final Image image;
  final String title;
  final String drscription;
  final String price;

  Modelitem({
    required this.image,
    required this.title,
    required this.drscription,
    required this.price,
  });
}

List<Modelitem> items_Modelitem = [
  Modelitem(
    image: Image.asset(
      fit: BoxFit.cover,
      'SvgAndPngAssets.pic4',
    ),
    drscription:
        'پرفروش ترين و كاربردي ترين دوره مكالمه زبان انگليسي. قيمت ترم ١ رو در پايين ترين حد ممكن گذاشتيم كه همه بتونن ورود كنند',
    price: '۲۵۰٬۰۰۰',
    title: 'مکالمه با توربوتاک ترم 1 – استاد قلی زاده(Turbotalk1)',
  ),
  Modelitem(
    image: Image.asset(
      fit: BoxFit.cover,
      'SvgAndPngAssets.pic4',
    ),
    drscription:
    'پرفروش ترين و كاربردي ترين دوره مكالمه زبان انگليسي. قيمت ترم ١ رو در پايين ترين حد ممكن گذاشتيم كه همه بتونن ورود كنند',
    price: '۲۵۰٬۰۰۰',
    title: 'مکالمه با توربوتاک ترم 1 – استاد قلی زاده(Turbotalk1)',
  ),
  Modelitem(
    image: Image.asset(
      fit: BoxFit.cover,
      'SvgAndPngAssets.pic4',
    ),
    drscription:
    'پرفروش ترين و كاربردي ترين دوره مكالمه زبان انگليسي. قيمت ترم ١ رو در پايين ترين حد ممكن گذاشتيم كه همه بتونن ورود كنند',
    price: '۲۵۰٬۰۰۰',
    title: 'مکالمه با توربوتاک ترم 1 – استاد قلی زاده(Turbotalk1)',
  ),
];

void _papSmearTap(BuildContext context) {
  //TODO: implement onFaceScanChange
  throw UnimplementedError();
}
