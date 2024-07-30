import 'package:deliveryshipper/controller/notification_controller.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart'as global;

class DetailNotificationView extends StatefulWidget {
  dynamic notify;
  DetailNotificationView({super.key, required this.notify});

  @override
  State<DetailNotificationView> createState() => _DetailNotificationViewState(notify);
}

class _DetailNotificationViewState extends State<DetailNotificationView> {
  dynamic notify;
  _DetailNotificationViewState(this.notify);
  //
  NotificationController notificationController=Get.find();

  @override
  void initState(){
    super.initState();
    thongbaodadoc();
  }

  thongbaodadoc() async{
    dynamic data=await notificationController.postMarkAsRead(notify['id']);
    if(data['error']==true){
      global.showError(data['message']);
    }
    else{

    }
    setState(() {

    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text('Chi tiết thông báo',style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),),
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
            Container(
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        color: global.gold,
                        width: 1
                    )
                ),
                color: Colors.white.withOpacity(0.1),
              ),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              //margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(notify['title'],style: TextStyle(color: global.gold, fontWeight: FontWeight.bold,fontSize: 16),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.clock, color: global.gold,size: 16,),
                      Text(' '+DateTime.now().difference(DateTime.parse(notify['created_at'])).inHours.toString()+' giờ trước',style: TextStyle(color: global.gold, fontSize: 16),),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: ListView(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                  children: [
                    Text(notify['content'],style: TextStyle(color: global.gold, fontSize: 16),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
