import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:deliveryshipper/class/global.dart' as global;
import 'package:get/get.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            Expanded(
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(global.backgroundImage1),
                      fit: BoxFit.fill
                  )
              ),
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FaIcon(FontAwesomeIcons.car, color: global.gold,),
                        Text(' Loại phương tiện', style: TextStyle(color: global.gold,fontSize: 20),),
                      ],
                    ),
                  ),
                  Container(
                      //padding: EdgeInsets.all(10),
                      margin: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      color: global.black,
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  child: Image.network('https://cdn-icons-png.flaticon.com/512/3655/3655645.png', fit: BoxFit.fill,),
                                ),
                                Text(' Xe ôm', style: TextStyle(fontSize: 20, color: global.gold,fontWeight: FontWeight.bold),),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: global.black1,
                            ),
                            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Row(
                              children: [
                                Expanded(
                                  flex:1,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(20, 5, 15, 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(0)
                                      ),

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              FaIcon(FontAwesomeIcons.fileLines,color: global.gold,),
                                              Text(' Ghi chú', style: TextStyle(color: global.gold,fontSize: 20),),
                                            ],
                                          ),
                                          FaIcon(FontAwesomeIcons.pencil, size: 20,color: global.gold,),
                                        ],

                                      )

                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(15, 5, 20, 5),

                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              FaIcon(FontAwesomeIcons.ticket,color: global.gold,),
                                              Text(' Khuyến mãi', style: TextStyle(color: global.gold,fontSize: 20),),
                                            ],
                                          ),
                                          FaIcon(FontAwesomeIcons.pencil, size: 20,color: global.gold,),
                                        ],

                                      )

                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Tổng phí vận chuyển', style: TextStyle(fontSize: 20,color: global.gold,),),
                            Text('đ', style: TextStyle(fontSize: 20,color: global.gold,),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Chi phí vận chuyển( Km)', style: TextStyle(fontSize: 16,color: global.gold,),),
                            Text('đ', style: TextStyle(fontSize: 16,color: global.gold,),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(30),
                      color: global.gold,
                    ),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Đặt đơn',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 18),),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
