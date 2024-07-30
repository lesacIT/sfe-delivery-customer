import 'dart:convert';
import 'package:deliveryshipper/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:deliveryshipper/class/global.dart' as global;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class DetailOrderHistoryView extends StatefulWidget {
  dynamic historyorder;
  bool check;
  DetailOrderHistoryView({super.key,required this.historyorder,required this.check });

  @override
  State<DetailOrderHistoryView> createState() => _DetailOrderHistoryViewState(historyorder, check);
}

class _DetailOrderHistoryViewState extends State<DetailOrderHistoryView> {
  dynamic historyorder;
  bool check;
  _DetailOrderHistoryViewState(this.historyorder, this.check);

  OrderController orderController=Get.find();
  var numberFormat=NumberFormat('#,###','en_US');
  dynamic detail;
  late IO.Socket socket;

  //method
  @override
  void initState() {
    super.initState();
    getDetail();
    connectSocket();
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  connectSocket() async{
    socket = IO.io(global.socketUrl, IO.OptionBuilder().setTransports(['websocket']).enableForceNew().build());
    socket.onConnect((_) {
      socket.emit('joinOrder',{'order_id':historyorder['id']});
    });
    socket.on('getDriverLocation', (data) async{
      dynamic resp=jsonDecode(data);
    });
    socket.onDisconnect((_){});
  }


  getDetail()async{
    global.showLoading();
    dynamic data = await orderController.getDetail(historyorder['id']);
    global.hideLoading();
    if (data['error'] == true) {
      global.showError(data['message']);
    }
    else {
      detail=data['data'];
      setState(() {

      });
    }
  }

  String getCTTenXe(car_type){
    String result='';
    if(car_type=='2'){
      result='Xe máy';
    }
    else if(car_type=='4'){
      result='Xe 4 chỗ';
    }
    else if( car_type=='7'){
      result='Xe 7 chỗ';
    }
    return result;
  }
  
  cancelOrder() async{
    dynamic data = await orderController.postCancelOrder(detail['id']);
    if (data['error'] == true) {
      global.showError(data['message']);
    }
    else {
      global.showSuccess(data['message']);
      Get.back();
      Get.back();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text('Chi tiết lịch sử đặt hàng',style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),),
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
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: global.gold,
                      width: 1
                  ),
                  color: global.black1,
                  borderRadius: BorderRadius.circular(0)
              ),
              padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: detail!=null?Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${detail['distance']} km', style: TextStyle(color: global.gold, fontSize: 16),),
                          Text(DateFormat('dd/MM/yyy HH:mm').format(DateTime.parse(detail['created_at'])), style: TextStyle(color: global.gold, fontSize: 16))
                        ],
                      )
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(text: 'Điểm xuất phát: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 16)),
                            TextSpan(text: detail['address_from'], style: TextStyle(color: global.gold, fontSize: 16))
                          ]
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5),
                    child: RichText(
                      text: TextSpan(
                          children: [
                            TextSpan(text: 'Điểm đến: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 16)),
                            TextSpan(text: detail['address_to'], style: TextStyle(color: global.gold, fontSize: 16))
                          ]
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(text: 'Loại xe: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 16)),
                                TextSpan(text: getCTTenXe(detail['car_type'].toString()), style: TextStyle(color: global.gold, fontSize: 16))
                              ]
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(
                              children: [
                                TextSpan(text: 'Tổng tiền: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 16)),
                                TextSpan(text: numberFormat.format(num.parse(detail['total'].toString())), style: TextStyle(color: global.gold, fontSize: 16))
                              ]
                          ),
                        ),
                      ),
                    ],
                  ),
                  if(detail['status']=='waiting_driver')
                  InkWell(
                    onTap: (){
                      showDialog(
                          context: context,
                          builder: (context){
                            return AlertDialog(
                              //backgroundColor: global.black1,
                              title: Text('Huỷ đơn hàng', style: TextStyle(color: global.black, fontWeight: FontWeight.bold),),
                              content: Container(
                                height: 150,
                                padding: EdgeInsets.all(10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Bạn có chắc chắc muốn HUỶ ĐƠN không?',style: TextStyle(fontSize: 20, color: global.black),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            flex:1,
                                            child: InkWell(
                                              onTap: (){
                                                Get.back();
                                              },
                                              child: Container(
                                                height: 50,
                                                  margin: EdgeInsets.fromLTRB(0, 20, 15, 0),

                                                  decoration: BoxDecoration(
                                                      color: global.gold,
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Center(
                                                    child: Text('Huỷ', textAlign: TextAlign.center,style: TextStyle(color: global.black,fontWeight: FontWeight.bold,fontSize: 20),),
                                                  )
                                              ),
                                            )
                                        ),
                                        Expanded(
                                            flex: 1,
                                            child: InkWell(
                                              onTap: (){
                                                cancelOrder();
                                              },
                                              child: Container(
                                                height: 50,
                                                  margin: EdgeInsets.fromLTRB(15, 20, 0, 0),
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius: BorderRadius.circular(10)
                                                  ),
                                                  child: Center(
                                                    child: Text('Đồng ý', style: TextStyle(color: global.gold,fontWeight: FontWeight.bold,fontSize: 20),),
                                                  )
                                              ),
                                            )
                                        ),
                                      ],
                                    )
                                  ],
                                ),

                              ),
                            );
                          }
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: global.gold,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                      margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Text('Huỷ đơn',textAlign: TextAlign.center ,style: TextStyle(fontWeight:FontWeight.bold,color: global.black, fontSize: 16)),
                    ),
                  )
                ],
              ):
              Container(),
            )
          ],
        ),
      ),
    );
  }
}
