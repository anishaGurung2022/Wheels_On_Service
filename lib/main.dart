import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/controller/category_controller.dart';
import 'package:wheels_on_service/controller/service_controller.dart';
import 'package:wheels_on_service/views/pages/login_page.dart';
//import 'package:wheels_on_service/views/pages/loader.dart';
//import 'package:wheels_on_service/views/pages/welcomepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //calling the GetX Controller classes so that data are fetched in start
  Get.put(Authentication()); //fetches token
  Get.put(CategoryController()); // fetches categories
  Get.put(ServiceController());
  //Get.put(CartController());
  runApp(GetMaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
