import 'package:flutter/material.dart';

class OrderModel{
String  id_order;
String  id_post;
String  status_pay;
String  price;
String  title_post;
String  summary_text;
String  image_src;
String  status_pay_text;

OrderModel({
    required   this. image_src ,
    required   this. title_post ,
    required   this. id_post ,
    required   this. price ,
   required   this.id_order,
    required   this. summary_text ,
    required   this. status_pay ,
    required   this. status_pay_text ,
  });
}