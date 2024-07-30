import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//var
String link='http://sfedelivery.superweb.xyz';
String baseUrl='https://rsapi.goong.io';
String borderImgPath='assets/border.png';
String token='';
String googleMapAPIKey='AIzaSyBE-h2LGdsoEEtovbVZQySIH93O0djYxDY';
String goongKey='Ez48Sni1iU3wHIP9Wz58dpbCFD0X7Ze9ckTA7SyH';
String socketUrl='http://103.110.85.135:8899/';
Color gold= Color.fromRGBO(254, 212, 12, 1);
Color black= Color.fromRGBO(34, 34, 34, 1);
Color black1= Color.fromRGBO(40, 40, 40, 1);
Color grey= Color.fromRGBO(184, 184, 181, 1);
Color yellow= Color.fromRGBO(237, 242, 1, 1);
String backgroundImage='assets/bg.png';
String backgroundImage1='assets/bg1.png';
dynamic user;
dynamic pendingOrder;

//method
postData(url,body) async{
  final res=await http.post(
      Uri.parse(url),
      headers: {
        'Authorization':'Bearer $token'
      },
      body: body
  ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
  dynamic data=jsonDecode(res.body);
  return data;
}

getData(url) async{
  final res=await http.get(
    Uri.parse(url),
    headers: {
      'Authorization':'Bearer $token'
    },
  ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
  dynamic data=jsonDecode(res.body);
  return data;
}

showSuccess(message){
  BotToast.showText(
      text: message.toString(),
      contentColor: Colors.green,
      align: const Alignment(0, -0),
      contentPadding: const EdgeInsets.all(10),
      textStyle: const TextStyle(fontSize: 20, color: Colors.white),
      clickClose: true
  );
}

showError(message){
  BotToast.showText(
      text: message.toString(),
      contentColor: Colors.red,
      align: const Alignment(0, -0),
      contentPadding: const EdgeInsets.all(10),
      textStyle: const TextStyle(fontSize: 20, color: Colors.white),
      clickClose: true
  );
}

showLoading(){
  BotToast.showLoading();
}

hideLoading(){
  BotToast.closeAllLoading();
}