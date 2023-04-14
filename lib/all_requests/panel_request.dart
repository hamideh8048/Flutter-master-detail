
import 'package:flutter/material.dart';
import 'package:turbo_english/models/request_model.dart';

import '_base_request.dart';


class PanelRequest{

  BuildContext rootContext;
  PanelRequest({required this.rootContext});



  Future<RequestModel>  wallet_info_get(
      {
        required  String page,
      }){
    return BaseRequest(rootContext: rootContext ,requestType: RequestType.postWithAuth, requestWord: 'api/v1/wallet-info-get?'  ,body: {

      "page" : page  ,
    } ).sendRequest();
  }



  Future<RequestModel>  course_view(
      {
        required  String course_id,
        required  String lesson_id,
      }){
    return BaseRequest(rootContext: rootContext ,requestType: RequestType.postWithAuth, requestWord: 'api/v1/panel/course-view?'  ,body: {

      "course_id" : course_id  ,
      "lesson_id" : lesson_id  ,
    } ).sendRequest();
  }

  Future<RequestModel>  dashboard_get(
      {
        required  String page,
      }){
    return BaseRequest(rootContext: rootContext ,requestType: RequestType.postWithAuth, requestWord: 'api/v1/dashboard-get?'  ,body: {

      "page" : page  ,
    } ).sendRequest();
  }
  Future<RequestModel>  getMyCourse(
      {
        required  String page,
      }){
    return BaseRequest(rootContext: rootContext ,requestType: RequestType.post, requestWord: 'api/v1/course-view?'  ,body: {

      "page" : page  ,
    } ).sendRequest();
  }
}