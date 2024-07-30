import 'package:deliveryshipper/view/change_password_view.dart';
import 'package:deliveryshipper/view/delete_view.dart';
import 'package:deliveryshipper/view/history_view.dart';
import 'package:deliveryshipper/view/login_view.dart';
import 'package:deliveryshipper/view/profile_view.dart';
import 'package:deliveryshipper/view/rate_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart' as global;

class AccountView extends StatefulWidget {
  const AccountView({super.key});


  @override
  State<AccountView> createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(global.backgroundImage1),
                fit: BoxFit.fill
            ),
                //color: global.black,
        ),
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
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
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(global.user['name'], style: TextStyle(fontWeight: FontWeight.bold,color: global.gold,fontSize: 20),),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.fromLTRB(0, 10, 10, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.phone_android,color: global.gold,size: 23,),
                                Text(' ${global.user['phone']}', style: TextStyle(color: global.gold, fontSize: 16),),
                              ],
                            )
                        ),
                      ],
                    ),

                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: global.black,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: (){
                            Get.to(()=>ProfileView());
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.solidIdCard, color: global.gold,),
                                    Text('  Thông tin tài khoản', style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16,color: global.gold,)
                              ],
                            ),

                          ),
                        ),
                        // InkWell(
                        //   onTap: (){
                        //   },
                        //   child: Container(
                        //     padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                        //     margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                        //     child: Row(
                        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //       crossAxisAlignment: CrossAxisAlignment.center,
                        //       children: [
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.start,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             FaIcon(FontAwesomeIcons.locationDot, color: global.gold,),
                        //             Text('   Khu vực', style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                        //           ],
                        //         ),
                        //         Row(
                        //           mainAxisAlignment: MainAxisAlignment.end,
                        //           crossAxisAlignment: CrossAxisAlignment.center,
                        //           children: [
                        //             Text('Thành Phố ', style: TextStyle(color: global.gold,fontSize: 16),),
                        //             Icon(Icons.arrow_forward_ios, size: 18,color: global.gold,)
                        //           ],)
                        //
                        //       ],
                        //     ),
                        //
                        //   ),
                        // ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>ChangPassWordView());
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.key, color: global.gold,),
                                    Text('  Đổi mật khẩu', style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16,color: global.gold,)
                              ],
                            ),

                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>HistoryView(showBack: true,));
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.rectangleList, color: global.gold,),
                                    Text('  Lịch sử đơn hàng', style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16,color: global.gold,)
                              ],
                            ),

                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>RateView());
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.star, color: global.gold,),
                                    Text('  Đánh giá của tôi', style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16,color: global.gold,)
                              ],
                            ),

                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.to(()=>DeleteView());
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.trashCan, color: global.gold,),
                                    Text('  Yêu cầu xoá tài khoản', style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16,color: global.gold,)
                              ],
                            ),

                          ),
                        ),
                        InkWell(
                          onTap: (){
                            Get.back();
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                            margin: EdgeInsets.fromLTRB(0, 10, 0, 5),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    FaIcon(FontAwesomeIcons.rightFromBracket, color: global.gold,),
                                    Text('  Đăng xuất', style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios, size: 16,color: global.gold,)
                              ],
                            ),

                          ),
                        ),
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
            ),
          ],
        )
      ),
    );
  }
}
