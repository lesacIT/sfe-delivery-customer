import 'dart:async';
import 'dart:convert';

import 'package:deliveryshipper/view/account_view.dart';
import 'package:deliveryshipper/view/history_view.dart';
import 'package:deliveryshipper/view/home_view.dart';
import 'package:deliveryshipper/view/info_view.dart';
import 'package:deliveryshipper/view/notification_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deliveryshipper/class/global.dart' as global;
import 'package:socket_io_client/socket_io_client.dart' as IO;

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  //var
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentView=const HomeView();
  int currentTab=0;
  Timer? timerFindDriver;
  late IO.Socket socket;

  //method
  @override
  void initState() {
    super.initState();
  }

  connectSocket() async{
    socket = IO.io(global.socketUrl, IO.OptionBuilder().setTransports(['websocket']).enableForceNew().build());
    socket.onConnect((_) {

    });
    socket.on('getNoDriver', (data) async{
      dynamic resp=jsonDecode(data);
      if(global.pendingOrder!=null){
        if(resp['order']==global.pendingOrder['id']){
          startTimerFindDriver();
        }
      }
    });
    socket.onDisconnect((_){});
  }

  startTimerFindDriver() async{
    timerFindDriver?.cancel();
    timerFindDriver=Timer.periodic(const Duration(seconds: 20), (timer) async{
      if(global.pendingOrder!=null){

      }
    });
  }

  Widget itemBottomBar(VoidCallback onTap, icon, text, active){
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(icon,color: active?global.gold:global.grey,),
          Text(text, style: TextStyle(color: active?global.gold:global.grey, fontSize: 14),)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageStorage(
              bucket: bucket,
              child: currentView,
            ),
          ),
          Container(
            width: double.infinity,
            height: 70,
            decoration: BoxDecoration(
                color: global.black
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView=HomeView();
                    currentTab=0;
                    setState(() {

                    });
                  }, FontAwesomeIcons.home, 'Trang chủ', currentTab==0),
                ),
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView=InfoView();
                    currentTab=1;
                    setState(() {

                    });
                  }, FontAwesomeIcons.circleInfo, 'Thông tin', currentTab==1),
                ),
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView=NotificationView();
                    currentTab=2;
                    setState(() {

                    });
                  }, FontAwesomeIcons.bell, 'Thông báo', currentTab==2),
                ),
                Expanded(
                  flex: 1,
                  child: itemBottomBar(() {
                    currentView=AccountView();
                    currentTab=3;
                    setState(() {

                    });
                  }, FontAwesomeIcons.circleUser, 'Tài khoản', currentTab==3),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
