import 'package:deliveryshipper/view/call_driver_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart' as global;

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: global.black,
      //   automaticallyImplyLeading: false,
      //   title: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Text('HK SHIP', style:TextStyle(color: global.gold,fontWeight: FontWeight.bold )),
      //       Text('SHIP & TÀI XẾ', style:TextStyle(color: Colors.red, fontSize: 17,fontStyle: FontStyle.italic, fontWeight: FontWeight.bold)),
      //     ],
      //   ),
      // ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(global.backgroundImage1),
            fit: BoxFit.fill
          )
        ),
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(global.borderImgPath),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                //width: 230,
                height: 180,
                margin: EdgeInsets.fromLTRB(0, 25, 0, 25),
                child: Image.asset('assets/banner_home.png',fit: BoxFit.fill,),
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Container(
                      //
                      //   margin: EdgeInsets.fromLTRB(0, 10, 0, 20),
                      //   padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      //   decoration: BoxDecoration(
                      //       border: Border.all(
                      //         color: global.gold,
                      //         width: 1,
                      //       ),
                      //       borderRadius: BorderRadius.circular(10)
                      //   ),
                      //   child: Row(
                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       FaIcon(FontAwesomeIcons.mapLocationDot, color: global.gold,),
                      //       Text(' Thành Phố', style: TextStyle(color: global.gold, fontSize: 18, fontStyle: FontStyle.italic),overflow: TextOverflow.ellipsis,),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  //gọi tài xế-gọi xe
                  // Container(
                  //   height: 130,
                  //   padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  //   margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  //   child:  Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(
                  //         flex:1,
                  //
                  //         child: InkWell(
                  //           onTap: (){
                  //
                  //           },
                  //           child: Container(
                  //               margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                  //               decoration: BoxDecoration(
                  //                   border: Border.all(
                  //                     color: Colors.red,
                  //                     width: 1,
                  //                   ),
                  //                   color: Colors.white,
                  //                   borderRadius: BorderRadius.circular(10)
                  //               ),
                  //
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   FaIcon(FontAwesomeIcons.personBreastfeeding,color: Colors.red, size: 35,),
                  //                   Text('Gọi tài xế', style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                  //                 ],
                  //               )
                  //           ),
                  //         )
                  //       ),
                  //       Expanded(
                  //           flex: 1,
                  //           child: InkWell(
                  //             onTap: (){
                  //               Get.to(()=>ChooseView());
                  //             },
                  //             child: Container(
                  //                 margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                  //                 decoration: BoxDecoration(
                  //                     border: Border.all(
                  //                       color: Colors.red,
                  //                       width: 1,
                  //                     ),
                  //                     color: Colors.white,
                  //                     borderRadius: BorderRadius.circular(10)
                  //                 ),
                  //                 child: Column(
                  //                   mainAxisAlignment: MainAxisAlignment.center,
                  //                   crossAxisAlignment: CrossAxisAlignment.center,
                  //                   children: [
                  //                     FaIcon(FontAwesomeIcons.car,color: Colors.red,size: 35),
                  //                     Text('Gọi xe', style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                  //                   ],
                  //                 )
                  //             ),
                  //           )
                  //       ),
                  //
                  //     ],
                  //   ),
                  // ),
                  //


                  // gửi hàng



                  // Container(
                  //   height: 130,
                  //   padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                  //   //margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Expanded(flex: 1, child: Container(),),
                  //       Expanded(
                  //         flex: 2,
                  //         child: InkWell(
                  //           onTap: (){
                  //             Get.to(()=>ShippingView());
                  //           },
                  //           child:  Container(
                  //               margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                  //               decoration: BoxDecoration(
                  //                   border: Border.all(
                  //                     color: Colors.red,
                  //                     width: 1,
                  //                   ),
                  //                   color: Colors.white,
                  //                   borderRadius: BorderRadius.circular(10)
                  //               ),
                  //
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.center,
                  //                 crossAxisAlignment: CrossAxisAlignment.center,
                  //                 children: [
                  //                   FaIcon(FontAwesomeIcons.boxesPacking,color: Colors.red,size: 35),
                  //                   Text('Gửi hàng', style: TextStyle(color: Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                  //                 ],
                  //               )
                  //           ),
                  //         )
                  //       ),
                  //       Expanded(flex: 1, child: Container(),)
                  //     ],
                  //   ),
                  // ),
                  //
                  
                  //chọn xe
                  Container(
                    height: 130,
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child:  Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex:1,
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>CallDriverView(car_type: 4));
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 15, 0),
                                  decoration: BoxDecoration(
                                      color: global.black1,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.carSide,color: global.gold,size: 30),
                                      Text('Tài xế 4 chỗ', style: TextStyle(color: global.gold,fontWeight: FontWeight.bold,fontSize: 16),),
                                    ],
                                  )
                              ),
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>CallDriverView(car_type: 7));
                              },
                              child: Container(
                                  margin: EdgeInsets.fromLTRB(15, 0, 0, 0),
                                  decoration: BoxDecoration(
                                      color: global.black1,
                                      borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.car,color: global.gold, size: 30,),
                                      Text('Tài xế 7 chỗ', style: TextStyle(color: global.gold,fontWeight: FontWeight.bold,fontSize: 16),),
                                    ],
                                  )
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                    //margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1, child: Container(),),
                        Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: (){
                                Get.to(()=>CallDriverView(car_type: 2));
                              },
                              child:  Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                  decoration: BoxDecoration(
                                      color: global.black1,
                                      borderRadius: BorderRadius.circular(10)
                                  ),

                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      FaIcon(FontAwesomeIcons.motorcycle,color: global.gold,size:30),
                                      Text(' Tài xế xe máy', style: TextStyle(color: global.gold,fontWeight: FontWeight.bold,fontSize: 16),),
                                    ],
                                  )
                              ),
                            )
                        ),
                        Expanded(flex: 1, child: Container(),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(global.borderImgPath),
                      fit: BoxFit.fill
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
