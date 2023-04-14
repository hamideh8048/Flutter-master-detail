import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_english/all_requests/login_reg_request.dart';
import 'package:turbo_english/models/register_model.dart';
import '../component/widget/button.dart';

import '../component/text.dart';
import '../component/text_field.dart';
import 'home_page.dart';

class ChangePassPage extends StatefulWidget {
  RegisterModel  registerModel;
  ChangePassPage({Key? key,required this.registerModel  }) : super(key: key);
  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  bool isChecked = false;
  bool isLogin=true;
  TextEditingController verificationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
                MediaQuery.of(context).size.width * 0.07,
                MediaQuery.of(context).size.height * 0.01,
                MediaQuery.of(context).size.width * 0.07,
                MediaQuery.of(context).size.height * 0.01),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Image.asset(
                  'assets/images/logoturbo.png',
                 height: 65,width: 212,
                  // height:MediaQuery.of(context).size.width*0.37,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),


                  Text(
                  ' رمز عبور جدید را وارد نمایید',
                  style: TextStyle(
                    fontSize: 18,
                    color: Color(0xff475569),fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                TextFieldWidget(
                    hintText: "Enter new password",
                    controller: verificationController,
                    onChanged: () {},
                    showPassword: true,
                    keyType: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),

                Button(
                  shadow: true,
                  linearGradient: true,
                  firstColor: Color(0xffDC2626),
                  secondColor: Color(0xffEF4444),
                  widthMul: true,
                  border: false,
                  backgroundColor: true,
                  textColor: false,
                  btnText:  "تغییر رمز" ,
                  onTap: () {
                    // if(isLogin)
                    // LoginRegRequest(rootContext: context).req_verification(first_name: widget.registerModel.firstName, last_name: widget.registerModel.lastName, phone_mobile: widget.registerModel.phoneNumber, password: widget.registerModel.password, verification_code: verificationController.text).then((value) async {
                    //   {
                    //     if (value.data['data'] != null && value
                    //         .data['status'] == "success") {
                    //       await Navigator.of(context).push(MaterialPageRoute(
                    //           builder: (_) =>
                    //               HomePage(
                    //               )));
                    //     }
                    //   }
                    //
                    //   setState(() {
                    //   });
                    // });

                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
