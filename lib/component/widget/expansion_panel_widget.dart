import 'package:flutter/material.dart';


Widget containerListExpansionWidget(String title, String Desc,Image svgpic) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xffE5E5E5), width: 1)),
      child: InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(20),
          radius: 20,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: const EdgeInsets.only(right: 12, bottom: 20, top: 20),
                child: Text(title,
                    style: const TextStyle(
                        color: Color(0xff475569), fontSize: 16))),
            Image.asset('SvgAndPngAssets.Vector'),
            Padding(
                padding: const EdgeInsets.only(left: 12, bottom: 20, top: 20),
                child: Text(Desc,
                    style: const TextStyle(
                        color: Color(0xff475569), fontSize: 13))),
            Padding(
              padding:  EdgeInsets.only(left: 12, bottom: 20, top: 20),
              child:
              svgpic
            )
          ])));
}

//------------------------------------------
Widget ContainerInExpansionWidget(String number, String Desc, String clock,
    bool dis) {
  return Ink(
    decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          const Color(0xffE5E5E5).withOpacity(0.25),
          const Color(0xffF8F8F8)
        ]),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xffE5E5E5), width: 1)),
    child: InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(20),
      radius: 20,
      child: Padding(
          padding:
              const EdgeInsets.only(right: 22, bottom: 10, top: 10, left: 22),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
                height: 30,
                width: 30,
                decoration: dis==false? BoxDecoration(
                    color: const Color(0xff10B981),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xff10B981).withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset:
                              const Offset(0, 3) // changes position of shadow
                          )
                    ]):
                BoxDecoration(
                    color: const Color(0xffEF4444).withOpacity(0.35),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: const  Color(0xffEF4444).withOpacity(0.25),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset:
                          const Offset(0, 3) // changes position of shadow
                      )
                    ]),
                child: Center(
                    child:  dis==false? Text(number,
                        style: const TextStyle(
                            color: Colors.white, fontSize: 20)):
                    Image.asset('SvgAndPngAssets.ghofl')
                )),
            Text(Desc,
                style: const TextStyle(color: Color(0xff475569), fontSize: 15)),
            Row(children: [
              Image.asset('SvgAndPngAssets.Clock', height: 20, width: 20),
              const SizedBox(width: 3),
              Text('$clockساعت',
                  style:
                      const TextStyle(color: Color(0xff949494), fontSize: 15))
            ]),
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    gradient:  dis==false? LinearGradient(
                        colors: [
                          Color(0xffEF4444),
                          Color(0xffDC2626)]):
                    LinearGradient(
                        colors: [
                          Color(0xffEF4444).withOpacity(0.25),
                          Color(0xffDC2626).withOpacity(0.25),])
                    ,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                          color: const Color(0xffEF4444).withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 8,
                          offset:
                              const Offset(0, 3) // changes position of shadow
                          )
                    ]),
                child: Center(
                  child: Image.asset('SvgAndPngAssets.play',
                      height: 25, width: 25),
                ))
          ])),
    ),
  );
}
