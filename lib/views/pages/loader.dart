import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/utils/constants.dart';
import '../../utils/shared_prefs.dart';
import 'landing_page.dart';
import 'login_page.dart';

class Loader extends StatefulWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  State<Loader> createState() => _LoaderState();
}

class _LoaderState extends State<Loader> {
  final AuthService authService = AuthService();
  @override
  void initState() {
    super.initState();
    checkifAuthenticated();
  }

  checkifAuthenticated() async {
    await Future.delayed(const Duration(seconds: 3));
    var token = await authService.getToken();
    if (token != null) {
      Get.offAll(const LandingPage());
    } else {
      Get.offAll(LoginPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
                height: 150,
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      //shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.jpg'),
                          fit: BoxFit.fill)),
                )),
          )
        ],
      ),
    );
  }
}
