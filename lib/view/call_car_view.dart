import 'package:deliveryshipper/view/map_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart' as global;

class CallCarView extends StatefulWidget {
  const CallCarView({super.key});

  @override
  State<CallCarView> createState() => _CallCarViewState();
}

class _CallCarViewState extends State<CallCarView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('HK SHIP', style:TextStyle(color: global.gold,fontWeight: FontWeight.bold )),
            Text('LẤY NHANH - GIAO LẸ', style:TextStyle(color: Colors.red, fontSize: 15,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
          ],
        ),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(10),
                  color: global.black1,
              ),
              padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Bạn muốn ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold,fontSize: 16),),
                              Text(' GỌI XE đi đến đâu?', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 16),),
                            ],
                          )
                      ),
                    ],
                  ),
                  Container(
                    width: 80,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    // margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                  )
                ],
              )

            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: global.black1,
              ),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: Text('Gọi xe nhanh chóng trong 2 bước', style: TextStyle(fontSize: 16, color: global.gold, fontWeight: FontWeight.bold),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FaIcon(FontAwesomeIcons.circleDot, color: global.gold,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('  Điểm đón', style: TextStyle(color: global.gold,fontSize: 17),),
                                Text('*', style: TextStyle(fontSize: 17,color: Colors.red),),
                              ],
                            ),
                            Text('  Thông tin chi tiết', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color: global.gold),),
                          ],
                        ),
                      ),
                      FaIcon(FontAwesomeIcons.pencil, color: global.gold,),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FaIcon(FontAwesomeIcons.locationDot, color: global.gold,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('  Điểm đến', style: TextStyle(color: global.gold,fontSize: 17),),
                                Text('*', style: TextStyle(fontSize: 17,color: Colors.red),),
                              ],
                            ),
                            Text('  Thông tin chi tiết', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: global.gold),),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          Get.to(()=>MapView());
                        },
                        child: FaIcon(FontAwesomeIcons.pencil, color: global.gold,),
                      )
                    ],
                  ),

                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
