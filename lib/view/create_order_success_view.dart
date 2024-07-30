import 'dart:convert';

import 'package:deliveryshipper/class/global.dart' as global;
import 'package:deliveryshipper/controller/order_controller.dart';
import 'package:deliveryshipper/view/detail_history_order_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class CreateOrderSuccessView extends StatefulWidget {
  dynamic order;
  CreateOrderSuccessView({super.key, required this.order});

  @override
  State<CreateOrderSuccessView> createState() =>
      _CreateOrderSuccessViewState(order);
}

class _CreateOrderSuccessViewState extends State<CreateOrderSuccessView> {
  dynamic order;
  _CreateOrderSuccessViewState(this.order);
  //var
  OrderController orderController = Get.find();
  late IO.Socket socket;

  //method
  @override
  void initState() {
    super.initState();
    connectSocket();
  }

  @override
  void dispose() {
    socket.disconnect();
    super.dispose();
  }

  connectSocket() async {
    socket = IO.io(
        global.socketUrl,
        IO.OptionBuilder()
            .setTransports(['websocket'])
            .enableForceNew()
            .build());
    socket.onConnect((_) {});
    socket.on('getStatusOrder', (data) async {
      dynamic resp = jsonDecode(data);
      if (resp['order'] == order['id']) {
        if (resp['status'] == 'accept') {
          await Get.to(
              () => DetailOrderHistoryView(historyorder: order, check: true));
          Get.back();
        }
      }
    });
    socket.onDisconnect((_) {});
  }

  cancelOrder() async {
    dynamic data = await orderController.postCancelOrder(order['id']);
    if (data['error'] == true) {
      global.showError(data['message']);
    } else {
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
        title: Text(
          'Đặt đơn thành công',
          style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: global.gold,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(global.backgroundImage1), fit: BoxFit.fill)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FaIcon(
                    FontAwesomeIcons.carTunnel,
                    color: global.gold,
                    size: 280,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Text(
                      'Chúng tôi đang tìm tài xế cho bạn',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: global.gold,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
            )),
            InkWell(
              onTap: () {
                cancelOrder();
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: global.gold,
                ),
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Huỷ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: global.black,
                          fontSize: 16),
                    ),
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
