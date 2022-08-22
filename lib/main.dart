import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/views/pages/loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(Authentication());
  runApp(const GetMaterialApp(
    home: Loader(),
    debugShowCheckedModeBanner: false,
  ));
}
