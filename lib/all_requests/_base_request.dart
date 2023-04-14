import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';


import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/login_page.dart';
import '../defines.dart';
import '../models/request_model.dart';
import '../models/upload_file_request_model.dart';

enum RequestType{
  get,
  post,
  patch,
  delete,
  uploadFile,
  stream,
  postWithAuth
}

typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);

class BaseRequest{

  var prefs;
  var token;
  var headers;
  RequestType? requestType;
  String  requestWord;
  Map? body;
  Map<String, String>  fields;
  List<UploadFileRequestModel> files;
  String requestTypeWord;
  BuildContext rootContext;
  Function  (double progress,Dio dio,Function startAgainUpload, CancelToken cancelToken)? onUploadProgress;
  BaseRequest( {required this.requestType ,required this.requestWord ,  this.body ,
    this.fields = const {} , this.files = const [] ,this.requestTypeWord = 'post'  ,required this.rootContext
    ,  this.onUploadProgress});

  Future<RequestModel> sendRequest( ) async{
    print('start send request');
    var client =  http.Client();
    prefs = await SharedPreferences.getInstance();

    token = await prefs.getString('token');
    print(token);

     dynamic data;
    int statusCode=500;
    String message='';
    headers = await  {'Accept':'application/json, text/plain, */* , charset=utf-8',   };

    String reqUrl=  defines().baseUrl + requestWord  ;
    if(token!= null){
      try{
        body!['token']= token;
      }catch(e){}
      reqUrl= defines().baseUrl + requestWord + '&token=' +token;
    }

    log('body : '+body.toString());
    log('reqUrl : '+Uri.parse( reqUrl ).toString());

    String progress;
    Dio dio = new Dio();
   late Response response;

    if(requestType == RequestType.get){
      await  client.get( Uri.parse( reqUrl )   ,headers: headers).then((response) async{
        client.close();

        log('response '+requestWord+': '+ response.body);
        data=json.decode(utf8.decode(response.bodyBytes));
        statusCode = response.statusCode;



      }).catchError((onError) {
        client.close();
        print("Error: $onError");
      });
    }else  if(requestType == RequestType.post){
      await  client.post(Uri.parse(defines().baseUrl + requestWord),  body:
     body

          ,headers: headers).then((response) async{
        client.close();
        statusCode = response.statusCode;
        // print('data :'+ statusCode.toString());
        log('response : '+ response.body);
        data=json.decode(utf8.decode(response.bodyBytes));

      }).catchError((onError) {
        client.close();
        print("Error: $onError");
      });

    }
    else  if(requestType == RequestType.postWithAuth){
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Authorization': "Bearer $token",
      };
      await  client.post(Uri.parse(defines().baseUrl + requestWord),  body:
      body
          ,headers: headers).then((response) async{
        client.close();
        statusCode = response.statusCode;
        // print('data :'+ statusCode.toString());
        log('response : '+ response.body);
        data=json.decode(utf8.decode(response.bodyBytes));

      }).catchError((onError) {
        client.close();
        print("Error: $onError");
      });

    }
    else  if(requestType == RequestType.stream){
      await  client.post(Uri.parse(defines().baseStreamUrl + requestWord),
          body:
          jsonEncode(body)
          //body
          // jsonEncode(<String, String>{
          //   "media_id": "spzrmqrhxtbg"
          // })
          ,headers: headers).then((response) async{
        client.close();
        statusCode = response.statusCode;
        // print('data :'+ statusCode.toString());
        log('response : '+ response.body);

        data=json.decode(utf8.decode(response.bodyBytes));

      }).catchError((onError) {
        client.close();
        print("Error: $onError");
      });

    }

    else  if(requestType == RequestType.delete){
      await  client.delete(Uri.parse(reqUrl),  body: body
          ,headers: headers).then((response) async{
        client.close();

        log('response : '+ response.body);
        data=json.decode(utf8.decode(response.bodyBytes));
        statusCode = response.statusCode;




      }).catchError((onError) {
        client.close();
        print("Error: $onError");
      });

    }else  if(requestType == RequestType.patch){
      await  client.patch(Uri.parse(reqUrl),  body: body
          ,headers: headers).then((response) async{
        client.close();
        log('response : '+ response.body);
        data=json.decode(utf8.decode(response.bodyBytes));
        statusCode = response.statusCode;



      }).catchError((onError) {
        client.close();
        print("Error: $onError");
      });

    }else{


      void  startAgainUpload() async{

        // String progress;
        // Dio dio = new Dio();
        // late Response response;
        //
        // FormData formdata = FormData.fromMap({
        //   "bill": await MultipartFile.fromFile(
        //       files[0].path,
        //       filename:   files[0].fileName
        //     //show only filename from path
        //   ),
        // });
        // response = await dio.post(defines().baseUrl +requestWord,
        //   data: formdata,
        //   onSendProgress: (int sent, int total) {
        //     double percentage = (sent/total*100);
        //     if(onUploadProgress !=null){
        //       onUploadProgress!(percentage,dio,startAgainUpload);
        //
        //     }
        //
        //   },);
        //
        // if(response.statusCode == 200){
        //   log('response : '+ response.data.toString());
        //   data= response.data ;
        //   statusCode = 200;
        //   //
        // }else{
        //   print("Error during connection to server.");
        // }
      }
      CancelToken cancelToken =CancelToken() ;
      FormData formdata = FormData.fromMap({
        "bill": await MultipartFile.fromFile(
            files[0].path,
            filename:   files[0].fileName
          //show only filename from path
        ),
      });
      response = await dio.post(defines().baseUrl +requestWord,
        data: formdata,cancelToken: cancelToken,
        onSendProgress: (int sent, int total ) {
          double percentage = (sent/total*100);
          if(onUploadProgress !=null){
            onUploadProgress!(percentage,dio,startAgainUpload, cancelToken);

          }

        },);

      if(response.statusCode == 200){
        log('response : '+ response.data.toString());
        data= response.data ;
        statusCode = 200;
        //
      }else{
        print("Error during connection to server.");
      }



    }
    print( 'statusCode : '+statusCode.toString());

    try{
      // print('reeeesss :'+data[0]['res'].toString());

      if(data[0]['res'].toString()=='-1'){
        prefs.clear();
        Navigator.pushAndRemoveUntil(
          rootContext,
          MaterialPageRoute(builder: (contextme) => LoginPage()),
              (Route<dynamic> route) => false,
        );
      }
    }catch(e){}


    return await RequestModel(data: data, statusCode: statusCode);
  }

}