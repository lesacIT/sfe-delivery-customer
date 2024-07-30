import 'dart:convert';

import 'package:deliveryshipper/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart' as global;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:url_launcher/url_launcher.dart';

class InfoView extends StatefulWidget {
  const InfoView({super.key});

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> {
  //var
  OrderController orderController=Get.find();
  dynamic order;
  BitmapDescriptor? customDriverIcon;
  LatLng? driverLocation;
  late IO.Socket socket;
  //method
  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(const ImageConfiguration(),
        'assets/driver_location.png')
        .then((d) {
      customDriverIcon = d;
    });
    connectSocket();
    getData();
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  connectSocket() async{
    socket = IO.io(global.socketUrl, IO.OptionBuilder().setTransports(['websocket']).enableForceNew().build());
    socket.onConnect((_) {

    });
    socket.on('getDriverLocation', (data) async{
      dynamic resp=jsonDecode(data);
      driverLocation=LatLng(double.parse(resp['lat'].toString()), double.parse(resp['long'].toString()));
      setState(() {

      });
    });
    socket.on('getStatusOrder', (data) async{
      dynamic resp=jsonDecode(data);
      if(resp['order']==order['id']){
        if(resp['status']=='accept'){
          getData();
        }
      }
    });
    socket.onDisconnect((_){

    });
  }

  getData() async{
    global.showLoading();
    order=null;
    dynamic data=await orderController.getCurrentOrder();
    global.hideLoading();
    if(data['error']){

    }
    else{
      order=data['data'];
      socket.emit('joinOrder',{'order_id':order['id']});
    }
    setState(() {

    });
  }

  cancelOrder() async {
    global.showLoading();
    dynamic data = await orderController.postCancelOrder(order['id']);
    global.hideLoading();
    if (data['error']) {
      global.showError(data['message']);
    }
    else {
      global.showSuccess(data['message']);
      getData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text('Thông tin',style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body:Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(global.backgroundImage1),
                fit: BoxFit.fill
            )
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 20,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(global.borderImgPath),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Expanded(
              child: order!=null?(order['status']=='waiting_driver'?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Chúng tôi đang tìm tài xế cho bạn', style: TextStyle(fontSize: 20, color: global.grey, fontWeight: FontWeight.bold),),
                  InkWell(
                    onTap: (){
                      cancelOrder();
                    },
                    child: Container(
                      width: 150,
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
                          Text('Huỷ dơn',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 16),),
                        ],
                      ),
                    ),
                  ),
                ]
              ):
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                            target: LatLng(order['lat_from'],order['long_from']),
                            zoom: 14
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('me'),
                            position: LatLng(order['lat_from'],order['long_from']),
                          ),
                          if(driverLocation!=null)
                            Marker(
                                markerId: const MarkerId('driver'),
                                position: driverLocation!,
                                icon: customDriverIcon!
                            )
                        },
                      )
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(global.backgroundImage),
                            fit: BoxFit.fill
                        )
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: Image.network('${global.link}/${order['driver']['anh_chan_dung']}', fit: BoxFit.fill,)
                          //Image.network(global.user['anh_chan_dung'],fit: BoxFit.fill),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(order['driver']['name'],style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                                      Text(order['driver']['hang_xe'], style: TextStyle(color: global.gold,fontWeight: FontWeight.bold,fontSize: 16),),
                                      Text(order['driver']['bien_so_xe'], style: TextStyle(color: global.gold,fontSize: 16),)
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    launchUrl(Uri.parse('tel:${order['driver']['phone']}'));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: global.gold,
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('Gọi tài xế',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 16),),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
              ):
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      //width: 230,
                      height: 180,
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: Image.asset('assets/logo2.png',fit: BoxFit.fill,),
                    ),
                  ),
                  Text('Hãy đặt đơn bạn nhé!', style: TextStyle(fontSize: 20, color: global.grey),),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration:  BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(global.borderImgPath),
                      fit: BoxFit.fill
                  )
              ),
            ),
          ],
        )
      ),
    );
  }
}
