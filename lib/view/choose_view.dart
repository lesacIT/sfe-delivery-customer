import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
class ChooseView extends StatefulWidget {
  const ChooseView({super.key});

  @override
  State<ChooseView> createState() => _ChooseViewState();
}

class _ChooseViewState extends State<ChooseView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Chọn xe',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.orangeAccent.withOpacity(0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
              //margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (){
                     // Get.to(()=>CallCarView());
                    },
                    child:  Container(
                      width: double.infinity,
                        height: 80,
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.motorcycle,color: Colors.red,),
                            Text('Xe máy', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        )
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      //Get.to(()=>CallCarView());
                    },
                    child: Container(
                        width: double.infinity,
                        height: 80,
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.carSide,color: Colors.red,),
                            Text('Xe 4 chỗ', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        )
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      //Get.to(()=>CallCarView());
                    },
                    child: Container(
                        width: double.infinity,
                        height: 80,
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.red,
                              width: 1,
                            ),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FaIcon(FontAwesomeIcons.car,color: Colors.red,),
                            Text('Xe 7 chỗ', style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 20),),
                          ],
                        )
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
