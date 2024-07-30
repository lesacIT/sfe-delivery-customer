import 'package:deliveryshipper/controller/order_controller.dart';
import 'package:deliveryshipper/view/detail_history_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart' as global;
import 'package:intl/intl.dart';

class HistoryView extends StatefulWidget {
  bool showBack;
  HistoryView({super.key, required this.showBack});

  @override
  State<HistoryView> createState() => _HistoryViewState(showBack);
}
class _HistoryViewState extends State<HistoryView> with TickerProviderStateMixin {
  //var
  bool showBack;
  _HistoryViewState(this.showBack);
  late TabController tabController;
  OrderController orderController=Get.find();
  List listOrder=[];
  // List listOrderWaitingDriver=[];
  // List listOrderPickingCustomer=[];
  // List listOrderMoving=[];
  // List listOrderCompleted=[];
  // List listOrderCanceled=[];
  String type='driver';
  int currentTab=0;


  var numberFormat=NumberFormat('#,###','en_US');
  @override
  void initState() {
    super.initState();
    tabController=TabController(length: 6, vsync: this, initialIndex: 0);
    getData();
  }

  getData() async{
    dynamic data=await orderController.getOrder('all',type);
    if(data['error']==true){
      //global.showError(data['message']);
    }
    else{
      listOrder=data['data'];
    }
    setState(() {

    });
  }

  changeTab(index) async{
    currentTab=index;
    if(index==0){
      dynamic data=await orderController.getOrder('all',type);
      listOrder=data['data'];
      setState(() {

      });
    }
    // else if(index==1){
    //   dynamic data=await orderController.getOrder('waiting_driver',type);
    //   listOrderWaitingDriver=data['data'];
    //   setState(() {
    //
    //   });
    // }
    // else if(index==2){
    //   dynamic data=await orderController.getOrder('picking_customer',type);
    //   listOrderPickingCustomer=data['data'];
    //   setState(() {
    //
    //   });
    // }
    // else if(index==3){
    //   dynamic data=await orderController.getOrder('moving',type);
    //   listOrderMoving=data['data'];
    //   setState(() {
    //
    //   });
    // }
    // else if(index==4){
    //   dynamic data=await orderController.getOrder('completed',type);
    //   listOrderCompleted=data['data'];
    //   setState(() {
    //
    //   });
    // }
    // else if(index==5){
    //   dynamic data=await orderController.getOrder('canceled',type);
    //   listOrderCanceled=data['data'];
    //   setState(() {
    //
    //   });
    // }
  }

