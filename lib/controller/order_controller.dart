import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliveryshipper/class/global.dart' as global;
class OrderController extends GetxController{

  getOrder(status,type) async{
    final res=await http.get(
      Uri.parse(global.link+'/api/customer/order/list?status='+status.toString()+'&type='+type),
      headers: {
        'Authorization':'Bearer '+global.token
      },
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }

  getDetail(id) async{
    dynamic data=await global.getData('${global.link}/api/customer/order/detail/$id');
    return data;
  }

  getCurrentOrder() async{
    dynamic data=await global.getData('${global.link}/api/customer/order/current-order');
    return data;
  }

  postCreateOrderCall(car_type,address_from, lat_from, long_from, address_to, lat_to, long_to,distance,total) async{
    dynamic body={
      "car_type":car_type.toString(),
      "address_from":address_from.toString(),
      "lat_from":lat_from.toString(),
      "long_from":long_from.toString(),
      "address_to":address_to.toString(),
      "lat_to":lat_to.toString(),
      "long_to":long_to.toString(),
      "distance":distance.toString(),
      "total":total.toString(),
    };
    dynamic data=await global.postData('${global.link}/api/customer/order/create-order-call-driver', body);
    return data;
  }
  postCalculateFee(car_type, latFrom, longFrom, latTo, longTo) async{
    dynamic body={
      "car_type":car_type.toString(),
      "from": '$latFrom,$longFrom',
      "to": '$latTo,$longTo',
    };
    final res=await http.post(
        Uri.parse(global.link+'/api/customer/order/calculate-fee'),
        headers: {
          'Authorization':'Bearer '+global.token
        },
        body: body
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
  postCancelOrder(id) async{
    final res=await http.post(
        Uri.parse(global.link+'/api/customer/order/cancel-order/'+id.toString()),
        headers: {
          'Authorization':'Bearer '+global.token
        },

    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    return data;
  }
}