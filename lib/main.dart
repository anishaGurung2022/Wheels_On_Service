import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khalti/khalti.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/controller/cart_controller.dart';
import 'package:wheels_on_service/controller/category_controller.dart';
import 'package:wheels_on_service/controller/service_center_controller.dart';
import 'package:wheels_on_service/controller/service_controller.dart';
import 'package:wheels_on_service/views/pages/loader.dart';
import 'package:wheels_on_service/views/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //calling the GetX Controller classes so that data are fetched in start
  await Khalti.init(
      publicKey: "test_public_key_2b6e271bdf5b4ca09fe296eb82c79a8a",
      enabledDebugging: false);
  Get.put(Authentication()); //fetches token
  Get.put(CategoryController()); // fetches categories
  Get.put(ServiceController());
  Get.put(ServiceCenterController());
  Get.put(CartController());
  runApp(GetMaterialApp(
    home: LoginPage(),
    debugShowCheckedModeBanner: false,
  ));
}
