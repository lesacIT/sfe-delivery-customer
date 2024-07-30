import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PickupAddressView extends StatefulWidget {
  const PickupAddressView({super.key});

  @override
  State<PickupAddressView> createState() => _PickupAddressViewState();
}

class _PickupAddressViewState extends State<PickupAddressView> {
  //var
  TextEditingController addressController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Địa chỉ lấy hàng',style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white.withOpacity(0.1),
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 500,
              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(30),

              ),
              //padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              //margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                    hintText: 'Địa chỉ lấy hàng',
                    hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.fromLTRB(25, 2, 2, 2),

                ),
                cursorColor: Colors.grey,
                style: TextStyle(color: Colors.black),

              ),
            ),
            Container(
              width: 210,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.cyan.shade900.withOpacity(0.3),
                    width: 1.5
                ),
                borderRadius: BorderRadius.circular(10),

              ),
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
              margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FaIcon(FontAwesomeIcons.mapLocationDot, color: Colors.red.withOpacity(0.8),),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('  Chọn trên bản đồ', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 85,
              padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
              //margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex:1,

                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(

                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.cyan.shade900.withOpacity(0.4),
                                  width: 1,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(FontAwesomeIcons.house,color: Colors.red,),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(' Địa chỉ nhà', style: TextStyle(color: Colors.grey,fontSize: 18),),
                                        Expanded(
                                          child: Text(' Chi tiết địa chỉ nhà', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black,fontSize: 18),),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                  ),
                  Expanded(
                      flex:1,

                      child: InkWell(
                        onTap: (){

                        },
                        child: Container(

                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.cyan.shade900.withOpacity(0.4),
                                  width: 1,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)

                            ),
                            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                FaIcon(FontAwesomeIcons.crosshairs,color: Colors.red,),
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(' Định vị', style: TextStyle(color: Colors.grey,fontSize: 18),),
                                        Expanded(
                                          child: Text(' Vị trí của tôi', maxLines: 1, overflow: TextOverflow.ellipsis, style: TextStyle(color: Colors.black,fontSize: 18),),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                        ),
                      )
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