  String getTenXe(car_type){
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

  String gettrangthai(status){
    String result='';
    if(status=='waiting_driver'){
      result='Chờ tài xế xác nhận';
    }
    else if(status=='picking_customer'){
      result='Đang đón khách';
    }
    else if(status=='moving'){
      result='Đang di chuyển';
    }
    else if(status=='completed'){
      result='Hoàn thành';
    }
    else if( status=='canceled'){
      result='Huỷ';
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text('Lịch sử',style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),),
        centerTitle: true,
        leading: showBack?InkWell(
          onTap: (){
           Get.back();
          },
          child: Icon(Icons.arrow_back_ios, color: global.gold,),
        ):Container(),
        automaticallyImplyLeading: showBack,
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
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(global.borderImgPath),
                      fit: BoxFit.fill
                  )
              ),
            ),
            // Container(
            //   width: double.infinity,
            //   height: 50,
            //   decoration: BoxDecoration(
            //       border: Border.all(
            //           color: global.black1,
            //           width: 1
            //       ),
            //     borderRadius: BorderRadius.circular(10)
            //
            //   ),
            //   margin: EdgeInsets.fromLTRB(50, 20, 50, 0),
            //   clipBehavior: Clip.antiAlias,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     crossAxisAlignment: CrossAxisAlignment.center,
            //     children: [
            //       // Expanded(
            //       //   flex: 1,
            //       //   child: InkWell(
            //       //     onTap: (){
            //       //       type='driver';
            //       //       changeTab(currentTab);
            //       //     },
            //       //     child: Container(
            //       //       height: 50,
            //       //       decoration: BoxDecoration(
            //       //         color: type=='driver'?global.black1:Colors.transparent,
            //       //       ),
            //       //       child: Row(
            //       //         mainAxisAlignment: MainAxisAlignment.center,
            //       //         crossAxisAlignment: CrossAxisAlignment.center,
            //       //         children: [
            //       //           Text('Gọi tài xế',style: TextStyle(color: type=='driver'?global.gold:global.gold, fontWeight: FontWeight.bold,fontSize: 16),)
            //       //         ],
            //       //       ),
            //       //     ),
            //       //   )
            //       // ),
            //       // Expanded(
            //       //   flex: 1,
            //       //   child: InkWell(
            //       //       onTap: (){
            //       //         type='car';
            //       //         changeTab(currentTab);
            //       //       },
            //       //       child: Container(
            //       //         height: 50,
            //       //         decoration: BoxDecoration(
            //       //           color: type=='car'?global.black1:Colors.transparent,
            //       //         ),
            //       //         child: Row(
            //       //           mainAxisAlignment: MainAxisAlignment.center,
            //       //           crossAxisAlignment: CrossAxisAlignment.center,
            //       //           children: [
            //       //             Text('Gọi xe',style: TextStyle(color: type=='car'?global.gold:global.grey, fontSize: 16),)
            //       //           ],
            //       //         ),
            //       //       ),
            //       //   ),
            //       // ),
            //       // Expanded(
            //       //   flex: 1,
            //       //   child: InkWell(
            //       //     onTap: (){
            //       //       type='shipping';
            //       //       changeTab(currentTab);
            //       //     },
            //       //     child: Container(
            //       //       height: 50,
            //       //       decoration: BoxDecoration(
            //       //         color: type=='shipping'?global.black1:Colors.transparent,
            //       //       ),
            //       //       child: Row(
            //       //         mainAxisAlignment: MainAxisAlignment.center,
            //       //         crossAxisAlignment: CrossAxisAlignment.center,
            //       //         children: [
            //       //           Text('Gửi hàng',style: TextStyle(color: type=='shipping'?global.gold:global.grey, fontSize: 16),)
            //       //         ],
            //       //       ),
            //       //     ),
            //       //   )
            //       //
            //       // )
            //
            //     ],
            //   ),
            // ),
            // TabBar(
            //   controller: tabController,
            //   isScrollable: true,
            //   padding: EdgeInsets.zero,
            //   tabAlignment: TabAlignment.start,
            //   labelStyle: TextStyle(fontSize: 16, color: global.gold),
            //   indicatorColor: global.gold,
            //   indicatorSize: TabBarIndicatorSize.tab,
            //   unselectedLabelColor: global.grey,
            //   tabs: [
            //     Tab(text: 'Tất cả'),
            //     // Tab(text: 'Chờ tài xế',),
            //     // Tab(text: 'Đang đón khách',),
            //     // Tab(text: 'Đang di chuyển',),
            //     // Tab(text: 'Hoàn tất',),
            //     // Tab(text: 'Huỷ',)
            //   ],
            //   onTap: (index){
            //     changeTab(index);
            //   },
            // ),
            Expanded(
              child: Container(
                child: ListView(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
                    children: List.generate(listOrder.length, (index) {
                      return InkWell(
                        onTap: ()async{
                         await Get.to(()=>DetailOrderHistoryView(historyorder: listOrder[index], check: true,));
                         getData();
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: global.gold,
                                  width: 1
                              ),
                              color: global.black1,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(listOrder[index]['distance'].toString()+' km', style: TextStyle(color: global.gold, fontSize: 16),),
                                      Text(DateFormat('dd/MM/yyy HH:mm').format(DateTime.parse(listOrder[index]['created_at'])), style: TextStyle(color: global.gold, fontSize: 18))
                                    ],
                                  )
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(text: 'Điểm xuất phát: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
                                        TextSpan(text: listOrder[index]['address_from'], style: TextStyle(color: global.gold, fontSize: 18))
                                      ]
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(text: 'Điểm đến: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
                                        TextSpan(text: listOrder[index]['address_to'], style: TextStyle(color: global.gold, fontSize: 18))
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
                                            TextSpan(text: 'Loại xe: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
                                            TextSpan(text: getTenXe(listOrder[index]['car_type']), style: TextStyle(color: global.gold, fontSize: 18))
                                          ]
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(5),
                                    child: RichText(
                                      text: TextSpan(
                                          children: [
                                            TextSpan(text: 'Tổng tiền: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
                                            TextSpan(text: numberFormat.format(listOrder[index]['total']), style: TextStyle(color: global.gold, fontSize: 18))
                                          ]
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                                child: RichText(
                                  text: TextSpan(
                                      children: [
                                        TextSpan(text: 'Trạng thái: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
                                        TextSpan(text: gettrangthai(listOrder[index]['status']), style: TextStyle(color: global.gold, fontSize: 18))
                                      ]
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ),
                      );

                    })
                ),
              ),
              // TabBarView(
              //   controller: tabController,
              //   children: [
              //
              //     // Container(
              //     //     child: ListView(
              //     //         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //     //         children: List.generate(listOrderWaitingDriver.length, (index) {
              //     //           return InkWell(
              //     //               onTap: ()async{
              //     //                 await Get.to(()=>DetailOrderHistoryController(historyorder: listOrder[index], check: true,));
              //     //                 changeTab(1);
              //     //               },
              //     //               child:Container(
              //     //                 decoration: BoxDecoration(
              //     //                     border: Border.all(
              //     //                         color: global.gold,
              //     //                         width: 1
              //     //                     ),
              //     //                     color: global.black1,
              //     //                     borderRadius: BorderRadius.circular(10)
              //     //                 ),
              //     //                 padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              //     //                 margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              //     //                 child: Column(
              //     //                   mainAxisAlignment: MainAxisAlignment.start,
              //     //                   crossAxisAlignment: CrossAxisAlignment.start,
              //     //                   children: [
              //     //                     Padding(
              //     //                         padding: EdgeInsets.all(5),
              //     //                         child: Row(
              //     //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                           crossAxisAlignment: CrossAxisAlignment.start,
              //     //                           children: [
              //     //                             Text(listOrderWaitingDriver[index]['distance'].toString()+' km', style: TextStyle(color: global.gold, fontSize: 18),),
              //     //                             Text(DateFormat('dd/MM/yyy HH:mm').format(DateTime.parse(listOrder[index]['created_at'])), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                           ],
              //     //                         )
              //     //                     ),
              //     //                     Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: RichText(
              //     //                         text: TextSpan(
              //     //                             children: [
              //     //                               TextSpan(text: 'Điểm xuất phát: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                               TextSpan(text: listOrderWaitingDriver[index]['address_from'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                             ]
              //     //                         ),
              //     //                       ),
              //     //                     ),
              //     //                     Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: RichText(
              //     //                         text: TextSpan(
              //     //                             children: [
              //     //                               TextSpan(text: 'Điểm đến: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                               TextSpan(text: listOrderWaitingDriver[index]['address_to'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                             ]
              //     //                         ),
              //     //                       ),
              //     //                     ),
              //     //                     Row(
              //     //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                       crossAxisAlignment: CrossAxisAlignment.center,
              //     //                       children: [
              //     //                         Padding(
              //     //                           padding: EdgeInsets.all(5),
              //     //                           child: RichText(
              //     //                             text: TextSpan(
              //     //                                 children: [
              //     //                                   TextSpan(text: 'Loại xe: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                   TextSpan(text: getTenXe(listOrderWaitingDriver[index]['car_type']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                                 ]
              //     //                             ),
              //     //                           ),
              //     //                         ),
              //     //                         Padding(
              //     //                           padding: EdgeInsets.all(5),
              //     //                           child: RichText(
              //     //                             text: TextSpan(
              //     //                                 children: [
              //     //                                   TextSpan(text: 'Tổng tiền: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                   TextSpan(text: numberFormat.format(listOrder[index]['total']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                                 ]
              //     //                             ),
              //     //                           ),
              //     //                         ),
              //     //                       ],
              //     //                     )
              //     //
              //     //                   ],
              //     //                 ),
              //     //
              //     //               ),
              //     //           );
              //     //         })
              //     //     ),
              //     //   ),
              //     // Container(
              //     //     child: ListView(
              //     //         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //     //         children: List.generate(listOrderPickingCustomer.length, (index) {
              //     //           return InkWell(
              //     //             onTap: (){
              //     //               Get.to(()=>DetailOrderHistoryController(historyorder: listOrderPickingCustomer[index], check: false,));
              //     //             },
              //     //             child: Container(
              //     //               decoration: BoxDecoration(
              //     //                   border: Border.all(
              //     //                       color: global.gold,
              //     //                       width: 1
              //     //                   ),
              //     //                   color: global.black1,
              //     //                   borderRadius: BorderRadius.circular(10)
              //     //               ),
              //     //               padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              //     //               margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              //     //               child: Column(
              //     //                 mainAxisAlignment: MainAxisAlignment.start,
              //     //                 crossAxisAlignment: CrossAxisAlignment.start,
              //     //                 children: [
              //     //                   Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: Row(
              //     //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                         crossAxisAlignment: CrossAxisAlignment.start,
              //     //                         children: [
              //     //                           Text(listOrderPickingCustomer[index]['distance'].toString()+' km', style: TextStyle(color: global.gold, fontSize: 18),),
              //     //                           Text(DateFormat('dd/MM/yyy HH:mm').format(DateTime.parse(listOrderPickingCustomer[index]['created_at'])), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                         ],
              //     //                       )
              //     //                   ),
              //     //                   Padding(
              //     //                     padding: EdgeInsets.all(5),
              //     //                     child: RichText(
              //     //                       text: TextSpan(
              //     //                           children: [
              //     //                             TextSpan(text: 'Điểm xuất phát: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                             TextSpan(text: listOrderPickingCustomer[index]['address_from'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                           ]
              //     //                       ),
              //     //                     ),
              //     //                   ),
              //     //                   Padding(
              //     //                     padding: EdgeInsets.all(5),
              //     //                     child: RichText(
              //     //                       text: TextSpan(
              //     //                           children: [
              //     //                             TextSpan(text: 'Điểm đến: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                             TextSpan(text: listOrderPickingCustomer[index]['address_to'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                           ]
              //     //                       ),
              //     //                     ),
              //     //                   ),
              //     //                   Row(
              //     //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                     crossAxisAlignment: CrossAxisAlignment.center,
              //     //                     children: [
              //     //                       Padding(
              //     //                         padding: EdgeInsets.all(5),
              //     //                         child: RichText(
              //     //                           text: TextSpan(
              //     //                               children: [
              //     //                                 TextSpan(text: 'Loại xe: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                 TextSpan(text: getTenXe(listOrderPickingCustomer[index]['car_type']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                               ]
              //     //                           ),
              //     //                         ),
              //     //                       ),
              //     //                       Padding(
              //     //                         padding: EdgeInsets.all(5),
              //     //                         child: RichText(
              //     //                           text: TextSpan(
              //     //                               children: [
              //     //                                 TextSpan(text: 'Tổng tiền: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                 TextSpan(text: numberFormat.format(listOrderPickingCustomer[index]['total']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                               ]
              //     //                           ),
              //     //                         ),
              //     //                       ),
              //     //                     ],
              //     //                   )
              //     //                 ],
              //     //               ),
              //     //
              //     //             ),
              //     //           );
              //     //         })
              //     //     ),
              //     //   ),
              //     // Container(
              //     //     child: ListView(
              //     //         padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //     //         children: List.generate(listOrderMoving.length, (index) {
              //     //           return InkWell(
              //     //               onTap: (){
              //     //                 Get.to(()=>DetailOrderHistoryController(historyorder: listOrderMoving[index], check: false,));
              //     //               },
              //     //               child:Container(
              //     //                 decoration: BoxDecoration(
              //     //                     border: Border.all(
              //     //                         color: global.gold,
              //     //                         width: 1
              //     //                     ),
              //     //                     color: global.black1,
              //     //                     borderRadius: BorderRadius.circular(10)
              //     //                 ),
              //     //                 padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              //     //                 margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              //     //                 child: Column(
              //     //                   mainAxisAlignment: MainAxisAlignment.start,
              //     //                   crossAxisAlignment: CrossAxisAlignment.start,
              //     //                   children: [
              //     //                     Padding(
              //     //                         padding: EdgeInsets.all(5),
              //     //                         child: Row(
              //     //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                           crossAxisAlignment: CrossAxisAlignment.start,
              //     //                           children: [
              //     //                             Text(listOrderMoving[index]['distance'].toString()+' km', style: TextStyle(color: global.gold, fontSize: 18),),
              //     //                             Text(DateFormat('dd/MM/yyy HH:mm').format(DateTime.parse(listOrderMoving[index]['created_at'])), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                           ],
              //     //                         )
              //     //                     ),
              //     //                     Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: RichText(
              //     //                         text: TextSpan(
              //     //                             children: [
              //     //                               TextSpan(text: 'Điểm xuất phát: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                               TextSpan(text: listOrderMoving[index]['address_from'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                             ]
              //     //                         ),
              //     //                       ),
              //     //                     ),
              //     //                     Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: RichText(
              //     //                         text: TextSpan(
              //     //                             children: [
              //     //                               TextSpan(text: 'Điểm đến: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                               TextSpan(text: listOrderMoving[index]['address_to'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                             ]
              //     //                         ),
              //     //                       ),
              //     //                     ),
              //     //                     Row(
              //     //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                       crossAxisAlignment: CrossAxisAlignment.center,
              //     //                       children: [
              //     //                         Padding(
              //     //                           padding: EdgeInsets.all(5),
              //     //                           child: RichText(
              //     //                             text: TextSpan(
              //     //                                 children: [
              //     //                                   TextSpan(text: 'Loại xe: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                   TextSpan(text: getTenXe(listOrderMoving[index]['car_type']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                                 ]
              //     //                             ),
              //     //                           ),
              //     //                         ),
              //     //                         Padding(
              //     //                           padding: EdgeInsets.all(5),
              //     //                           child: RichText(
              //     //                             text: TextSpan(
              //     //                                 children: [
              //     //                                   TextSpan(text: 'Tổng tiền: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                   TextSpan(text: numberFormat.format(listOrderMoving[index]['total']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                                 ]
              //     //                             ),
              //     //                           ),
              //     //                         ),
              //     //                       ],
              //     //                     )
              //     //                   ],
              //     //                 ),
              //     //
              //     //               ),
              //     //           );
              //     //         })
              //     //     ),
              //     //   ),
              //     // Container(
              //     //       child: ListView(
              //     //           padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //     //           children: List.generate(listOrderCompleted.length, (index) {
              //     //             return InkWell(
              //     //               onTap: (){
              //     //                 Get.to(()=>DetailOrderHistoryController(historyorder: listOrderCompleted[index], check: false,));
              //     //               },
              //     //               child: Container(
              //     //                 decoration: BoxDecoration(
              //     //                     border: Border.all(
              //     //                         color: global.gold,
              //     //                         width: 1
              //     //                     ),
              //     //                     color: global.black1,
              //     //                     borderRadius: BorderRadius.circular(10)
              //     //                 ),
              //     //                 padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              //     //                 margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              //     //                 child: Column(
              //     //                   mainAxisAlignment: MainAxisAlignment.start,
              //     //                   crossAxisAlignment: CrossAxisAlignment.start,
              //     //                   children: [
              //     //                     Padding(
              //     //                         padding: EdgeInsets.all(5),
              //     //                         child: Row(
              //     //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                           crossAxisAlignment: CrossAxisAlignment.start,
              //     //                           children: [
              //     //                             Text(listOrderCompleted[index]['distance'].toString()+' km', style: TextStyle(color: global.gold, fontSize: 18),),
              //     //                             Text(DateFormat('dd/MM/yyy HH:mm').format(DateTime.parse(listOrderCompleted[index]['created_at'])), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                           ],
              //     //                         )
              //     //                     ),
              //     //                     Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: RichText(
              //     //                         text: TextSpan(
              //     //                             children: [
              //     //                               TextSpan(text: 'Điểm xuất phát: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                               TextSpan(text: listOrderCompleted[index]['address_from'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                             ]
              //     //                         ),
              //     //                       ),
              //     //                     ),
              //     //                     Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: RichText(
              //     //                         text: TextSpan(
              //     //                             children: [
              //     //                               TextSpan(text: 'Điểm đến: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                               TextSpan(text: listOrderCompleted[index]['address_to'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                             ]
              //     //                         ),
              //     //                       ),
              //     //                     ),
              //     //                     Row(
              //     //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                       crossAxisAlignment: CrossAxisAlignment.center,
              //     //                       children: [
              //     //                         Padding(
              //     //                           padding: EdgeInsets.all(5),
              //     //                           child: RichText(
              //     //                             text: TextSpan(
              //     //                                 children: [
              //     //                                   TextSpan(text: 'Loại xe: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                   TextSpan(text: getTenXe(listOrderCompleted[index]['car_type']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                                 ]
              //     //                             ),
              //     //                           ),
              //     //                         ),
              //     //                         Padding(
              //     //                           padding: EdgeInsets.all(5),
              //     //                           child: RichText(
              //     //                             text: TextSpan(
              //     //                                 children: [
              //     //                                   TextSpan(text: 'Tổng tiền: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                   TextSpan(text: numberFormat.format(listOrderCompleted[index]['total']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                                 ]
              //     //                             ),
              //     //                           ),
              //     //                         ),
              //     //                       ],
              //     //                     )
              //     //                   ],
              //     //                 ),
              //     //
              //     //               ),
              //     //             );
              //     //           })
              //     //       ),
              //     //     ),
              //     // Container(
              //     //       child: ListView(
              //     //           padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              //     //           children: List.generate(listOrderCanceled.length, (index) {
              //     //             return InkWell(
              //     //               onTap: (){
              //     //                 Get.to(()=>DetailOrderHistoryController(historyorder: listOrderCanceled[index], check: false,));
              //     //               },
              //     //               child: Container(
              //     //                 decoration: BoxDecoration(
              //     //                     border: Border.all(
              //     //                         color: global.gold,
              //     //                         width: 1
              //     //                     ),
              //     //                     color: global.black1,
              //     //                     borderRadius: BorderRadius.circular(10)
              //     //                 ),
              //     //                 padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
              //     //                 margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              //     //                 child: Column(
              //     //                   mainAxisAlignment: MainAxisAlignment.start,
              //     //                   crossAxisAlignment: CrossAxisAlignment.start,
              //     //                   children: [
              //     //                     Padding(
              //     //                         padding: EdgeInsets.all(5),
              //     //                         child: Row(
              //     //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                           crossAxisAlignment: CrossAxisAlignment.start,
              //     //                           children: [
              //     //                             Text(listOrderCanceled[index]['distance'].toString()+' km', style: TextStyle(color: global.gold, fontSize: 18),),
              //     //                             Text(DateFormat('dd/MM/yyy HH:mm').format(DateTime.parse(listOrder[index]['created_at'])), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                           ],
              //     //                         )
              //     //                     ),
              //     //                     Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: RichText(
              //     //                         text: TextSpan(
              //     //                             children: [
              //     //                               TextSpan(text: 'Điểm xuất phát: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                               TextSpan(text: listOrderCanceled[index]['address_from'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                             ]
              //     //                         ),
              //     //                       ),
              //     //                     ),
              //     //                     Padding(
              //     //                       padding: EdgeInsets.all(5),
              //     //                       child: RichText(
              //     //                         text: TextSpan(
              //     //                             children: [
              //     //                               TextSpan(text: 'Điểm đến: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                               TextSpan(text: listOrderCanceled[index]['address_to'], style: TextStyle(color: global.gold, fontSize: 18))
              //     //                             ]
              //     //                         ),
              //     //                       ),
              //     //                     ),
              //     //                     Row(
              //     //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     //                       crossAxisAlignment: CrossAxisAlignment.center,
              //     //                       children: [
              //     //                         Padding(
              //     //                           padding: EdgeInsets.all(5),
              //     //                           child: RichText(
              //     //                             text: TextSpan(
              //     //                                 children: [
              //     //                                   TextSpan(text: 'Loại xe: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                   TextSpan(text: getTenXe(listOrderCanceled[index]['car_type']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                                 ]
              //     //                             ),
              //     //                           ),
              //     //                         ),
              //     //                         Padding(
              //     //                           padding: EdgeInsets.all(5),
              //     //                           child: RichText(
              //     //                             text: TextSpan(
              //     //                                 children: [
              //     //                                   TextSpan(text: 'Tổng tiền: ', style: TextStyle(fontWeight:FontWeight.bold,color: global.gold, fontSize: 18)),
              //     //                                   TextSpan(text: numberFormat.format(listOrderCanceled[index]['total']), style: TextStyle(color: global.gold, fontSize: 18))
              //     //                                 ]
              //     //                             ),
              //     //                           ),
              //     //                         ),
              //     //                       ],
              //     //                     )
              //     //                   ],
              //     //                 ),
              //     //
              //     //               ),
              //     //             );
              //     //           })
              //     //       ),
              //     //     ),
              //   ],
              // ),
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
            ),
          ],
        ),
      ),
    );
  }
}
