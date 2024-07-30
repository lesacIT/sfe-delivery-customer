import 'package:deliveryshipper/controller/auth_controller.dart';
import 'package:deliveryshipper/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart' as global;


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  //var
  AuthController authController=Get.find();
  TextEditingController nameController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController confirm_passwordController=TextEditingController();


  bool showCheck=false;


  //method

  String? loaiTKSelected;
  List listLTK=[
    {'slug':'ca-nhan','title':'Cá nhân'},
    {'slug':'cua-hang','title':'Cửa hàng'},
  ];

  Register() async {
    if (nameController.text.isEmpty) {
      global.showError('Vui lòng nhập họ và tên');
    }
    else if (phoneController.text.isEmpty) {
      global.showError('Vui lòng nhập số điện thoại');
    }
    else if (phoneController.text[0]!='0' || phoneController.text.length!=10) {
      global.showError('Số điện thoại không đúng định dạng');
    }
    else if (passwordController.text.isEmpty) {
      global.showError('Vui lòng nhập mật khẩu');
    }
    else if (passwordController.text != confirm_passwordController.text) {
      global.showError('Nhập lại mật khẩu không chính xác');
    }
    else if (showCheck==false) {
      global.showError ('Vui lòng xác nhận đồng ý với điều khoản');
    }

    else {
      dynamic data = await authController.postRegister( nameController.text, phoneController.text, passwordController.text,confirm_passwordController.text);
      if (data['error'] == true) {
        global.showError(data['message']);
      }
      else {
        global.showSuccess(data['message']);
        Get.back();
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(global.backgroundImage),
                    fit: BoxFit.fill
                ),
                borderRadius: BorderRadius.circular(0)
            ),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 167,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(0)
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 169,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(0)
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 169,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(0)
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 165,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(0)
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 169,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(global.backgroundImage),
                          fit: BoxFit.fill
                      ),
                      borderRadius: BorderRadius.circular(0)
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    //
                  color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)
                ),
                margin: EdgeInsets.fromLTRB(20, 0, 20, 0),

                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                  children: [
                    Text('ĐĂNG KÝ', textAlign: TextAlign.center, style: TextStyle(color: global.gold,fontSize: 23,fontWeight: FontWeight.bold),),
                    Text('Vui lòng nhập các thông tin bên dưới', textAlign: TextAlign.center,style: TextStyle(color: global.gold.withOpacity(0.8), fontSize: 16),),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Họ & tên', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('*', style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        filled: true,
                          fillColor: global.black1,
                          hintText: 'Nguyễn Văn A',
                          hintStyle: TextStyle(color: global.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: global.black1
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: global.grey
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)
                      ),
                      cursorColor: global.grey,
                      style: TextStyle(color: global.grey),
                      obscureText: false,

                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Số điện thoại zalo', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('*', style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: global.black1,
                          hintText: 'VD: 0776301209',
                          hintStyle: TextStyle(color: global.grey),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: global.black1
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: global.grey
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)
                      ),
                      cursorColor: global.grey,
                      style: TextStyle(color: global.grey),
                      obscureText: false,
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Loại tài khoản', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('*', style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                      child: Container(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              color:global.black1,
                              border: Border.all(

                                  width: 1,
                                  color: global.black1
                              ),
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: DropdownButton<String>(
                            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            isExpanded: true,
                            underline: Container(),
                            value: loaiTKSelected,
                            onChanged: (value) async{
                              loaiTKSelected = value.toString();
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.arrow_drop_down, color: global.gold,),
                            items: List.generate(
                                listLTK.length, (index){
                              return DropdownMenuItem(
                                value: listLTK[index]['slug'].toString(),
                                child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    listLTK[index]['title'],
                                    style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
                                  ),
                                ),
                              );
                            }
                            ),
                            selectedItemBuilder: (BuildContext context) => listLTK
                                .map((item) => Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item['title'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: global.grey,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                            )).toList(),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Mật Khẩu', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('*', style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    TextField(
                      controller: passwordController,
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
                                color: global.grey
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)
                      ),
                      cursorColor: global.grey,
                      style: TextStyle(color: global.grey),
                      obscureText: true,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Nhập lại mật khẩu', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                          Text('*', style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    TextField(
                      controller: confirm_passwordController,
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
                                color: global.grey
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          contentPadding: EdgeInsets.fromLTRB(10, 2, 2, 2)
                      ),
                      cursorColor: global.grey,
                      style: TextStyle(color: global.grey),
                      obscureText: true,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 0, 5, 0),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: global.gold,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(5),

                              ),
                              child: InkWell(
                                onTap: (){
                                  showCheck=!showCheck;
                                  setState(() {

                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(6, 3, 0, 0),
                                  child: showCheck==false?Container():FaIcon(FontAwesomeIcons.check,size: 20,color: global.gold),
                                )

                            ),
                            ),
                          ),
                          Expanded(
                            child: Text('Tôi đồng ý với các quy chế sử dụng và chính sách bảo mật', style: TextStyle(color: global.gold,fontSize: 17),),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Register();
                      },
                      child: Container(
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(30),
                          color: global.gold,
                        ),
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Đăng ký',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('Bạn đã có tài khoản? ', style: TextStyle(fontSize: 16, color: global.gold),),
                          InkWell(
                            onTap: (){
                              Get.back();
                            },
                            child: Text(' Đăng nhập ngay', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
