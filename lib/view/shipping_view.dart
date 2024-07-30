import 'package:deliveryshipper/view/pickup_address_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:deliveryshipper/class/global.dart' as global;

class ShippingView extends StatefulWidget {
  const ShippingView({super.key});

  @override
  State<ShippingView> createState() => _ShippingViewState();
}

class _ShippingViewState extends State<ShippingView> {
  String? trongluongSelected;
  List listTL=[
    {'slug':'duoi-20-kg','title':'Dưới 20kg'},
    {'slug':'20kg-30kg','title':'20kg đến 30kg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: global.black,
        title: Text('Gửi hàng',style: TextStyle(color: global.gold, fontWeight: FontWeight.bold),),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      color: global.black,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(

                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),

                          child: Text('Thông tin kiện hàng', style: TextStyle(fontSize: 16, color: global.gold, fontWeight: FontWeight.bold),),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child: Text('HÀNG CẦN GỬI- MUA HỘ', style: TextStyle( color: global.gold, fontSize: 16,fontWeight: FontWeight.bold),),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                              fillColor: global.black1,
                              hintText: 'Món hàng bạn cần gửi là gì?',
                              hintStyle: TextStyle(color: global.grey),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: global.black1,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: global.grey,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              contentPadding: EdgeInsets.fromLTRB(25, 2, 2, 2)
                          ),
                          cursorColor: global.grey,
                          style: TextStyle(color: global.grey),
                          obscureText: false,

                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 5),
                          child: Text('Trọng lượng', style: TextStyle(color: global.gold, fontSize: 16,fontWeight: FontWeight.bold),),
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
                                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                                isExpanded: true,
                                underline: Container(),
                                value: trongluongSelected,
                                onChanged: (value) async{
                                  trongluongSelected = value.toString();
                                  setState(() {

                                  });
                                },
                                icon: Icon(Icons.arrow_drop_down, color: global.gold,),
                                items: List.generate(
                                    listTL.length, (index){
                                  return DropdownMenuItem(
                                    value: listTL[index]['slug'].toString(),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        listTL[index]['title'],
                                        style: TextStyle(fontSize: 16, color: Colors.black.withOpacity(0.8)),
                                      ),
                                    ),
                                  );
                                }
                                ),
                                selectedItemBuilder: (BuildContext context) => listTL
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
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: global.black,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: global.black,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text('Lấy hàng tại', style: TextStyle(fontSize: 16, color: global.gold, fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FaIcon(FontAwesomeIcons.circleUser,color: global.gold,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('  Người gửi', style: TextStyle(color: global.gold,fontSize: 16),),
                                  Text('  Di Di', style: TextStyle(color: global.gold, fontSize: 16, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                    backgroundColor: global.black,
                                    context: context,
                                    builder: (context){
                                      return Container(
                                        height: 250,
                                        decoration: BoxDecoration(
                                            color: global.black
                                        ),
                                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Thông tin người gửi', style: TextStyle(fontSize: 16, color: global.gold, fontWeight: FontWeight.bold),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Họ & tên', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                                                Text('*', style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            TextField(
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
                                                  contentPadding: EdgeInsets.fromLTRB(25, 2, 2, 2)
                                              ),
                                              cursorColor: global.grey,
                                              style: TextStyle(color: global.grey),
                                              obscureText: false,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Số điện thoại', style: TextStyle(color: global.gold,fontSize: 16,fontWeight: FontWeight.bold),),
                                                Text('*', style: TextStyle(fontSize: 16,color: Colors.red,fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            TextField(
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
                                                  contentPadding: EdgeInsets.fromLTRB(25, 2, 2, 2)
                                              ),
                                              cursorColor: global.grey,
                                              style: TextStyle(color: global.grey),
                                              obscureText: false,
                                              keyboardType: TextInputType.number,
                                            ),
                                            InkWell(
                                              onTap: (){

                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: global.gold,
                                                        width: 1
                                                    ),
                                                    borderRadius: BorderRadius.circular(30),
                                                    color: global.gold
                                                ),
                                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text('Xong',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 16),),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                              child: FaIcon(FontAwesomeIcons.pencil, color: global.gold,),
                            )
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
                                      Text('  Địa chỉ lấy hàng', style: TextStyle(color: global.gold,fontSize: 16),),
                                      Text('*', style: TextStyle(fontSize: 16,color: Colors.red),),
                                    ],
                                  ),
                                  Text('  Thông tin địa chỉ', style: TextStyle(color: global.gold,fontSize: 16, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            FaIcon(FontAwesomeIcons.pencil, color: global.gold,),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: global.black,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: global.black,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text('Giao hàng đến', style: TextStyle(fontSize: 16, color: global.gold, fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FaIcon(FontAwesomeIcons.circleUser,color: global.gold,),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('  Người nhận', style: TextStyle(color: global.gold,fontSize: 16),),
                                  Text('  Duy Duy', style: TextStyle(color: global.gold,fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                    backgroundColor: global.black,
                                    context: context,
                                    builder: (context){
                                      return Container(
                                        height: 250,
                                        decoration: BoxDecoration(
                                            color: global.black
                                        ),
                                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                                        margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Thông tin người nhận', style: TextStyle(fontSize: 18, color: global.gold, fontWeight: FontWeight.bold),),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Họ & tên', style: TextStyle(color: global.gold,fontSize: 18,fontWeight: FontWeight.bold),),
                                                Text('*', style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            TextField(
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
                                                  contentPadding: EdgeInsets.fromLTRB(25, 2, 2, 2)
                                              ),
                                              cursorColor: global.grey,
                                              style: TextStyle(color: global.grey),
                                              obscureText: false,
                                            ),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Số điện thoại', style: TextStyle(color: global.gold,fontSize: 18,fontWeight: FontWeight.bold),),
                                                Text('*', style: TextStyle(fontSize: 18,color: Colors.red,fontWeight: FontWeight.bold),),
                                              ],
                                            ),
                                            TextField(
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
                                                  contentPadding: EdgeInsets.fromLTRB(25, 2, 2, 2)
                                              ),
                                              cursorColor: global.grey,
                                              style: TextStyle(color: global.grey),
                                              obscureText: false,
                                              keyboardType: TextInputType.number,
                                            ),
                                            InkWell(
                                              onTap: (){

                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: global.gold,
                                                        width: 1
                                                    ),
                                                    borderRadius: BorderRadius.circular(30),
                                                    color: global.gold
                                                ),
                                                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                  children: [
                                                    Text('Xong',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 18),),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      );
                                    }
                                );
                              },
                              child: FaIcon(FontAwesomeIcons.pencil, color: global.gold,),
                            )
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
                                      Text('  Địa chỉ giao hàng', style: TextStyle(color: global.gold,fontSize: 16),),
                                      Text('*', style: TextStyle(fontSize: 18,color: Colors.red),),
                                    ],
                                  ),
                                  Text('  Thông tin địa chỉ', style: TextStyle(color: global.gold,fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                            FaIcon(FontAwesomeIcons.pencil, color: global.gold,),
                          ],
                        ),

                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: global.black,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: global.black,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Text('Loại giao hàng', style: TextStyle(fontSize: 18, color: global.gold, fontWeight: FontWeight.bold),),
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
                                  Text('  Giao hàng hoả tốc', style: TextStyle(color: global.gold,fontSize: 18, fontWeight: FontWeight.bold),),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: global.black,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: global.black,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('Khuyến mãi', style: TextStyle(fontSize: 18, color: global.gold, fontWeight: FontWeight.bold),),
                        ),
                        InkWell(
                          onTap: (){

                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: global.black1,
                                    width: 1
                                ),
                                borderRadius: BorderRadius.circular(10),
                              color: global.black1
                            ),
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            // margin: EdgeInsets.fromLTRB(0, 10, 0, 10),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Chọn mã khuyến mãi', style: TextStyle(fontSize: 18, color: global.gold),),
                                  ],
                                ),
                                Text('Chọn', style: TextStyle(fontSize: 18, color: global.gold),),
                              ],
                            ),

                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: global.black,
                          width: 1
                      ),
                      borderRadius: BorderRadius.circular(10),
                      color: global.black,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('Thu hộ', style: TextStyle(fontSize: 18, color: global.gold, fontWeight: FontWeight.bold),),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                              fillColor: global.black1,
                              hintText: 'Nhập số xu thu hộ',
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
                              contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),
                              suffixText: 'đ'
                          ),
                          cursorColor: global.grey,
                          style: TextStyle(color: global.grey),
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: global.black,
                    ),
                    padding: EdgeInsets.fromLTRB(20, 0, 20, 10),
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text('Ghi chú', style: TextStyle(fontSize: 16, color: global.gold, fontWeight: FontWeight.bold),),
                        ),
                        TextField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: global.black1,
                            hintText: 'Bạn có cần gì đặt biệt không?',
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
                            contentPadding: EdgeInsets.fromLTRB(10, 2, 10, 2),

                          ),
                          cursorColor: global.grey,
                          style: TextStyle(color: global.grey),
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: global.black1,
              ),
              padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              color: global.gold,
                              width: 1
                          )
                      ),
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: global.gold,
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(5),

                          ),
                        ),
                        Text('  Người gửi nhận trả ship', style: TextStyle(color: global.gold, fontSize: 16),)
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Tổng phí vận chuyển', style: TextStyle(fontSize: 16,color: global.gold),),
                            Text('đ', style: TextStyle(fontSize: 16,color: global.gold),),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Chi phí vận chuyển( Km)', style: TextStyle(fontSize: 16,color: global.gold),),
                            Text('đ', style: TextStyle(fontSize: 16,color: global.gold),),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(30),
                        color: global.gold
                    ),
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    margin: EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Đặt đơn',style: TextStyle(fontWeight: FontWeight.bold, color: global.black, fontSize: 16),),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )

      ),
    );
  }
}
