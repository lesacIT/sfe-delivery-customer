import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:deliveryshipper/class/global.dart' as global;


class MapController extends GetxController{
  getAddressFromLatLng(lat,long) async{
    final res=await http.get(
      // Uri.parse('https://rsapi.goong.io/Geocode?latlng=$lat,$long&api_key=${global.goongKey}'),
      Uri.parse(global.baseUrl+'/Geocode?latlng=$lat,$long&api_key=${global.goongKey}'),
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    String result='';
    if(data['results']!=null){
      if(data['results'].length>0){
        result=data['results'][0]['formatted_address'];
      }
    }
    return result;
  }

  getLatLngFromAddress(address) async{
    final res=await http.get(
      Uri.parse(global.baseUrl+'/Geocode?address=$address&api_key=${global.goongKey}'),
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    dynamic result;
    if(data['status']=='OK'){
      if(data['results']!=null){
        if(data['results'].length>0){
          result=data['results'][0]['geometry']['location'];
        }
      }
    }
    return result;
  }

  searchAddress(keySearch) async{
    List list=[];
    final res=await http.get(
      Uri.parse(global.baseUrl+'/Place/AutoComplete?input=$keySearch&api_key=${global.goongKey}'),
    ).timeout(const Duration(seconds: 15), onTimeout: (){ return http.Response('{"Errors":408,"MessageErrors":"Timeout"}',408); });
    dynamic data=jsonDecode(res.body);
    if(data['status']=='OK'){
      if(data['predictions']!=null){
        list=data['predictions'];
      }
    }
    return list;
  }
}