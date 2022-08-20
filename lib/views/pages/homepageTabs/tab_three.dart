import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/utils/shared_prefs.dart';
import 'package:wheels_on_service/views/pages/loader.dart';

class TabThree extends StatelessWidget {
  final AuthService authService = AuthService();
  TabThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 150, 218, 231),
        body: Column(
          children: [
            ElevatedButton(
                onPressed: () => logout(), child: const Text("Logout")),
          ],
        ),
      ),
    );
  }

  logout() async {
    await authService.removeToken();
    Get.offAll(const Loader());
  }
}
