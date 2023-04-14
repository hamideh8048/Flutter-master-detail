import 'package:flutter/material.dart';
import 'package:turbo_english/models/lessonGroupe_model.dart';

class LessonModel{
  String?  course_id;
String  title_post;
String  type_post;
String  numb_sort;
String?  description;
List<LessonGroupeModel> childs_grupe;

LessonModel({
    required   this. title_post ,
    required   this. type_post ,
    required   this. numb_sort ,
required this.childs_grupe,this.course_id,this.description
  });
}