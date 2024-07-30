import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliveryshipper/class/global.dart' as global;

class AuthController extends GetxController{
  //var


  //method
  postLogin(phone,password) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/customer/auth/login'),
        headers: {

        },
        body: {
          "phone":phone,
          "password":password
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postRegister(name, phone, password,confirmpassword) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/customer/auth/register'),
        headers: {

        },
        body: {
          "name": name,
          "phone": phone,
          "password": password,
          "confirmpassword": confirmpassword,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postChangePassword(old_password, new_password) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/customer/auth/change-password'),
        headers: {
          'Authorization': 'Bearer '+global.token
        },
        body: {
          "old_password": old_password,
          "new_password": new_password,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postUpdateinfo(name) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/customer/auth/update-info'),
        headers: {
          'Authorization': 'Bearer '+global.token
        },
        body: {
          "name": name,
        }
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
}