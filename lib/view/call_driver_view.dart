import 'dart:async';
import 'package:deliveryshipper/controller/map_controller.dart';
import 'package:deliveryshipper/controller/order_controller.dart';
import 'package:deliveryshipper/view/create_order_success_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliveryshipper/class/global.dart' as global;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:maps_toolkit/maps_toolkit.dart' as map;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CallDriverView extends StatefulWidget {
  int car_type;
  CallDriverView({super.key, required this.car_type});

  @override
  State<CallDriverView> createState() => _CallDriverViewState(car_type);
}

class _CallDriverViewState extends State<CallDriverView> {
  int car_type;
  _CallDriverViewState(this.car_type);

  //var
  MapController mapController=Get.find();
  Location location = Location();
  LatLng? myLocation;
  LatLng? targetLocation;
  double mainBearing=0;
  bool setTarget=false;
  TextEditingController myLocationController=TextEditingController();
  TextEditingController targetLocationController=TextEditingController();
  TextEditingController searchAddressController=TextEditingController();
  late IO.Socket socket;
  var locationListen;
  List<LatLng> polyline=[];
  List resultSearch=[];
  final Completer<GoogleMapController> ggMapController = Completer<GoogleMapController>();

  OrderController orderController=Get.find();
  var numberFormat=NumberFormat('#,###','en_US');

  //method
  @override
  void initState() {
    super.initState();
    connectSocket();
    getMyLocation();
    getData();
  }

  @override
  void dispose() {
    locationListen?.cancel();
    socket.disconnect();
    super.dispose();
  }

  getData(){
    var path=map.PolygonUtil.decode('{ch|@ihndSnAd@x@Xp@Tn@Tr@Tp@V|Bv@t@Zz@|@|@|@');
    for(dynamic item in path) {
      polyline.add(LatLng(item.latitude, item.longitude));
    }
    setState(() {

    });
  }

  connectSocket() async{
    socket = IO.io(global.socketUrl, IO.OptionBuilder().setTransports(['websocket']).enableForceNew().build());
    socket.onConnect((_) {
      
    });
    socket.onDisconnect((_){});
  }

  confirmOrder() async{
    if(targetLocationController.text.isEmpty){
      global.showError('Vui lòng nhập địa chỉ điểm đến');
    }
    else{
      global.showLoading();
      dynamic data = await orderController.postCalculateFee(car_type, myLocation?.latitude, myLocation?.longitude, targetLocation?.latitude, targetLocation?.longitude);
      global.hideLoading();
      if (data['error'] == true) {
        global.showError(data['message']);
      }
      else {
        double distance=double.parse(data['data']['distance'].toString());
        int fee= data['data']['fee'];
        if(!mounted) return;
        showModalBottomSheet(
            backgroundColor: global.black,
            context: context,
            builder: (context){
              return Container(
                // height: 400,
                decoration: BoxDecoration(
                    color: global.black
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
                      child: Text('Bạn có đồng ý chọn vị trí này không', style: TextStyle(fontSize: 16, color: global.gold, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 5),
                      child: Text('Vị trí của bạn', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                      child: Text(myLocationController.text, style: TextStyle(color: global.grey, fontSize: 16),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                      child: Text('Điểm đến', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 0, 10, 5),
                      child: Text(targetLocationController.text, style: TextStyle(color: global.grey, fontSize: 16),),
                    ),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Khoảng cách', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                                Text('Chi phí', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(distance.toString()+' '+'Km', style: TextStyle(color: global.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                                Text(numberFormat.format(fee), style: TextStyle(color: global.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                              ],
                            )
                          ],
                        )
                    ),
                    Expanded(child: Container()),
                    InkWell(
                      onTap: (){
                        createOrderCall(distance,fee);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: global.gold,
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(30),
                            color: global.gold
                        ),
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Gọi tài xế',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 16),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              );
            }
        );
      }
    }
  }

  createOrderCall(distance,fee) async {
    global.showLoading();
    dynamic data = await orderController.postCreateOrderCall(car_type, myLocationController.text, myLocation?.latitude, myLocation?.longitude, targetLocationController.text, targetLocation?.latitude, targetLocation?.longitude, distance,fee);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    }
    else {
      global.showSuccess(data['message']);
      dynamic order=data['data']['order'];
      Get.back();
      global.pendingOrder=order;
      if(data['data']['list_driver'].length>0){
        List listDriver=data['data']['list_driver'];
        List itemRemain=[];
        String driverId=listDriver[0];
        if(listDriver.length>1){
          for(int i=1;i<listDriver.length;i++){
            itemRemain.add(listDriver[i]);
          }
        }
        socket.emit('notifyOrder',{'list_id':itemRemain,'driver_id':driverId,'order_id':order['id']});
      }
      else{
        socket.emit('noDriver',{'order_id':order['id']});
      }
      Get.to(()=>CreateOrderSuccessView(order: order,));
    }
  }

