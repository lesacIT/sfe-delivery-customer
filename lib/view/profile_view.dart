import 'package:deliveryshipper/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:deliveryshipper/class/global.dart' as global;
import 'package:get/get.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  String? tinhtpSelected;
  List listTinhTp=[
    {'slug':'can-tho','title':'Cần Thơ'},
    {'slug':'tien-giang','title':'Tiền Giang'},
  ];

  String? quanhuyenSelected;
  List listQH=[
    {'slug':'phong-dien','title':'Phong Điền'},
    {'slug':'cai-lay','title':'Cai Lậy'},
  ];

  String? phuongxaSelected;
  List listPX=[
    {'slug':'my-khach','title':'Mỹ Khách'},
    {'slug':'binh-phu','title':'Bình Phú'},
  ];

  AuthController authController=Get.find();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text=global.user['name'];
    phoneController.text=global.user['phone'];
  }

  updateinfo() async {
    if (nameController.text.isEmpty) {
      global.showError('Vui lòng nhập họ và tên');
    }
    else {
      dynamic data = await authController.postUpdateinfo(nameController.text);
      if (data['error'] == true) {
        global.showError(data['message']);
      }
      else {
        global.showSuccess(data['message']);
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text('Thông tin tài khoản',style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                      child: Text('THÔNG TIN CƠ BẢN', style: TextStyle(fontSize: 16, color: global.gold, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Họ & tên', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('*', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: global.black1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: global.black1
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)
                        ),
                        cursorColor: Colors.grey,
                        style: TextStyle(color: global.grey),
                        obscureText: false,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 0, 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Số điện thoại', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                            Text('*', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.red),),
                          ],
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: global.black1,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: global.black1
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)
                        ),
                        cursorColor: Colors.grey,
                        style: TextStyle(color: global.grey),
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        readOnly: true,
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    //   child: Text('ĐỊA CHỈ', style: TextStyle(fontSize: 18, color: global.gold, fontWeight: FontWeight.bold),),
                    // ),
                    // Text('Địa chỉ này sẽ dùng làm địa chỉ giao hàng mặc định', style: TextStyle(fontSize: 14, color: global.gold.withOpacity(0.8)),),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    //   child: Text('Tỉnh/ Thành phố', style: TextStyle(color: global.gold, fontSize: 18,fontWeight: FontWeight.bold),),
                    // ),
                    // Container(
                    //   child: DecoratedBox(
                    //     decoration: BoxDecoration(
                    //         color: global.black1,
                    //         border: Border.all(
                    //
                    //             width: 1,
                    //             color: global.black1
                    //         ),
                    //
                    //         borderRadius: BorderRadius.circular(10)
                    //     ),
                    //     child: DropdownButton<String>(
                    //       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    //       isExpanded: true,
                    //       underline: Container(),
                    //       value: tinhtpSelected,
                    //       onChanged: (value) async{
                    //         tinhtpSelected = value.toString();
                    //         setState(() {
                    //
                    //         });
                    //       },
                    //       hint: Padding(
                    //         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    //         child: Text('Tỉnh/ Thành phố', style: TextStyle(color: global.grey),),
                    //       ),
                    //       icon: Icon(Icons.arrow_drop_down, color: global.gold,),
                    //       items: List.generate(
                    //           listTinhTp.length, (index){
                    //         return DropdownMenuItem(
                    //           value: listTinhTp[index]['slug'].toString(),
                    //           child: Container(
                    //             alignment: Alignment.centerLeft,
                    //             child: Text(
                    //               listTinhTp[index]['title'],
                    //               style: TextStyle(fontSize: 16, color: global.black),
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //       ),
                    //       selectedItemBuilder: (BuildContext context) => listTinhTp
                    //           .map((item) => Align(
                    //           alignment: Alignment.centerLeft,
                    //           child: Text(
                    //             item['title'],
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               color: global.grey,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           )
                    //       )).toList(),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    //   child: Text('Quận/ Huyện', style: TextStyle(color: global.gold,fontSize: 18,fontWeight: FontWeight.bold),),
                    // ),
                    // Container(
                    //   child: DecoratedBox(
                    //     decoration: BoxDecoration(
                    //         color: global.black1,
                    //
                    //         borderRadius: BorderRadius.circular(10)
                    //     ),
                    //     child: DropdownButton<String>(
                    //       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    //       isExpanded: true,
                    //       underline: Container(),
                    //       value: quanhuyenSelected,
                    //       onChanged: (value) async{
                    //         quanhuyenSelected = value.toString();
                    //         setState(() {
                    //
                    //         });
                    //       },
                    //       hint: Padding(
                    //         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    //         child: Text('Quận/ Huyện', style: TextStyle(color: global.grey),),
                    //       ),
                    //       icon: Icon(Icons.arrow_drop_down, color: global.gold,),
                    //       items: List.generate(
                    //           listQH.length, (index){
                    //         return DropdownMenuItem(
                    //           value: listQH[index]['slug'].toString(),
                    //           child: Container(
                    //             alignment: Alignment.centerLeft,
                    //             child: Text(
                    //               listQH[index]['title'],
                    //               style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //       ),
                    //       selectedItemBuilder: (BuildContext context) => listQH
                    //           .map((item) => Align(
                    //           alignment: Alignment.centerLeft,
                    //           child: Text(
                    //             item['title'],
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               color: global.grey,
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           )
                    //       )).toList(),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    //   child: Text('Phường/ Xã', style: TextStyle(color: global.gold,fontSize: 18,fontWeight: FontWeight.bold),),
                    // ),
                    // Container(
                    //   child: DecoratedBox(
                    //     decoration: BoxDecoration(
                    //         color: global.black1,
                    //
                    //         borderRadius: BorderRadius.circular(10)
                    //     ),
                    //     child: DropdownButton<String>(
                    //       padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    //       isExpanded: true,
                    //       underline: Container(),
                    //       value: phuongxaSelected,
                    //       onChanged: (value) async{
                    //         phuongxaSelected = value.toString();
                    //         setState(() {
                    //
                    //         });
                    //       },
                    //       hint: Padding(
                    //         padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    //         child: Text('Phường/ Xã',style: TextStyle(color: global.grey),),
                    //       ),
                    //       icon: Icon(Icons.arrow_drop_down, color: global.gold,),
                    //       items: List.generate(
                    //           listPX.length, (index){
                    //         return DropdownMenuItem(
                    //           value: listPX[index]['slug'].toString(),
                    //           child: Container(
                    //             alignment: Alignment.centerLeft,
                    //             child: Text(
                    //               listPX[index]['title'],
                    //               style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
                    //             ),
                    //           ),
                    //         );
                    //       }
                    //       ),
                    //       selectedItemBuilder: (BuildContext context) => listPX
                    //           .map((item) => Align(
                    //           alignment: Alignment.centerLeft,
                    //           child: Text(
                    //             item['title'],
                    //             style: TextStyle(
                    //               fontSize: 16,
                    //               color: Colors.black.withOpacity(0.9),
                    //               overflow: TextOverflow.ellipsis,
                    //             ),
                    //           )
                    //       )).toList(),
                    //     ),
                    //   ),
                    // ),
                    // Padding(
                    //   padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                    //   child: Text('Địa chỉ cụ thể', style: TextStyle(color: global.gold,fontSize: 18,fontWeight: FontWeight.bold),),
                    // ),
                    // TextField(
                    //   decoration: InputDecoration(
                    //       filled: true,
                    //       fillColor: global.black1,
                    //       enabledBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: global.black1
                    //         ),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderSide: BorderSide(
                    //             color: Colors.grey
                    //         ),
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)
                    //   ),
                    //   cursorColor: Colors.grey,
                    //   style: TextStyle(color: global.grey),
                    //   obscureText: false,
                    // ),
                  ],
                ),
              ),
              InkWell(
                onTap: (){
                  updateinfo();
                },
                child: Container(
                  height: 50,
                  margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
                  decoration: BoxDecoration(
                      color: global.gold,
                      borderRadius: BorderRadius.circular(20)
                  ),
                  child: Center(
                    child: Text('Lưu', style: TextStyle(fontSize: 16, color: global.black, fontWeight: FontWeight.bold),),
                  ),
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
            ]
        ),
      ),
    );
  }
}
