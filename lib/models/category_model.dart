import 'package:flutter/material.dart';

class CategoryModel{
String  id_cat;
String  title_cat;
String  description_cat;
String  total_all_bk;
String  pages_numb_bk;
String  limit_page_bk;

String  page_curent_numb_bk;
List  videos;


  CategoryModel({
    required     this. id_cat ,
    required   this. title_cat ,
    required   this. description_cat ,
    required   this. total_all_bk ,
    required   this. pages_numb_bk ,
    required   this. limit_page_bk ,
    required   this. videos ,
    required   this. page_curent_numb_bk ,
  });
}