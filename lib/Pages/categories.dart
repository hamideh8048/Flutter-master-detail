import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:turbo_english/models/category_model.dart';
import '../all_requests/pages_front_request.dart';
import '../component/appbar_widget.dart';
import '../component/category_widget.dart';
import '../component/image_network_widget.dart';


class Categories extends StatefulWidget {
  bool hasPrice;
    Categories({Key? key,this.hasPrice=false}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  List<CategoryModel>  categories=[];
  @override
  void initState() {
    PagesFrontRequest(rootContext: context).getCourseCategory(post_id: '3864', page_number: '1').then((value) {

      List   data=value.data['data'];
      List   courses=value.data['courses'];
      for(int i=0; i<courses.length ; i++){
        categories.add( CategoryModel(id_cat:  courses[i]['id_cat'].toString()
            , title_cat:  courses[i]['title_cat'].toString(), description_cat:  courses[i]['description_cat'].toString(),
            total_all_bk:  courses[i]['total_all_bk'].toString(), pages_numb_bk:  courses[i]['pages_numb_bk'].toString(),
            limit_page_bk:  courses[i]['limit_page_bk'].toString(), videos:  courses[i]['videos'] ,
            page_curent_numb_bk:  courses[i]['page_curent_numb_bk'].toString()) ) ;
      }
      setState(() {
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF8FAFC),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppBarWidget(onMenuClicked: (){

          }, logined: false,),
          Expanded(child:
          SingleChildScrollView(child:
          Column(children: [
            Container(
              margin: EdgeInsets.all(5),
              child:
              CategoryWidget(src: 'https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/06/Computer_programmer.jpeg.jpg',
                label: ''
                    'آموزشگاه اینترنتی و کلاس های آنلاین انگلیش توربو\n'
                    'دسته بندى كلاسهاى آنلاين عمومى'
                    ' ',),
            ),
            Container(height: 10,),
            ImageNetworkWidget(src: "https://stream.englishturbo.com/s81coirkzfq6/thumbnail.jpg?size=640x360"
              ,height: 200,hasPlayIcon: true,),

            GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: categories.length,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Container(margin: EdgeInsets.all(10),child:
                CategoryWidget(src: 'https://thumbor.forbes.com/thumbor/fit-in/900x510/https://www.forbes.com/advisor/wp-content/uploads/2022/06/Computer_programmer.jpeg.jpg',
                  label: 'کلاس های عمومی مکالمه به سبک توربو\n Family And Friends',)
                  ,);
              },

            )
          ],)
            ,)
          )





      ],),
    );
  }
}
