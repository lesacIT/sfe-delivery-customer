import 'package:bot_toast/bot_toast.dart';
import 'package:deliveryshipper/controller/auth_controller.dart';
import 'package:deliveryshipper/controller/map_controller.dart';
import 'package:deliveryshipper/controller/notification_controller.dart';
import 'package:deliveryshipper/controller/order_controller.dart';
import 'package:deliveryshipper/controller/review_controller.dart';
import 'package:deliveryshipper/view/login_view.dart';
import 'package:deliveryshipper/view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SFE Delivery Customer',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const AppView(),
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  //var
  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentView=const LoginView();
  final authController=Get.put(AuthController());
  final notification=Get.put(NotificationController());
  final order=Get.put(OrderController());
  final reviewController=Get.put(ReviewController());
  final mapController=Get.put(MapController());

  //method
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentView,
      ),
    );
  }
}

