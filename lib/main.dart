import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'views/pages/loader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //final prefs = await SharedPreferences.getInstance();
  runApp(const GetMaterialApp(
    home: Loader(),
    debugShowCheckedModeBanner: false,
  ));
}
