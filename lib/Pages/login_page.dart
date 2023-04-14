import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:turbo_english/Pages/verification_page.dart';
//import 'package:turbo_english/models
import 'package:turbo_english/all_requests/login_reg_request.dart';
import 'package:turbo_english/all_requests/panel_request.dart';
import 'package:turbo_english/models/register_model.dart';
import '../component/widget/button.dart';

import '../component/text.dart';
import '../component/text_field.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;
  bool isLogin=true;
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<bool> _onWillPop() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {

    return new WillPopScope(
        onWillPop: _onWillPop,child:
      Scaffold(
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
                  height: MediaQuery.of(context).size.height * 0.07,
                ),
                Image.asset(
                  'assets/images/logoturbo.png',
                 height: 65,width: 212,
                  // height:MediaQuery.of(context).size.width*0.37,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Button(
                        linearGradient: false,
                        widthMul: false, 
                        border: isLogin? false : true ,
                        backgroundColor:  isLogin? true : false,
                        textColor:  isLogin? false : true,
                        iconColor:  isLogin? false : true,
                        btnText: logintext,
                        onTap: () {
                          isLogin=true;
                          setState(() {
                          });
                        },
                        iconButton: 'assets/images/signupicon.png'),
                    const SizedBox(
                      width: 23,
                    ),
                    Button(
                        linearGradient: false,
                        widthMul: false,
                        border: isLogin? true : false ,
                        backgroundColor:  isLogin? false : true,
                        textColor:  isLogin? true : false,
                        iconColor:  isLogin? true : false,
                        onTap: () {
                          isLogin=false;
                          setState(() {
                          });
                        },
                        btnText: signUp,
                        iconButton: 'assets/images/key-square.png'),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.06,
                ),
                  Text(
                  isLogin ?  loginTitle : 'عضویت در سایت',
                  style: TextStyle(
                    fontSize: 30,
                    color: Color(0xff475569),fontWeight: FontWeight.bold
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                !isLogin ?   TextFieldWidget(
                  controller: nameController,
                    hintText: name,
                    onChanged: () {},
                    showPassword: false,
                    keyType: true):Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                !isLogin ? TextFieldWidget(
                  controller: lastnameController,
                    hintText: family,
                    onChanged: () {},
                    showPassword: false,
                    keyType: true):Container(),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextFieldWidget(
                    hintText: phoneNumber,
                    controller: phoneController,
                    onChanged: () {},
                    showPassword: false,
                    keyType: true),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                TextFieldWidget(
                    hintText: password,
                    controller: passwordController,
                    onChanged: () {},
                    showPassword: true,
                    keyType: false),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                isLogin ? Column(children: [

                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24.0,
                        width: 24.0,
                        child:  Checkbox(
                          activeColor: Color(0xff334155),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.0),
                          ),
                          // Circle Checkbox
                          checkColor: Colors.white,
                          value: isChecked,
                          onChanged: (bool? value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      )
                      ,
                      Container(width: 5,),
                      Text(
                        'رمز عبورم را به خاطر داشته باش!',
                        style: TextStyle(fontSize: 15, color: Color(0xff334155)),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'آیا رمز خود را فراموش کرده اید؟',
                            style: TextStyle(fontSize: 15, color: Color(0xff334155)),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],) : Container(),

                Button(
                  shadow: true,
                  linearGradient: true,
                  firstColor: Color(0xffDC2626),
                  secondColor: Color(0xffEF4444),
                  widthMul: true,
                  border: false,
                  backgroundColor: true,
                  textColor: false,
                  btnText:    isLogin ? 'ورود کاربری' : signUpTitle,
                  onTap: () {
                    if(isLogin)
                    LoginRegRequest(rootContext: context).req_login2(phone_mobile_login:phoneController.text, password_login: passwordController.text).then((value) async {
                      {
                        if (value.data['data'] != null && value
                            .data['status'] == "success") {
                          String token = value.data['data'];
                          SharedPreferences prefs = await SharedPreferences
                              .getInstance();
                          await prefs.setString('token', token);
                          PanelRequest(rootContext: context).dashboard_get(page: "1").then((
                              value) async {
                            if (value.data['status'] == "success") {
                              String total_cource_order = value.data['data']['total_cource_order']
                                  .toString();
                              String total_class_order = value.data['data']['total_class_order']
                                  .toString();
                            String  first_name = value.data['data']['first_name'].toString();
                              String  last_name = value.data['data']['last_name'].toString();
                              String  wallet_inventory =
                                  value.data['data']['wallet_inventory'].toString();
                              await prefs.setString('first_name', first_name);
                              await prefs.setString('last_name', last_name);
                              await prefs.setString('wallet_inventory', wallet_inventory);
                              await prefs.setString('total_cource_order', total_cource_order);
                              await prefs.setString('total_class_order', total_class_order);
                              setState(() {});
                            }
                          });
                          await Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) =>
                                  HomePage(
                                  )));
                        }
                      }


                      setState(() {
                      });
                    });
                    else
                      {
                        LoginRegRequest(rootContext: context).req_login(first_name:nameController.text, last_name: lastnameController.text, phone_mobile: phoneController.text, password: passwordController.text).then((value) async {
                          {
                            if (value.data['data'] != null && value
                                .data['status'] == "success") {
                              await Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      VerificationPage(registerModel: RegisterModel(firstName:nameController.text,lastName: lastnameController.text,phoneNumber:  phoneController.text,password: passwordController.text),
                                      )));
                            }
                          }
                          setState(() {
                          });
                        });
                      }
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
    ));
  }
}
