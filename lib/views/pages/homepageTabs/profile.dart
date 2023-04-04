import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheels_on_service/controller/authentication_controller.dart';
import 'package:wheels_on_service/controller/details_controller.dart';
import 'package:wheels_on_service/model/customer_model.dart';
import 'package:wheels_on_service/utils/constants.dart';
//import 'package:wheels_on_service/views/components/my_button.dart';
import 'package:wheels_on_service/views/components/profile_component.dart';

class ProfilePage extends StatelessWidget {
  final authentication = Get.find<Authentication>();
  final CustomerController customerController = Get.put(CustomerController());
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
      body: Obx(() => Wrap(
          children: customerController.details.value
              .map((Customer customerDetails) =>
                  ProfileComponent(customer: customerDetails))
              .toList())),
    );
  }
}