  Future<void> getMyLocation() async{
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (_serviceEnabled) {
      _serviceEnabled = await location.requestService();
    }
    else{
      return;
    }
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationListen=location.onLocationChanged.listen((LocationData currentLocation) async{
      if(currentLocation.latitude!=null && currentLocation.longitude!=null){
        if(currentLocation.latitude! != myLocation?.latitude || currentLocation.longitude! != myLocation?.longitude){
          if(!setTarget){
            global.showLoading();
            myLocation=LatLng(currentLocation.latitude!, currentLocation.longitude!);
            mainBearing=currentLocation.heading!;
            String address=await mapController.getAddressFromLatLng(myLocation?.latitude, myLocation?.longitude);
            myLocationController.text=address;
            targetLocation=myLocation;
            setTarget=true;
            global.hideLoading();
            if(mounted){
              setState(() {

              });
            }
          }
        }
      }
    });
  }

  getAddressFromLatLng(LatLng pos) async{
    global.showLoading();
    targetLocation=pos;
    String address=await mapController.getAddressFromLatLng(pos.latitude, pos.longitude);
    targetLocationController.text=address;
    global.hideLoading();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text('Gọi tài xế',style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: InkWell(
          onTap: (){
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: global.gold,),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(global.backgroundImage1),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Text('Vị trí của bạn', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: TextField(
                controller: myLocationController,
                decoration: InputDecoration(
                  hintText: 'Đang lấy thông tin vị trí của bạn ...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: global.black1,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: global.black1
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10, 2, 2, 2)
                ),
                cursorColor: Colors.grey,
                style: TextStyle(color: global.grey),
                obscureText: false,
                readOnly: true,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 5),
              child: Text('Điểm đến', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
              child: TextField(
                controller: targetLocationController,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: global.black1,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: global.black1
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10, 2, 2, 2)
                ),
                cursorColor: Colors.grey,
                style: TextStyle(color: global.grey),
                readOnly: true,
                onTap: (){
                  showModalBottomSheet(
                    context: context,
                    backgroundColor: Colors.black,
                    builder: (context){
                      return StatefulBuilder(
                        builder: (context, StateSetter setStateIn){
                          return Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                  child: Text('Nhập địa chỉ của bạn', style: TextStyle(color: global.grey,fontSize: 16,fontWeight: FontWeight.bold),),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: searchAddressController,
                                          decoration: InputDecoration(
                                              filled: true,
                                              fillColor: global.black1,
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: global.black1
                                                ),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                    color: Colors.grey
                                                ),
                                                borderRadius: BorderRadius.circular(10),
                                              ),
                                              contentPadding: const EdgeInsets.fromLTRB(10, 2, 2, 2)
                                          ),
                                          cursorColor: Colors.grey,
                                          style: TextStyle(color: global.grey),
                                        ),
                                      ),
                                      InkWell(
                                          onTap: () async{
                                            resultSearch=await mapController.searchAddress(searchAddressController.text);
                                            FocusManager.instance.primaryFocus?.unfocus();
                                            setStateIn((){});
                                          },
                                          child: const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Icon(Icons.search, color: Colors.grey,size: 30,),
                                          )
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    children: List.generate(resultSearch.length, (index){
                                      return InkWell(
                                        onTap: () async{
                                          targetLocationController.text=resultSearch[index]['description'];
                                          dynamic location=await mapController.getLatLngFromAddress(targetLocationController.text);
                                          targetLocation=LatLng(double.parse(location['lat'].toString()), double.parse(location['lng'].toString()));
                                          Get.back();
                                          final GoogleMapController controller = await ggMapController.future;
                                          await controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
                                            target: targetLocation!,
                                            zoom: 16
                                          )));
                                          setState(() {

                                          });
                                        },
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            color: Colors.white.withOpacity(0.1),
                                          ),
                                          padding: const EdgeInsets.all(10),
                                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                                          child: Text(resultSearch[index]['description'], style: const TextStyle(color: Colors.grey, fontSize: 16),),
                                        ),
                                      );
                                    })
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  );
                },
              ),
            ),
            Expanded(
              child: Container(
                child: myLocation==null?Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(color: global.gold,),
                      Text('Đang tải bản đồ ...', style: TextStyle(color: global.gold, fontSize: 20),),
                    ],
                  ),
                ):GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: myLocation!,
                    zoom: 18,
                    bearing: mainBearing
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    ggMapController.complete(controller);
                  },
                  polylines: {
                    // Polyline(
                    //   polylineId: PolylineId("1"),
                    //   points: polyline,
                    //   color: global.gold
                    // )
                  },
                  markers: {
                    Marker(
                      markerId: const MarkerId("targetLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: targetLocation!,
                      draggable: true,
                      onDragEnd: (LatLng pos){
                          getAddressFromLatLng(pos);
                      }
                    ),
                    Marker(
                      markerId: const MarkerId("myLocation"),
                      icon: BitmapDescriptor.defaultMarker,
                      position: myLocation!
                    )
                  },
                  onTap: (LatLng pos){
                    getAddressFromLatLng(pos);
                  },
                ),
              ),
            ),
            InkWell(
              onTap: (){
                if(myLocation!=null){
                  confirmOrder();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: global.gold,
                ),
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Xem chi phí',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 16),),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
