import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/utils/constants.dart';
import 'package:wheels_on_service/views/components/my_button.dart';

class ProfilePage extends StatelessWidget {
  final authentication = Get.find<Authentication>();
  ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: primaryColor,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 60),
            // child: InkWell(
            //   onTap: () => Get.to(() => CartPage()),
            //   child: Badge(
            //     badgeContent: Obx(() => SizedBox(
            //         child: Text(cartController.cart.length.toString()))),
            //     child: const Icon(Icons.shopping_cart),
            //   ),
            // ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            width: 200,
            child: MyButton(
              buttonName: 'Logout',
              onTap: () => logout(),
            ),
          ),
        ],
      ),
    );
  }

  logout() async {
    await authentication.logout();
  }
}
