import 'package:flutter/material.dart';

class LessonGroupeModel{
  String? id;
  String  title_post;
  String  type_post;
  String  numb_sort;
  List<LessonGroupeModel>? child;


  LessonGroupeModel({
    required   this. title_post ,
    required   this. type_post ,
    required   this. numb_sort ,
     this.child,
    this.id

  });
}