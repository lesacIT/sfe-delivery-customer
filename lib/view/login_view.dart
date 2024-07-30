import 'package:deliveryshipper/controller/auth_controller.dart';
import 'package:deliveryshipper/view/main_view.dart';
import 'package:deliveryshipper/view/register_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart' as global;

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  //var
  AuthController authController=Get.find();
  TextEditingController phoneController=TextEditingController(text: '');
  TextEditingController passwordController=TextEditingController(text: '');

  //method

  login() async {
    if (
        phoneController.text.isEmpty) {
      global.showError(
          'Vui lòng nhập số điện thoại');
    }
    else if (
        passwordController.text.isEmpty) {
      global.showError(
          'Vui lòng nhập mật khẩu');
    }
    else {
      global.showLoading();
      dynamic data = await authController.postLogin(phoneController.text, passwordController.text);
      global.hideLoading();
      if (data['error'] == true) {
        global.showError(data['message']);
      }
      else {
        global.showSuccess(data['message']);
        global.token = data['data']['token'];
        global.user = data['data']['data'];
        Get.to(() => MainView());
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
                     color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(0),
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 200,
                              height: 200,
                              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Image.asset('assets/logo1.png')
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                            child: Text('ĐĂNG NHẬP', style: TextStyle(fontSize: 21, color: global.gold,fontWeight: FontWeight.bold),),
                          ),
                          Container(
                              margin: EdgeInsets.zero,
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Vui lòng nhập số điện thoại đã đăng ký', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: global.gold),),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text('Số điện thoại', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
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
                                      cursorColor: Colors.grey,
                                      style: TextStyle(color: global.grey),
                                      obscureText: false,
                                      keyboardType: TextInputType.number,

                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Mật Khẩu', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: global.gold),),
                                              Text('*', style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                                            ],
                                          ),
                                          Text('Quên mật khẩu?', style: TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                    TextField(
                                      controller: passwordController,
                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: global.black1,
                                          hintText: 'Nhập mật khẩu',
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
                                      obscureText: true,
                                    ),
                                    InkWell(
                                      onTap: (){
                                        login();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: global.gold,
                                        ),
                                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('Đăng nhập',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 16),),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('Bạn chưa có tài khoản? ', style: TextStyle(fontSize: 16, color: global.gold),),
                                          InkWell(
                                            onTap: (){
                                              Get.to(()=>RegisterView());
                                            },
                                            child: Text(' Đăng ký ngay', style: TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                    ],
                  )
              ),
            ),
          )
        ],
      ),
    );
  }
}
